//
//  SearchView.swift
//  Reciplease
//
//  Created by Sébastien DAGUIN on 07/11/2022.
//

import SwiftUI

struct SearchView: View {
    @State var ingredient : String = ""
    @State private var ingredients : [String] = []
    @State private var alertMessage = ""
    @State private var alertIsPresented = false
    @State private var recipes : [Recipe] = []
    @State private var showSearchView = false
    
    var body: some View {
        NavigationView(content: {
            ZStack {
                Color("bacgroundAppColor").edgesIgnoringSafeArea(.top)
                VStack {
                    Text("Reciplease")
                        .font(.title)
                        .foregroundColor(.white)
                    VStack {
                        Text("What's in your fridge ? ")
                        HStack {
                            TextField("Lemon, Cheese, Sausages...", text: $ingredient)
                            Button {
                                addIngredient()
                                guard !ingredient.isEmpty else {
                                    alertMessage = "Oups... ce champs ne peut pas être vide"
                                    alertIsPresented.toggle()
                                    return
                                }
                                ingredients.append(ingredient)
                                ingredient.removeAll()
                                print("Tapped")
                            } label: {
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
                    Button {
                        RecipleaseService.shared.getRecepleases(ingredients: ingredients) { success, recipes, error in
                            guard success, let recipes = recipes, error == nil else {
                                return
                            }
                            self.recipes = recipes
                            showSearchView.toggle()
                            print(recipes.count)
                            
                        }
                    } label: {
                        Text("Search for recipe")
                            .foregroundColor(.white)
                            .frame(maxWidth: 300, maxHeight: 60)
                            .background(Color("greenApp"))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .padding()

                }
                .fullScreenCover(isPresented: $showSearchView) {
                    RecipesListView(isPresented: $showSearchView, recipes: $recipes)
                }
            }
            
        })
    }
    private func addIngredient() {
//        guard  !ingredient.isEmpty else {
//            alertMessage = "Oups... Ce champ ne peut pas être vide"
//            alertIsPresented.toggle()
//            return
//        }
//        let ingredientsToAdd = ingredients.split(separator: ",")
//        for newIngredient in ingredientsToAdd {
//            print(newIngredient)
//            let value = String(newIngredient)
//
//            if haveAnumber(value: newIngredient) {
//                alertMessage = "Charactère non pris en charge."
//            }
//            else if !ingredients.contains(clearWord(newIngredient)) {
//                ingredients.append(clearWord(newIngredient))
//
//            }
//        }
        
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
        SearchView(ingredient: "Apple, Lemon, Cheese")
    }
}
