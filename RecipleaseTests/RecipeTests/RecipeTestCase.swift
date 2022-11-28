//
//  RecipeTestCase.swift
//  RecipleaseTests
//
//  Created by Sébastien DAGUIN on 25/11/2022.
//

import XCTest
@testable import Reciplease
final class RecipeTestCase: XCTestCase {
    
    func testGetAcorrectResponse() {
        
        let fakeResponse = FakeResponse(result: Result.success(FakeResponseData.recipeCorrectData))
        let recipeSession = RecipeSessionFake(fakeResponse: fakeResponse)
        let recipeService = RecipleaseService(recipeSession: recipeSession)
        recipeService.getRecepleases(ingredients: []) { success, hits, error in
            XCTAssertTrue(success)
            XCTAssertNotNil(hits)
            XCTAssertNil(error)
        }
        
        
    }
    func testGetAIncorrectResponse() {
        
        let fakeResponse = FakeResponse(result: Result.failure(FakeResponseData.reponseError))
        let recipeSession = RecipeSessionFake(fakeResponse: fakeResponse)
        let recipeService = RecipleaseService(recipeSession: recipeSession)
        recipeService.getRecepleases(ingredients: []) { success, hits, error in
            XCTAssertFalse(success)
            XCTAssertNil(hits)
            XCTAssertNotNil(error)
        }
        
        
    }
//    func testGetAIncorrectResponse() {
//        let fakeResponse = FakeResponse(response: FakeResponseData.responseKO, data: FakeResponseData.incorrectData, error: FakeResponseData.reponseError, result: nil)
//        let recipeSession = RecipeSessionFake(fakeResponse: fakeResponse)
//        let recipeService = RecipleaseService(recipeSession: recipeSession)
//
//        recipeService.getRecepleases(ingredients: []) { success, hit, error in
//            XCTAssertFalse(success)
//            XCTAssertNil(hit)
//            XCTAssertNotNil(error)
//        }
//    }
//
//    func testGetAIncorrectDataWithOkResponse() {
//        let fakeResponse = FakeResponse(response: FakeResponseData.responseOK, data: FakeResponseData.incorrectData, error: FakeResponseData.reponseError, result: nil)
//        let recipeSession = RecipeSessionFake(fakeResponse: fakeResponse)
//        let recipeService = RecipleaseService(recipeSession: recipeSession)
//
//
//        recipeService.getRecepleases(ingredients: []) { success, hit, error in
//            XCTAssertFalse(success)
//            XCTAssertNil(hit)
//            XCTAssertNotNil(error)
//        }
//    }
//    func TestGetResponseKOWithCorrectData() {
//        let fakeResponse = FakeResponse(response: FakeResponseData.responseKO, data: FakeResponseData.recipeCorrectData, error: FakeResponseData.reponseError, result: nil)
//        let recipeSession = RecipeSessionFake(fakeResponse: fakeResponse)
//        let recipeService = RecipleaseService(recipeSession: recipeSession)
//
//
//
//        recipeService.getRecepleases(ingredients: []) { success, hit, error in
//            XCTAssertFalse(success)
//            XCTAssertNil(hit)
//            XCTAssertNotNil(error)
//        }
//    }
//    func testGetRecipePostFailedCallBackIFResponseKO() {
//
//        let fakeResponse = FakeResponse(response: FakeResponseData.responseKO, data: FakeResponseData.recipeCorrectData, error: FakeResponseData.reponseError, result: nil)
//        let recipeSession = RecipeSessionFake(fakeResponse: fakeResponse)
//        let recipeService = RecipleaseService(recipeSession: recipeSession)
//
//        recipeService.getRecepleases(ingredients: []) { success , hit, error in
//            XCTAssertFalse(success)
//            XCTAssertNotNil(error)
//            XCTAssertNil(hit)
//        }
//    }
//    func testGetAError() {
//        let fakeResponse = FakeResponse(response: FakeResponseData.responseKO, data: FakeResponseData.recipeCorrectData, error: FakeResponseData.reponseError, result: nil)
//        let recipeSession = RecipeSessionFake(fakeResponse: fakeResponse)
//        let recipeService = RecipleaseService(recipeSession: recipeSession)
//
//        recipeService.getRecepleases(ingredients: []) { success, hit, error in
//            XCTAssertEqual(success, true)
//            XCTAssertNil(error)
//            XCTAssertNil(hit)
//        }
//    }
}
