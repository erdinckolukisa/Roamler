//
//  DetailViewModel.swift
//  RoamlerTask
//
//  Created by Erdinc Kolukisa on 10/7/22.
//

import Foundation

final class RecipeDetailViewModel {
	
	private let recipe: Recipe
	
	init(recipe: Recipe) {
		self.recipe = recipe
	}
	
	var imageURL: URL? {
		guard let url = recipe.image, let imageURL = URL(string: url) else {
			return nil
		}
		
		return imageURL
	}
	
	var recipeName: String {
		return recipe.title
	}
	
	var likeCount: String {
		guard let likeCount = recipe.likes else {
			return "0 like"
		}
		
		return likeCount > 1 ? "\(likeCount) likes" : "\(likeCount) like"
	}
	
	var shouldDisplayUsedIngredients: Bool {
		return (recipe.usedIngredientCount ?? 0) > 0
	}
	
	var usedIngredients: [Ingredient] {
		return recipe.usedIngredients ?? [Ingredient]()
	}
}

extension RecipeDetailViewModel {
	static func dummyViewModel() -> RecipeDetailViewModel {
		return RecipeDetailViewModel(recipe: Recipe.mockRecipe())
	}
}
