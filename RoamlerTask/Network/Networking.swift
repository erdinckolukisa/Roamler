//
//  Networking.swift
//  RoamlerTask
//
//  Created by Erdinc Kolukisa on 10/7/22.
//

import Foundation
import Combine

protocol Networking {
	func fetchRecipes() throws -> AnyPublisher<[Recipe], NetworkError>
}
