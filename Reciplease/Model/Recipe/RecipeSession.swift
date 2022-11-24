//
//  RecipeSession.swift
//  Reciplease
//
//  Created by Sébastien DAGUIN on 24/11/2022.
//

import Foundation
import Alamofire

class RecipeSession {
    func session(url: URLConvertible, callback: @escaping ( AFDataResponse<Data>) -> Void) {
        AF.request(url).responseData { data in
            callback(data)
        }
        
    }
}
