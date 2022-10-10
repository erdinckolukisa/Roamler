//
//  RecipeDetailView.swift
//  RoamlerTask
//
//  Created by Erdinc Kolukisa on 10/7/22.
//

import SwiftUI
import Kingfisher

struct RecipeDetailView: View {
	
	private let viewModel: RecipeDetailViewModel
	
	init(viewModel: RecipeDetailViewModel) {
		self.viewModel = viewModel
	}
	
	var body: some View {
		VStack {
			if let imageURL = viewModel.imageURL {
				KFImage.url(imageURL)
					.loadDiskFileSynchronously()
					.cacheMemoryOnly()
					.fade(duration: 0.25)
					.resizable()
					.frame(maxWidth: .infinity)
					.scaledToFit()
					.overlay(
						RoundedRectangle(cornerRadius: 4)
							.stroke(.gray, lineWidth: 1)
					)
			}
			
			VStack(alignment: .leading) {
				Text(viewModel.recipeName)
					.font(.title)
					.bold()
					.padding(.bottom, 8)
				
				Text("\(viewModel.likeCount)")
					.font(.footnote)
					.padding(.bottom, 16)
				
				if viewModel.shouldDisplayUsedIngredients {
					Text("Used Ingredients")
						.font(.subheadline)
						.bold()
					
					List(viewModel.usedIngredients) { ingredient in
						IngredientRow(ingredient: ingredient)
					}
					.listStyle(PlainListStyle())
				}
			}
			.padding(.horizontal, 16)
		}
	}
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
		RecipeDetailView(viewModel: RecipeDetailViewModel.dummyViewModel())
    }
}
