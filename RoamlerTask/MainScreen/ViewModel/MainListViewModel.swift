//
//  MainListViewModel.swift
//  RoamlerTask
//
//  Created by Erdinc Kolukisa on 10/7/22.
//

import Foundation
import Combine
import Reachability

final class MainListViewModel: ObservableObject {
	
	private let api: Networking
	private let persistance: Persistable
	private var cancellables = Set<AnyCancellable>()
	
	@Published var recipes: [Recipe] = []
	@Published var hasError = false
	
	init(api: Networking, persistence: Persistable) {
		self.api = api
		self.persistance = persistence
	}
	
	func fetchRecipes() {
		if NetworkManager.sharedInstance.reachability.connection != Reachability.Connection.unavailable {
			fetchRecipesFromAPI()
		} else {
			fetchRecipesFromStorage()
		}
	}
	
	private func fetchRecipesFromAPI() {
		do {
			try api.fetchRecipes()
				.sink(receiveCompletion: { [weak self] completion in
					guard let self = self else { return }
					 
					switch completion {
						case .failure( _ ):
							self.hasError = true
						default:
							break
					}
				}, receiveValue: { [weak self] recipes in
					guard let self = self else { return }
					
					self.recipes = recipes
					self.persistance.saveRecipes(recipes)
						.sink(receiveValue: { _ in })
						.store(in: &self.cancellables)
				})
				.store(in: &cancellables)
			
		} catch {
			hasError = true
		}
	}
	
	private func fetchRecipesFromStorage() {
		persistance.fetchRecipes { [weak self] result in
			guard let self = self else { return }

			switch result {
				case .success(let recipes):
					self.recipes = recipes
				case .failure( _ ):
					self.hasError = true
			}
		}
	}
}
