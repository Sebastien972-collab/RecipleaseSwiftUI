//
//  RecipesList.swift
//  Reciplease
//
//  Created by Sébastien DAGUIN on 07/11/2022.
//

import SwiftUI

struct RecipesListView: View {
    @Binding var recipes : [Recipe]
    
    var body: some View {
        ZStack {
            Color.backgroundApp.edgesIgnoringSafeArea(.top)
            VStack {
                Text("Reciplease")
                    .font(.title)
                    .foregroundColor(.white)
                ScrollView {
                    VStack {
                        ForEach(recipes, id: \.self) { recipe in
                            RecipeRow(recipe: recipe)
                        }
                    }
                }
            }
        }
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesListView(recipes: .constant([Recipe.defaultRecipe, Recipe.defaultRecipe, Recipe.defaultRecipe]))
    }
}
