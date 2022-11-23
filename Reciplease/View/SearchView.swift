//
//  SearchView.swift
//  Reciplease
//
//  Created by Sébastien DAGUIN on 07/11/2022.
//

import SwiftUI

struct SearchView: View {
    @State private var ingredient : String = ""
    @State private var ingredients : [String] = []
    @State private var alertMessage = ""
    @State private var alertIsPresented = false
    @State private var recipes : [Recipe] = []
    @State private var showSearchView = false
    @FocusState private var fieldIsFocused : Bool
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color("bacgroundAppColor").edgesIgnoringSafeArea(.top)
                VStack {
                    VStack {
                        Text("What's in your fridge ? ")
                        HStack {
                            TextField("Lemon, Cheese, Sausages...", text: $ingredient)
                                .focused($fieldIsFocused)
                            Button(action: addIngredient) {
                                Text("Add")
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
                                ingredients.removeAll()
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
                        ForEach(ingredients, id : \.self) { ingredient in
                            Text("- \(ingredient)")
                                .font(.title3)
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                    Spacer()
                    ContinueButtonView(action: getRecipes)
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
                        message: Text(alertMessage),
                        dismissButton: .default(Text("Ok"))
                    )
                }
        }
        
    }
    private func addIngredient() {
        guard  !ingredient.isEmpty else {
            alertMessage = "Oups... Ce champ ne peut pas être vide"
            alertIsPresented.toggle()
            return
        }
        let ingredientsToAdd = ingredient.split(separator: ",")
        for newIngredient in ingredientsToAdd {
            print(newIngredient)
            let value = String(newIngredient)
            if haveAnumber(value: value) {
                alertMessage = "Charactère non pris en charge."
            }
            else if !ingredients.contains(clearWord(value)) {
                ingredients.append(clearWord(value))

            }
        }
        ingredient.removeAll()
        print("Tapped")
        
    }
    func getRecipes() {
        guard !ingredients.isEmpty else {
            alertMessage = "Oups... Vous n'avez pas entrer d'ingrédients."
            alertIsPresented.toggle()
            return
        }
        RecipleaseService.shared.getRecepleases(ingredients: ingredients) { success, recipes, error in
            guard success, let recipes = recipes, error == nil else {
                fieldIsFocused = false
                alertMessage = error?.localizedDescription ?? "Unkonow Error"
                alertIsPresented.toggle()
                return
            }
            fieldIsFocused = false
            for recipe in recipes {
                self.recipes.append(recipe.recipe)
            }
           
            guard !self.recipes.isEmpty else {
                alertMessage = "Oups... Nous n'avons pas trouver de recettes."
                alertIsPresented.toggle()
                return
            }
            showSearchView.toggle()
            print(recipes.count)
            
        }
    }
    private func clearWord(_ word : String) -> String {
        var newWord : [Character] = []
        for letter in word {
            if letter.isLetter {
                newWord.append(letter)
            }
        }
        return String(newWord)
    }
    private func haveAnumber(value : String) -> Bool {
        for character in value {
            if character.isNumber {
                return true
            }
        }
        return false
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
