//
//  StringExtensions.swift
//  SJDToolBox
//
//  Created by Sebby on 26/09/2024.
//

import Foundation

extension String {
    var isNotEmpty: Bool {
        return !self.isEmpty
    }
    /// Returns an array of strings separated by a character
    func splitString(with elem : String  ) -> [String] {
        var stringToReturn : [String] = []
        
        if #available(iOS 16.0, *) {
            let stringSplited = self.split(separator: elem)
            for sequence in stringSplited {
                let newString = String(sequence)
                stringToReturn.append(newString)
            }
            return stringToReturn
        }
        else {
            // Fallback on earlier versions
            return stringToReturn
        }
    }
    /// A function that returns a word with only letters
    var clearWord: String {
        var newWord : [Character] = []
        for letter in self {
            if letter.isLetter {
                newWord.append(letter)
            }
        }
        return String(newWord)
    }
    /// Check if string contains a number and return a bolean
    var containsAnumber: Bool {
        for character in self {
            if character.isNumber {
                return true
            }
        }
        return false
    }
}

