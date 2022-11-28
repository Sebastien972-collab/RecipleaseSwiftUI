//
//  RecipeSessionFake.swift
//  RecipleaseTests
//
//  Created by Sébastien DAGUIN on 24/11/2022.
//

import Foundation
import Alamofire
@testable import Reciplease

class RecipeSessionFake: RecipeSession {
    private let fakeResponse : FakeResponse
    
    init(fakeResponse: FakeResponse) {
        self.fakeResponse = fakeResponse
    }
    
    override func session(url: URLConvertible, callback: @escaping (Result<Data, AFError>) -> Void) {
        callback(fakeResponse.result) 
    }
}

