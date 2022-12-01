//
//  SearchError.swift
//  Reciplease
//
//  Created by Sébastien DAGUIN on 23/11/2022.
//

import Foundation

enum SearchError : Error {
case invalidField, invalidCharacter, ingredientFieldEmpty, noRecipeFound ,uknowError, noNetworkConnection
}

extension SearchError : LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidField :
            return NSLocalizedString("Le text n'est pas valide", comment: "Champ invalid")
        case .invalidCharacter :
            return NSLocalizedString("Le charactère n'est pas pris en charge.", comment: "Charactère non pris en charge.")
        case .ingredientFieldEmpty :
            return NSLocalizedString("Oups... Ce champ ne peut pas être vide", comment: "Champ vide")
        case .noRecipeFound :
            return NSLocalizedString("Oups... Nous n'avons pas trouver de recettes.", comment: "Pas de recette trouver")
        case .uknowError :
            return NSLocalizedString("Une erreur inconnue est survenue", comment: "Unknow Error")
        case .noNetworkConnection  :
            return NSLocalizedString("Pas de connexion à internet", comment: "Pas de connexion")
        }
    }
    
}
 
