//
//  RoamlerTaskApp.swift
//  RoamlerTask
//
//  Created by Erdinc Kolukisa on 10/7/22.
//

import SwiftUI

@main
struct RoamlerTaskApp: App {
	
	private let viewModel = MainListViewModel(api: WebAPI(),
											  persistence: CoreDataStorage())
	
    var body: some Scene {
        WindowGroup {
			MainListView()
				.environmentObject(viewModel)
        }
    }
}
