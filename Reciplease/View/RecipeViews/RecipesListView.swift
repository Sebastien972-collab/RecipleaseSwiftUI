//
//  RecipesList.swift
//  Reciplease
//
//  Created by Sébastien DAGUIN on 07/11/2022.
//

import SwiftUI

struct RecipesListView: View {
    @Binding var isPresented : Bool
    @Binding var recipes : [Recipe]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundApp.edgesIgnoringSafeArea(.top)
                VStack {
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
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                isPresented.toggle()
                            } label: {
                                Text("< Back")
                            }

                        }
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
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RecipesListView(isPresented: .constant(true), recipes: .constant([Recipe.defaultRecipe, Recipe.defaultRecipe, Recipe.defaultRecipe]))
        }
    }
}
