//
//  Search.swift
//  Reciplease
//
//  Created by Sébastien DAGUIN on 23/11/2022.
//

import Foundation
import SJDKitToolBox

class Search: ObservableObject {
    static var shared = Search()
    private init(){}
    @Published var ingredients : [String] = []
    @Published var recipes : [Recipe] = []
    @Published var searchError: Error = SearchError.noRecipeFound
    @Published var showError : Bool = false
    @Published var inProgress : Bool = false
    @Published var isComplete : Bool = false
    @Published var nextRecipe : Bool = false
    private var service = RecipleaseService.shared
    init(service: RecipleaseService) {
        self.service = service
    }
    
    
    func addIngredients(_ ingredients : String)  {
        guard ingredients.isNotEmpty else {
            searchError =  SearchError.ingredientFieldEmpty
            showError.toggle()
            return
        }
        guard !ingredients.containsAnumber else {
            searchError =  SearchError.invalidCharacter
            showError.toggle()
            return
        }
        
        let newIngredients = ingredients.splitString(with: ",")
        for newIngredient in newIngredients {
            if !self.ingredients.contains(newIngredient) {
                
                self.ingredients.append(newIngredient)
            }
        }
    }
    func clearIngredients() {
        ingredients.removeAll()
    }
    
    func hitsToRecipe(_ hits : [Hit]) -> [Recipe] {
        var recipesFind : [Recipe] = []
        for recipe in hits {
            recipesFind.append(recipe.recipe)
        }
        return recipesFind
    }
    
    func getRecipes() {
        guard ingredients.isNotEmpty else {
            searchError = SearchError.ingredientFieldEmpty
            showError.toggle()
            return
        }
        inProgress.toggle()
        nextRecipe = false
        service.getRecepleases(ingredients: ingredients, callback: handle)
    }
    
    
    func getNextPage() {
        inProgress.toggle()
        nextRecipe = true
        service.getNextReciplease(callback: handle)
    }
    
    private func handle(success: Bool, hits: [Hit]?, error: Error?) {
        guard success, let hits = hits, error == nil else {
            self.searchError = error ?? SearchError.uknowError
            self.showError.toggle()
            return
        }
        
        self.recipes = self.hitsToRecipe(hits)
        guard self.recipes.isNotEmpty else {
            self.searchError = SearchError.noRecipeFound
            self.showError.toggle()
            return
        }
        print(self.recipes.count)
        if !nextRecipe {
            self.isComplete.toggle()
        }
        self.inProgress.toggle()
    }
}
