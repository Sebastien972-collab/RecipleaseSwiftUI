//
//  RecipeDetails.swift
//  Reciplease
//
//  Created by Sébastien DAGUIN on 07/11/2022.
//

import SwiftUI
import CoreData
struct RecipeDetailsView: View {
    var recipe : Recipe
    let favoriteRecipe = FavoriteRecipe.shared
    
    @State private var showDirectionView = false
    @State private var errorMessage = ""
    @State private var alertIsPresented = false
    @State private var isFavorite = false
    
    var body: some View {
        ZStack {
            Color.backgroundApp.edgesIgnoringSafeArea(.top)
            VStack(content: {
                ZStack {
                    AsyncImage(url: URL(string: recipe.image)) { image in
                        image.resizable()
                            .resizable()
                            .frame(maxWidth: .infinity, maxHeight: 300)
                    } placeholder: {
                        ProgressView()
                    }
                    Text(recipe.label)
                        .foregroundColor(.white)
                        .font(.title)
                        .offset(y : 100)
                }
                
                IngredientView(ingredients: recipe.ingredientLines)
                
                
                ContinueButtonView {
                    showDirectionView.toggle()
                }
                .padding()
                //                .navigationDestination(isPresented: $showDirectionView) {
                //                    SafariView(url: recipe.url)
                //                }
            })
            .toolbar {
                ToolbarItem(placement: .principal) {
                    RecipleaseTitle()
                }
                ToolbarItem(placement : .navigationBarTrailing) {
                    Button {
                        saveRecipe()
                    } label: {
                        Image(systemName: "star.fill")
                            .foregroundColor(isFavorite ? .yellow : .white)
                    }
                    
                }
            }
            .onAppear() {
                isFavorite = favoriteRecipe.checkElementIsFavorite(recipe: recipe)
            }
        }
        .alert(isPresented: $alertIsPresented) {
            Alert(title: Text("Erreur"), message: Text(errorMessage), dismissButton: .default(Text("Ok")))
        }
    }
    private func saveRecipe() {
        switch favoriteRecipe.checkElementIsFavorite(recipe: recipe) {
        case true :
            do {
                try favoriteRecipe.removeElementInFavorite(recipe: recipe)
                isFavorite = false
            } catch {
                errorMessage = error.localizedDescription
                alertIsPresented.toggle()
            }
            
        case false :
            do {
                try favoriteRecipe.addNewRecipeFavorite(recipe: recipe)
                isFavorite = true
            } catch {
                errorMessage = error.localizedDescription
                alertIsPresented.toggle()
            }
        }
    }
}

struct RecipeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RecipeDetailsView(recipe: Hit.defaultHits.recipe)
        }
    }
}
