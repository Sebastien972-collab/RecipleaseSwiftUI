//
//  SearchTest.swift
//  RecipleaseTests
//
//  Created by Sébastien DAGUIN on 24/11/2022.
//

import XCTest
@testable import Reciplease

final class SearchTest: XCTestCase {
    var  newSearch = Search()
    
    func testGetEmptyIngredients() {
        do {
            try newSearch.addIngredients("")
        } catch {
            XCTAssertEqual(error as! SearchError, SearchError.ingredientFieldEmpty)
        }
    }
    func testGetInvalidChar() {
        do {
            try newSearch.addIngredients("Souppe, Lemon, Apple, 12")
        } catch {
            XCTAssertEqual(error as! SearchError, SearchError.invalidCharacter)
        }
    }
    func testGetIngredientsAndClearIngredients() {
        let ingredients = ["Souppe, Lemon, Apple"]
        newSearch.ingredients = ingredients
        newSearch.clearIngredients()
        XCTAssertTrue(newSearch.ingredients.isEmpty)
    }
    func testGetValideIngredients() {
        do {
            newSearch.clearIngredients()
            print(newSearch.ingredients.count)
            try newSearch.addIngredients("Souppe, Lemon, Apple")
            for ingredients in newSearch.ingredients {
                print(ingredients)
            }
            XCTAssertEqual(newSearch.ingredients.count, 3)
        } catch {
            XCTAssertNoThrow(self)
        }
    }
}
