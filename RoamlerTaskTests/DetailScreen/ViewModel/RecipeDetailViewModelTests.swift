//
//  RecipeDetailViewModelTests.swift
//  RoamlerTaskTests
//
//  Created by Erdinc Kolukisa on 10/9/22.
//

import XCTest
@testable import RoamlerTask

final class RecipeDetailViewModelTests: XCTestCase {

    override func setUp() {
		super.setUp()
    }

	override func tearDown() {
		super.tearDown()
    }
	
	func test_Sut_Properties() {
		let sut = RecipeDetailViewModel(recipe: Recipe.mockRecipe())
		
		XCTAssertEqual(sut.likeCount, "1 like")
		XCTAssertEqual(sut.recipeName, "Beer - Batter Fried Shrimp")
	}
}
