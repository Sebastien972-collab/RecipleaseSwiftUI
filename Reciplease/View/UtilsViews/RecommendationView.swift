//
//  RecommendationView.swift
//  Reciplease
//
//  Created by Sebby on 15/10/2024.
//

import SwiftUI

struct RecommendationView: View {
    let recipes: [Recipe]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Recommenations: ")
            ScrollView(.horizontal) {
                HStack {
                    ForEach(recipes, id: \.self) { recipe in
                        NavigationLink(destination: {
                            RecipeDetailsView(recipe: recipe)
                        }, label: {
                            VStack(alignment: .leading) {
                                RoundedRectangleImageView(url: recipe.image)
                                    .frame(width: 200, height: 150)
                                    .padding(.top)
                                Text(recipe.label)
                                    .lineLimit(1)
                                Text(recipe.time())
                            }
                            .frame(width: 200)
                            
                        })
                            
                        
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        RecommendationView(recipes: Recipe.preiews)
    }
}

struct RoundedRectangleImageView: View {
    let url: String
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: 250)
                    .cornerRadius(25)// Displays the loaded image.
            } else if phase.error != nil {
                Image("fruits")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: 250)
                    .cornerRadius(25)// Indicates an error.
            } else {
                ProgressView()
                    .progressViewStyle(.circular)// Acts as a placeholder.
            }
        }
    }
}


