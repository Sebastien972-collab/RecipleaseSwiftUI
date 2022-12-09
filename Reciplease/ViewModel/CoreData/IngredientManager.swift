////
////  IngredientManager.swift
////  Reciplease
////
////  Created by Sébastien DAGUIN on 07/11/2022.
////
//
//import Foundation
//class IngredientManager {
//    private func addIngredient(ingredients : [String]) {
//        guard  !ingredients.isEmpty else {
////            alertMessage = "Oups... Ce champ ne peut pas être vide"
////            alertIsPresented.toggle()
//            return
//        }
//        let ingredientsToAdd = ingredients.description.components(separatedBy: ",")
//        for newIngredient in ingredientsToAdd {
//            if haveAnumber(value: newIngredient) {
////                alertMessage = "Charactère non pris en charge."
//            }
//            else if !ingredients.contains(clearWord(newIngredient)) {
//                ingredients.append(clearWord(newIngredient))
//
//            }
//        }
//
//    }
//    private func clearWord(_ word : String) -> String {
//        var newWord : [Character] = []
//        for letter in word {
//            if letter.isLetter {
//                newWord.append(letter)
//            }
//        }
//        return String(newWord)
//    }
//    private func haveAnumber(value : String) -> Bool {
//        for character in value {
//            if character.isNumber {
//                return true
//            }
//        }
//        return false
//    }
//}
