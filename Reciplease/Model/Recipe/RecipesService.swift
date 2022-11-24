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
    
    func getRecepleases(ingredients : [String], callback: @escaping (Bool, [Hit]?, Error?) -> Void)  {
        let ingredientsForUrl = clearForUrl(ingredients)
        let baseUrl = URL(string: "https://api.edamam.com/search?q=\(ingredientsForUrl.utf8)&app_id=1f5b21c8&app_key=663f1a5a754bd316789a05c2ff662c60&from=0&to=10")!
        AF.request(baseUrl).responseData { data in
            guard let data = data.data else {
                return callback(false, nil, data.error)
            }
            do {
                let decoder = JSONDecoder()
                let product = try decoder.decode(RecipesSearch.self, from: data)
                print(" La reeeeppppppoooonnnnnnnsssssseeeeee")
                print(product.hits)
                callback(true, product.hits, nil)
            }catch {
                print("L'erreur")
                callback(false, nil, error)
            }
        }
        
        //
    }
    //
    func clearForUrl(_ ingredients : [String]) -> String {
        var text = ""
        for ingredient in ingredients {
            let ingredientToUrl = ingredient.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
            text +=  ingredientToUrl
            
        }
        print(text.utf8)
        return text
    }
    
}

struct StaticRecipleases : Hashable {
    static var recipleaseData : Data {
        let bundle = Bundle(for: RecipleaseService.self)
        let url = bundle.url(forResource: "StaticRecipe", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return data
        
    }
    
    static func getReciplease() -> [Hit] {
        let decoder = JSONDecoder()
        do {
            let product = try decoder.decode(RecipesSearch.self, from: recipleaseData )
            
            return product.hits
        }catch {
            print(error)
        }
        return [Hit(recipe: Recipe(label: "", image: "", source: "", url: "", ingredientLines: [""]))]
    }
    
}
