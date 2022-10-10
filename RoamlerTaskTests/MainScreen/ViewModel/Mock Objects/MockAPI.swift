//
//  MockAPI.swift
//  RoamlerTaskTests
//
//  Created by Erdinc Kolukisa on 10/9/22.
//

import Foundation
import Combine
@testable import RoamlerTask

final class MockAPI: Networking {
	
	var fetchResult: AnyPublisher<[Recipe], NetworkError>!
	
	func fetchRecipes() throws -> AnyPublisher<[Recipe], NetworkError> {
		return fetchResult
	}
}
