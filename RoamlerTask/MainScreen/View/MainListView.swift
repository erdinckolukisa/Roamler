//
//  ContentView.swift
//  RoamlerTask
//
//  Created by Erdinc Kolukisa on 10/7/22.
//

import SwiftUI
import CoreData

struct MainListView: View {

	@EnvironmentObject private var viewModel: MainListViewModel
	
    var body: some View {
		NavigationView {
			if viewModel.hasError {
				ErrorView()
			} else {
				List(viewModel.recipes) { recipe in
					NavigationLink {
						RecipeDetailView(viewModel: RecipeDetailViewModel(recipe: recipe))
					} label: {
						RecipeRow(recipe: recipe)
					}
				}
				.listStyle(PlainListStyle())
				.navigationTitle("Beer ingredient foods")
			}
		}
		.onAppear {
			viewModel.fetchRecipes()
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		MainListView()
			.environmentObject(MainListViewModel(api: WebAPI(),
												 persistence: CoreDataStorage()))
    }
}
