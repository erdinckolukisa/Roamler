//
//  Product.swift
//  RoamlerTask
//
//  Created by Erdinc Kolukisa on 10/7/22.
//

import Foundation

struct Recipe: Identifiable, Codable {
	
	let id: Int
	let title: String
	let image: String?
	let usedIngredientCount: Int?
	let missedIngredientCount: Int?
	let missedIngredients: [Ingredient]?
	let usedIngredients: [Ingredient]?
	let unusedIngredients: [Ingredient]?
	let likes: Int?
}

struct Ingredient: Identifiable, Codable {
	let id: Int
	let amount: Float?
	let unit: String?
	let unitLong: String?
	let aisle: String?
	let name: String?
	let original: String?
	let originalName: String?
	let image: String?
}

//MARK: - Extensions

extension Recipe {
	static func mockRecipe() -> Recipe {
		return Recipe(id: 634726,
					  title: "Beer - Batter Fried Shrimp",
					  image: "https://spoonacular.com/recipeImages/634726-312x231.jpg",
					  usedIngredientCount: 1,
					  missedIngredientCount: 2,
					  missedIngredients: nil,
					  usedIngredients: [Ingredient.mockIngredient(), Ingredient.mockIngredient()],
					  unusedIngredients: nil,
					  likes: 1)
	}
}

extension Ingredient {
	static func mockIngredient() -> Ingredient {
		return Ingredient(id: 15270,
						  amount: 1.5,
						  unit: "pounds",
						  unitLong: "pounds",
						  aisle: "Seafood",
						  name: "shrimp",
						  original: "1 1/2 pounds . shrimp",
						  originalName: "shrimp",
						  image: "https://spoonacular.com/cdn/ingredients_100x100/shrimp.png")
	}
}
