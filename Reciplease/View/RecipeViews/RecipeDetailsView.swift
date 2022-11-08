//
//  RecipeDetails.swift
//  Reciplease
//
//  Created by Sébastien DAGUIN on 07/11/2022.
//

import SwiftUI

struct RecipeDetailsView: View {
    var recipe : Recipe
    
    var body: some View {
        ZStack {
            Color.backgroundApp.edgesIgnoringSafeArea(.top)
            VStack(alignment : .leading) {
                ZStack {
                    Image("image1")
                        .resizable()
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    Text(recipe.recipe.label)
                        .foregroundColor(.white)
                        .font(.title)
                        .offset(y : 100)
                }
                
                Text("Ingredients ")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                
                ForEach(recipe.recipe.ingredientLines, id: \.self) { ingredient in
                    Text("- \(ingredient)")
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }
                
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Reciplease")
                        .font(.title)
                        .foregroundColor(.white)
                }
                ToolbarItem(placement : .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "star.fill")
                            .foregroundColor(.white)
                    }

                }
            }
        }
    }
}

struct RecipeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RecipeDetailsView(recipe: .defaultRecipe)
        }
    }
}
