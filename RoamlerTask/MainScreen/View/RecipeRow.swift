//
//  RecipeRow.swift
//  RoamlerTask
//
//  Created by Erdinc Kolukisa on 10/7/22.
//

import SwiftUI
import Kingfisher

struct RecipeRow: View {
	
	var recipe: Recipe
	
    var body: some View {
		VStack(alignment: .leading, spacing: 0) {
			if let imageURL = recipe.image, let url = URL(string: imageURL) {
				KFImage.url(url)
					.loadDiskFileSynchronously()
					.cacheMemoryOnly()
					.fade(duration: 0.25)
					.resizable()
					.frame(maxWidth: .infinity)
					.scaledToFill()
					.overlay(
						RoundedRectangle(cornerRadius: 4)
							.stroke(.gray, lineWidth: 1)
					)
			}
			
			Text(recipe.title)
				.font(.headline)
				.padding(8)
		}
    }
}

struct RecipeRow_Previews: PreviewProvider {
    static var previews: some View {
		RecipeRow(recipe: Recipe.mockRecipe())
			.previewLayout(.sizeThatFits)
    }
}
