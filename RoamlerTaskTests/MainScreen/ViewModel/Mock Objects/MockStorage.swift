//
//  MockStorage.swift
//  RoamlerTaskTests
//
//  Created by Erdinc Kolukisa on 10/9/22.
//

import Foundation
import Combine
@testable import RoamlerTask

final class MockStorage: Persistable {
	
	func saveRecipes(_ recipes: [Recipe]) -> AnyPublisher<Void, Never> {
		return Result.success(())
			.publisher
			.eraseToAnyPublisher()
	}
	
	func fetchRecipes(completion: @escaping (Result<[RoamlerTask.Recipe], RoamlerTask.NetworkError>) -> Void) {
		
	}
}
