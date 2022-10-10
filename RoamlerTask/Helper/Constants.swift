//
//  Constants.swift
//  RoamlerTask
//
//  Created by Erdinc Kolukisa on 10/7/22.
//

import Foundation

enum Constants {
	
	enum Error {
		static let generic = "An error occured. Please try again later."
		static let storage = "An error occured with storage. Please try again later."
	}
	
	enum ApiRequest {
		static let apiKey = "2ea3f71b144c47d4810c30b4d78e88e2"
	}
}

enum NetworkError: Error {
	case urlError
	case decodingError
	case unknownResponseStatus
	case responseError(message: String)
	case persistanceError(messsage: String)
	
	var description: String {
		switch self {
			case .urlError:
				return "Invalid URL"
			case .decodingError:
				return "Object couldn't be mapped"
			case .unknownResponseStatus:
				return "Unknown response"
			case .responseError(let error):
				return error.localizedLowercase
			case .persistanceError(let error):
				return error.localizedLowercase
		}
	}
}
