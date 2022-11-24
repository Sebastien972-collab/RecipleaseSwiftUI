//
//  Utils.swift
//  Reciplease
//
//  Created by Sébastien DAGUIN on 23/11/2022.
//

import Foundation

struct Utils {
    static func splitString(_ string : String, with elem : String  ) -> [String] {
        var stringToReturn : [String] = []
        
        let stringSplited = string.split(separator: elem)
        for sequence in stringSplited {
            stringToReturn.append(String(sequence))
        }
        return stringToReturn
        
    }
    static func clearWord(_ word : String) -> String {
        var newWord : [Character] = []
        for letter in word {
            if letter.isLetter {
                newWord.append(letter)
            }
        }
        return String(newWord)
    }
    static func haveAnumber(value : String) -> Bool {
        for character in value {
            if character.isNumber {
                return true
            }
        }
        return false
    }
    
}
