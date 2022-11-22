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
    @Environment(\.managedObjectContext) private var viewContext
    @State private var showDirectionView = false
    @State private var vcError = ""
    @State private var showError = false
    
    var body: some View {
        ZStack {
            Color.backgroundApp.edgesIgnoringSafeArea(.top)
            VStack(content: {
                ScrollView(content: {
                    VStack(alignment : .leading) {
                        ZStack {
                            Image("image1")
                                .resizable()
                            .frame(maxWidth: .infinity, maxHeight: 300)
                            Text(recipe.label)
                                .foregroundColor(.white)
                                .font(.title)
                                .offset(y : 100)
                        }
                        
                        Text("Ingredients ")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                        
                        ForEach(recipe.ingredientLines, id: \.self) { ingredient in
                            Text("- \(ingredient)")
                                .font(.title3)
                                .foregroundColor(.white)
                                .padding(.horizontal)
                        }
                        
                        Spacer()
                    }
                })
                Button {
                    showDirectionView.toggle()
                } label: {
                    Text("Get direction")
                        .padding()
                }
//                .navigationDestination(isPresented: $showDirectionView) {
//                    SafariView(url: recipe.url)
//                }

            })
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Reciplease")
                        .font(.title)
                        .foregroundColor(.white)
                }
                ToolbarItem(placement : .navigationBarTrailing) {
                    Button {
                    let recipeFav = CDRecipe(context: viewContext)
                        recipeFav.url = recipe.url
                        recipeFav.source = recipe.source
                        recipeFav.image = recipe.image
                        recipeFav.label = recipe.label
                        var ingredientsString = ""
                        for (index, ingredient) in recipe.ingredientLines.enumerated() {
                            if index == 0 {
                                ingredientsString += ingredient
                            }
                            ingredientsString += ",\(ingredient) "
                        }
                        recipeFav.ingredientLines = ingredientsString
                        
                        do {
                            try viewContext.save()
                        } catch {
                            vcError = error.localizedDescription
                            showError.toggle()
                        }
                    } label: {
                        Image(systemName: "star.fill")
                            .foregroundColor(.white)
                    }

                }
            }
        }.alert(isPresented: $showError) {
            Alert(title: Text("Erreur"), message: Text(vcError), dismissButton: .default(Text("Ok")))
        }
    }
}

struct RecipeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RecipeDetailsView(recipe: Hit.defaultRecipe.recipe)
        }
    }
}
