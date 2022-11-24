//
//  IngredientView.swift
//  Reciplease
//
//  Created by Sébastien DAGUIN on 23/11/2022.
//

import SwiftUI

struct IngredientView: View {
    var ingredients : [String]
    
    var body: some View {
        VStack {
            Text("Ingredients ")
                .font(.title2)
                .foregroundColor(.white)
                .padding(.horizontal)
            
            ScrollView(showsIndicators: true) {
                VStack(alignment : .leading) {
                    ForEach(ingredients, id: \.self) { ingredient in
                        Text("- \(ingredient)")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientView(ingredients: [])
    }
}
