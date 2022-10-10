//
//  Persistable.swift
//  RoamlerTask
//
//  Created by Erdinc Kolukisa on 10/9/22.
//

import Foundation
import Combine

protocol Persistable {
	func saveRecipes(_ recipes: [Recipe]) -> AnyPublisher<Void, Never>
	func fetchRecipes(completion: @escaping (Result<[Recipe], NetworkError>) -> Void)
}
