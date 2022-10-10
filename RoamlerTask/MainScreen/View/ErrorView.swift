//
//  ErrorView.swift
//  RoamlerTask
//
//  Created by Erdinc Kolukisa on 10/7/22.
//

import SwiftUI

struct ErrorView: View {
    var body: some View {
		VStack {
			Image(systemName: "hand.thumbsdown.circle")
				.foregroundColor(.red)
				.font(.system(size: 60))
			
			Text("Something went wrong")
				.font(.system(size: 10))
			
			Text("Please try again later")
				.font(.system(size: 10))
			
		}
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
		ErrorView()
			.previewLayout(.sizeThatFits)
    }
}
