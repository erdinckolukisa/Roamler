//
//  IngredientRow.swift
//  RoamlerTask
//
//  Created by Erdinc Kolukisa on 10/10/22.
//

import SwiftUI

struct IngredientRow: View {
	
	var ingredient: Ingredient
	
    var body: some View {
		HStack {
			Text("•")
				.font(.largeTitle)
			
			Text(ingredient.name?.capitalized ?? " ")
		}
    }
}

struct IngredientRow_Previews: PreviewProvider {
    static var previews: some View {
		IngredientRow(ingredient: Ingredient.mockIngredient())
			.previewLayout(.sizeThatFits)
    }
}
