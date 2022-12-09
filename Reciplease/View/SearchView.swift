//
//  SearchView.swift
//  Reciplease
//
//  Created by Sébastien DAGUIN on 07/11/2022.
//

import SwiftUI

struct SearchView: View {
    @State private var ingredient : String = ""
    @State private var searchError : Error = SearchError.uknowError
    @State private var alertIsPresented = false
    @State private var recipes : [Recipe] = []
    @State private var showSearchView = false
    @FocusState private var fieldIsFocused : Bool
    @ObservedObject private var search = Search()
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color.backgroundApp.edgesIgnoringSafeArea(.top)
                VStack {
                    VStack {
                        Text("What's in your fridge ? ")
                        HStack {
                            TextField("Lemon, Cheese, Sausages...", text: $ingredient)
                                .accessibilityLabel(Text("Entrez vos ingredient"))
                                .focused($fieldIsFocused)
                                
                                
                            Button {
                                do {
                                    try search.addIngredients(ingredient)
                                } catch {
                                    searchError = error
                                    alertIsPresented.toggle()
                                }
                                ingredient.removeAll()
                            } label: {
                                Text("Add")
                                    .accessibilityLabel(Text("Appuyez pour ajouter un élément"))
                                    .foregroundColor(.white)
                                    .bold()
                                    .padding()
                                    .background(Color("greenApp"))
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                        .padding()
                        Divider()
                    }
                    .frame(maxWidth : .infinity, maxHeight: 200)
                    .background(Color.white)
                    .padding(.top)
                    VStack {
                        HStack() {
                            Text("Your ingredients : ")
                                .foregroundColor(.white)
                            Spacer()
                            Button {
                                search.clearIngredients()
                            } label: {
                                Text("Clear")
                                    .foregroundColor(.white)
                                    .bold()
                                    .padding()
                                    .background(Color.gray)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                            }
                            
                        }
                        .padding()
                        ForEach(search.ingredients, id : \.self) { ingredient in
                            Text("- \(ingredient)")
                                .font(.title3)
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                    Spacer()
                    ContinueButtonView(title: "Search for recipe", action: getRecipes)
                        
                        .navigationDestination(isPresented: $showSearchView, destination: {
                            RecipesListView(recipes: recipes)
                        })
                        
                        .padding()
                    
                }
                .toolbar(content: {
                    ToolbarItem(placement: .principal) {
                        RecipleaseTitle()
                    }
                })
                
            }
            .onTapGesture {
                fieldIsFocused = false
            }
            .alert(isPresented: $alertIsPresented) {
                Alert(
                    title: Text("Error"),
                    message: Text(searchError.localizedDescription),
                    dismissButton: .default(Text("Ok"))
                )
            }
        }
        
    }
    private func getRecipes() {
        guard search.ingredients.isNotEmpty else {
            searchError = SearchError.ingredientFieldEmpty
            alertIsPresented.toggle()
            return
        }
        RecipleaseService.shared.getRecepleases(ingredients: search.ingredients) { success, hits, error in
            for ingredient in search.ingredients {
                print(ingredient)
            }
            guard success, let hits = hits, error == nil else {
                fieldIsFocused = false
                searchError = error ?? SearchError.uknowError
                alertIsPresented.toggle()
                return
            }
            fieldIsFocused = false
            self.recipes = search.hitsToRecipe(hits)
            guard self.recipes.isNotEmpty else {
                searchError = SearchError.noRecipeFound
                alertIsPresented.toggle()
                return
            }
            showSearchView.toggle()
            print(recipes.count)
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
