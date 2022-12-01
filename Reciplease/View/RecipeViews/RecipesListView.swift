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
            Color("bacgroundAppColor").edgesIgnoringSafeArea(.top)
            ScrollView {
                VStack {
                    ForEach(recipes, id: \.self) { recipe in
                        NavigationLink {
                            RecipeDetailsView(recipe: recipe)
                        } label: {
                            RecipeRow(recipe: recipe)
                        }

                    }
                }
            }
            .toolbar {
                ToolbarItem(placement : .principal) {
                    RecipleaseTitle()
                }
                
            }
        }
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RecipesListView(recipes: [Hit.defaultHits.recipe, Hit.defaultHits.recipe, Hit.defaultHits.recipe])
        }
    }
}
