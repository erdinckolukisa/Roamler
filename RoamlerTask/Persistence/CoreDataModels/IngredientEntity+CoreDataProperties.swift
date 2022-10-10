//
//  IngredientEntity+CoreDataProperties.swift
//  RoamlerTask
//
//  Created by Erdinc Kolukisa on 10/10/22.
//
//

import Foundation
import CoreData


extension IngredientEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<IngredientEntity> {
        return NSFetchRequest<IngredientEntity>(entityName: "IngredientEntity")
    }

    @NSManaged public var aisle: String?
    @NSManaged public var amount: Float
    @NSManaged public var id: Int64
    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var original: String?
    @NSManaged public var originalName: String?
    @NSManaged public var unit: String?
    @NSManaged public var unitLong: String?
    @NSManaged public var missed: NSSet?
    @NSManaged public var unused: NSSet?
    @NSManaged public var used: NSSet?

}

// MARK: Generated accessors for missed
extension IngredientEntity {

    @objc(addMissedObject:)
    @NSManaged public func addToMissed(_ value: RecipeEntity)

    @objc(removeMissedObject:)
    @NSManaged public func removeFromMissed(_ value: RecipeEntity)

    @objc(addMissed:)
    @NSManaged public func addToMissed(_ values: NSSet)

    @objc(removeMissed:)
    @NSManaged public func removeFromMissed(_ values: NSSet)

}

// MARK: Generated accessors for unused
extension IngredientEntity {

    @objc(addUnusedObject:)
    @NSManaged public func addToUnused(_ value: RecipeEntity)

    @objc(removeUnusedObject:)
    @NSManaged public func removeFromUnused(_ value: RecipeEntity)

    @objc(addUnused:)
    @NSManaged public func addToUnused(_ values: NSSet)

    @objc(removeUnused:)
    @NSManaged public func removeFromUnused(_ values: NSSet)

}

// MARK: Generated accessors for used
extension IngredientEntity {

    @objc(addUsedObject:)
    @NSManaged public func addToUsed(_ value: RecipeEntity)

    @objc(removeUsedObject:)
    @NSManaged public func removeFromUsed(_ value: RecipeEntity)

    @objc(addUsed:)
    @NSManaged public func addToUsed(_ values: NSSet)

    @objc(removeUsed:)
    @NSManaged public func removeFromUsed(_ values: NSSet)

}

extension IngredientEntity : Identifiable {

}
