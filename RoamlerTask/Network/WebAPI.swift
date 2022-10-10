//
//  WebAPI.swift
//  RoamlerTask
//
//  Created by Erdinc Kolukisa on 10/7/22.
//

import Foundation
import Combine

final class WebAPI: Networking {
	
	private var urlComponents = URLComponents()
	
	init() {
		urlComponents.scheme = "https"
		urlComponents.host = "api.spoonacular.com"
		urlComponents.path = "/recipes/findByIngredients"
	}
	
	private func createQueryItems() -> [URLQueryItem] {
		var queryItems = [URLQueryItem]()
		
		queryItems.append(URLQueryItem(name: "apiKey", value: Constants.ApiRequest.apiKey))
		queryItems.append(URLQueryItem(name: "number", value: "20"))
		queryItems.append(URLQueryItem(name: "ingredients", value: "beer"))
		
		return queryItems
	}
	
	func fetchRecipes() throws -> AnyPublisher<[Recipe], NetworkError> {
		urlComponents.queryItems = createQueryItems()
		guard let url = urlComponents.url else {
			throw NetworkError.urlError
		}

		return sendData(url: url)
	}
	
	private func sendData<T: Decodable>(url: URL) -> AnyPublisher<T, NetworkError> {
		return URLSession.shared.dataTaskPublisher(for: url)
			.receive(on: DispatchQueue.main)
			.tryMap(handleOutput)
			.decode(type: T.self, decoder: JSONDecoder())
			.mapError { error -> NetworkError in
				return NetworkError.decodingError
			}
			.eraseToAnyPublisher()
	}
	
	private func handleOutput(_ output: URLSession.DataTaskPublisher.Output) throws -> Data {
		guard let response = output.response as? HTTPURLResponse else {
			throw NetworkError.unknownResponseStatus
		}
		
		guard response.statusCode >= 200 && response.statusCode <= 300 else {
			throw NetworkError.responseError(message: URLError.errorDomain)
		}
		
		return output.data
	}
}
