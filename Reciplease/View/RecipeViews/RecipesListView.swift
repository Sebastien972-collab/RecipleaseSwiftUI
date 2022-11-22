//
//  RecipesList.swift
//  Reciplease
//
//  Created by Sébastien DAGUIN on 07/11/2022.
//

import SwiftUI

struct RecipesListView: View {
    var recipes : [Recipe]
    
    var body: some View {
        ZStack {
            Color.backgroundApp.edgesIgnoringSafeArea(.top)
            VStack {
                ScrollView {
                    VStack {
                        ForEach(recipes, id: \.self) { recipe in
                            NavigationLink {
                                RecipeDetailsView(recipe: recipe.recipe)
                            } label: {
                                RecipeRow(recipe: recipe.recipe)
                            }

                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement : .principal) {
                        Text("Reciplease")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    
                }
            }
        }
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RecipesListView(recipes: [Recipe.defaultRecipe, Recipe.defaultRecipe, Recipe.defaultRecipe])
        }
    }
}
