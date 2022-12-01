//
//  RecipesService.swift
//  Reciplease
//
//  Created by Sébastien Daguin on 13/04/2022.
//

import Foundation
import Alamofire


class RecipleaseService {
    static var shared = RecipleaseService()
    private init(){}
    private var recipeSession = RecipeSession()
    
    init(recipeSession: RecipeSession) {
        self.recipeSession = recipeSession
    }
    
    func getRecepleases(ingredients : [String], callback: @escaping (Bool, [Hit]?, Error?) -> Void)  {
        let ingredientsForUrl = Utils.clearForUrl(ingredients)
        let baseUrl = URL(string: "https://api.edamam.com/search?q=\(ingredientsForUrl.utf8)&app_id=1f5b21c8&app_key=663f1a5a754bd316789a05c2ff662c60&from=0&to=10")!
        
        recipeSession.session(url: baseUrl) { result in
            switch result {
            case .success (let data):
                do {
                    let decoder = JSONDecoder()
                    let product = try decoder.decode(RecipesSearch.self, from: data)
                    callback(true, product.hits, nil)
                } catch  {
                    callback(false, nil, error)
                }
            case .failure(let failure):
                callback(false, nil, failure)
            }
        }
    }
    
}
