//
//  CoreDataStorage.swift
//  RoamlerTask
//
//  Created by Erdinc Kolukisa on 10/9/22.
//

import UIKit
import Combine
import CoreData

final class CoreDataStorage: Persistable {
	
	private let context: NSManagedObjectContext
	private let container: NSPersistentContainer
	
	init() {
		container = NSPersistentContainer(name: "RoamlerTask")
		context = container.viewContext
		container.loadPersistentStores(completionHandler: { (storeDescription, error) in
			if let error = error as NSError? {
				fatalError("Unresolved error \(error), \(error.userInfo)")
			}
		})
		container.viewContext.automaticallyMergesChangesFromParent = true
	}
	
	func saveRecipes(_ recipes: [Recipe]) -> AnyPublisher<Void, Never> {
		
		deleteAllRecipes()
		
		for recipe in recipes {
			
			let recipeEntity = RecipeEntity(context: context)
			recipeEntity.id = Int64(recipe.id)
			recipeEntity.likes = Int64(recipe.likes ?? 0)
			recipeEntity.missedIngredientCount = Int64(recipe.missedIngredientCount ?? 0)
			recipeEntity.usedIngredientCount = Int64(recipe.usedIngredientCount ?? 0)
			recipeEntity.image = recipe.image
			recipeEntity.title = recipe.title
			recipeEntity.usedIngredient = createIngredientEntity(from: recipe.usedIngredients)
			recipeEntity.missedIngredient = createIngredientEntity(from: recipe.missedIngredients)
			recipeEntity.unusedIngredient = createIngredientEntity(from: recipe.unusedIngredients)
		}
		
		saveContext()
		
		return Empty()
			.eraseToAnyPublisher()
	}
	
	func fetchRecipes(completion: @escaping (Result<[Recipe], NetworkError>) -> Void) {
		
		let request: NSFetchRequest<RecipeEntity> = RecipeEntity.fetchRequest()

		do {
			let recipeEntities = try context.fetch(request)
			let recipes = recipeEntities.compactMap { entity in
				Recipe(id: Int(entity.id),
					   title: entity.title ?? "",
					   image: entity.image,
					   usedIngredientCount: Int(entity.usedIngredientCount),
					   missedIngredientCount: Int(entity.missedIngredientCount),
					   missedIngredients: createIngredient(from: entity.missedIngredient),
					   usedIngredients: createIngredient(from: entity.usedIngredient),
					   unusedIngredients: createIngredient(from: entity.unusedIngredient),
					   likes: Int(entity.likes))
			}
			
			completion(.success(recipes))
		} catch {
			completion(.failure(.persistanceError(messsage: Constants.Error.storage)))
		}
	}
	
	private func deleteAllRecipes() {
		
		let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "RecipeEntity")
		let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
		try? context.execute(batchDeleteRequest)
		
		saveContext()
	}
	
	private func createIngredientEntity(from ingredients: [Ingredient]?) -> NSSet {
		
		var ingredientEntities = [IngredientEntity]()
		guard let ingredients = ingredients else {
			return NSSet(array: ingredientEntities)
		}
		
		for ingredient in ingredients {
			
			let ingredientEntity = IngredientEntity(context: self.context)
			ingredientEntity.id = Int64(ingredient.id)
			ingredientEntity.amount = Float(ingredient.amount ?? 0.0)
			ingredientEntity.aisle = ingredient.aisle
			ingredientEntity.image = ingredient.image
			ingredientEntity.name = ingredient.name
			ingredientEntity.original = ingredient.original
			ingredientEntity.originalName = ingredient.originalName
			ingredientEntity.unit = ingredient.unit
			ingredientEntity.unitLong = ingredient.unitLong
			
			ingredientEntities.append(ingredientEntity)
		}
		
		return NSSet(array: ingredientEntities)
	}
	
	private func createIngredient(from entities: NSSet?) -> [Ingredient] {
		
		var ingredients = [Ingredient]()
		guard let entities = entities, let entityObjects = entities.allObjects as? [IngredientEntity] else {
			return ingredients
		}
		
		for entity in entityObjects {
			let ingredient = Ingredient(id: Int(entity.id),
										amount: entity.amount,
										unit: entity.unit,
										unitLong: entity.unitLong,
										aisle: entity.aisle,
										name: entity.name,
										original: entity.original,
										originalName: entity.originalName,
										image: entity.image)

			ingredients.append(ingredient)
		}
		
		return ingredients
	}
	
	private func saveContext() {
		
		if self.context.hasChanges {
			try? context.save()
		}
	}
}
