//
//  MainListViewModelTests.swift
//  RoamlerTaskTests
//
//  Created by Erdinc Kolukisa on 10/9/22.
//

import XCTest
@testable import RoamlerTask

final class MainListViewModelTests: XCTestCase {
	
	var api: MockAPI!
	var persistence: MockStorage!
	var sut: MainListViewModel!
	

    override func setUp() {
		super.setUp()
		
		api = MockAPI()
		persistence = MockStorage()
		sut = MainListViewModel(api: api, persistence: persistence)
    }

	override func tearDown() {
		sut = nil
		persistence = nil
		api = nil
		
		super.tearDown()
	}
	
	func test_SuccessResultForAPI_Shouldnt_Have_Error() {
		api.fetchResult = Result.success([Recipe.mockRecipe()])
			.publisher
			.eraseToAnyPublisher()
		sut.fetchRecipes()
		
		XCTAssertFalse(sut.hasError)
		XCTAssertEqual(sut.recipes.count, 1, "There should be one recipe")
	}
	
	func test_SuccessResultForAPI_Should_Have_Error() {
		api.fetchResult = Result.failure(NetworkError.decodingError)
			.publisher
			.eraseToAnyPublisher()
		sut.fetchRecipes()
		
		XCTAssertTrue(sut.hasError)
		XCTAssertEqual(sut.recipes.count, 0, "There shouldnt be any recipe")
	}
}
