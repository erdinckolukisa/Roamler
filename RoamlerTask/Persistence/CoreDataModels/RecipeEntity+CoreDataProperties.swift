//
//  RecipeEntity+CoreDataProperties.swift
//  RoamlerTask
//
//  Created by Erdinc Kolukisa on 10/10/22.
//
//

import Foundation
import CoreData


extension RecipeEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RecipeEntity> {
        return NSFetchRequest<RecipeEntity>(entityName: "RecipeEntity")
    }

    @NSManaged public var id: Int64
    @NSManaged public var image: String?
    @NSManaged public var likes: Int64
    @NSManaged public var missedIngredientCount: Int64
    @NSManaged public var title: String?
    @NSManaged public var usedIngredientCount: Int64
    @NSManaged public var missedIngredient: NSSet?
    @NSManaged public var unusedIngredient: NSSet?
    @NSManaged public var usedIngredient: NSSet?

}

// MARK: Generated accessors for missedIngredient
extension RecipeEntity {

    @objc(addMissedIngredientObject:)
    @NSManaged public func addToMissedIngredient(_ value: IngredientEntity)

    @objc(removeMissedIngredientObject:)
    @NSManaged public func removeFromMissedIngredient(_ value: IngredientEntity)

    @objc(addMissedIngredient:)
    @NSManaged public func addToMissedIngredient(_ values: NSSet)

    @objc(removeMissedIngredient:)
    @NSManaged public func removeFromMissedIngredient(_ values: NSSet)

}

// MARK: Generated accessors for unusedIngredient
extension RecipeEntity {

    @objc(addUnusedIngredientObject:)
    @NSManaged public func addToUnusedIngredient(_ value: IngredientEntity)

    @objc(removeUnusedIngredientObject:)
    @NSManaged public func removeFromUnusedIngredient(_ value: IngredientEntity)

    @objc(addUnusedIngredient:)
    @NSManaged public func addToUnusedIngredient(_ values: NSSet)

    @objc(removeUnusedIngredient:)
    @NSManaged public func removeFromUnusedIngredient(_ values: NSSet)

}

// MARK: Generated accessors for usedIngredient
extension RecipeEntity {

    @objc(addUsedIngredientObject:)
    @NSManaged public func addToUsedIngredient(_ value: IngredientEntity)

    @objc(removeUsedIngredientObject:)
    @NSManaged public func removeFromUsedIngredient(_ value: IngredientEntity)

    @objc(addUsedIngredient:)
    @NSManaged public func addToUsedIngredient(_ values: NSSet)

    @objc(removeUsedIngredient:)
    @NSManaged public func removeFromUsedIngredient(_ values: NSSet)

}

extension RecipeEntity : Identifiable {

}
