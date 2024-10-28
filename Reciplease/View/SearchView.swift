//
//  SearchView.swift
//  Reciplease
//
//  Created by Sébastien DAGUIN on 07/11/2022.
//

import SwiftUI

struct SearchView: View {
    @State private var ingredient : String = ""
    @FocusState private var fieldIsFocused : Bool
    @StateObject private var search = Search.shared
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color("bacgroundAppColor").edgesIgnoringSafeArea(.all)
                VStack(alignment: .center, content: {
                    Text("What's in your fridge ? ")
                        .font(.title2)
                        .bold()
                    SearchRecipeTextFieldView(text: $search.newIngredients, action: search.addIngredients)
                    ListIngredientView(search: search)
                        .animation(.easeIn(duration: 2), value: search.ingredients.isEmpty)
                    
                    
                    RecommendationView(recipes: search.recipes)
                        .onAppear() {
                            if search.recipes.isEmpty {
                                search.ingredients.append("Bacon")
                                search.getRecipes()
                            }
                        }
                    Spacer()
                    ContinueButtonView(title: "Search for recipes", action: search.getRecipes)
                        .navigationDestination(isPresented: $search.isComplete) {
                            RecipesListView(search: search)
                        }
                    
                })
                .padding()
                .onTapGesture {
                    fieldIsFocused = false
                }
                .toolbar(content: {
                    ToolbarItem(placement: .principal) {
                        RecipleaseTitle()
                    }
                })
            }
            .alert(isPresented: $search.showError) {
                Alert(
                    title: Text("Error"),
                    message: Text(search.searchError.localizedDescription),
                    dismissButton: .default(Text("Ok"))
                )
            }
        }
        
    }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct ListIngredientView: View {
    var search: Search
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Liste des ingrédients:")
                Spacer()
                Button {
                    search.ingredients.removeAll()
                } label: {
                    Text("Effacer")
                }
                
            }
            ZStack {
                Rectangle()
                    .fill(Color.white)
                VStack(alignment: .leading) {
                    ForEach(search.ingredients,id: \.self) { ingredient in
                        HStack {
                            Text("-")
                            Text(ingredient)
                            Spacer()
                        }
                    }
                    Spacer()
                    
                }
                .multilineTextAlignment(.leading)
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: 300)
            .clipShape(RoundedRectangle(cornerRadius: 25))
        }
    }
}
