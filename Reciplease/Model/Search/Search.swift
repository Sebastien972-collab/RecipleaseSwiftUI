//
//  Search.swift
//  Reciplease
//
//  Created by Sébastien DAGUIN on 23/11/2022.
//

import Foundation

class Search: ObservableObject {
   @Published var ingredients : [String] = []
    
    func addIngredients(_ ingredients : String) throws {
        guard  !ingredients.isEmpty else {
            throw SearchError.ingredientFieldEmpty
        }
        if Utils.haveAnumber(value: ingredients) {
            throw SearchError.invalidCharacter
        }
        else if !self.ingredients.contains(Utils.clearWord(ingredients)) {
            self.ingredients += Utils.splitString(ingredients, with: ",")

        }
        
    }
    func clearIngredients() {
        ingredients.removeAll()
    }
    
}
