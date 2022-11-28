//
//  Search.swift
//  Reciplease
//
//  Created by Sébastien DAGUIN on 23/11/2022.
//

import Foundation

class Search: ObservableObject {
    @Published var ingredients : [String] = []
    @Published var recipes : [Recipe] = []
    
    func addIngredients(_ ingredients : String) throws {
        guard ingredients.isNotEmpty else {
            throw SearchError.ingredientFieldEmpty
        }
        guard !Utils.haveAnumber(value: ingredients) else {
            throw SearchError.invalidCharacter
        }
        
        let newIngredients = Utils.splitString(ingredients, with: ",")
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
    
}
