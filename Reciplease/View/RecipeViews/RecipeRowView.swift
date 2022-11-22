//
//  RecipeRow.swift
//  Reciplease
//
//  Created by Sébastien DAGUIN on 07/11/2022.
//
import SwiftUI

struct RecipeRow: View {
    var recipe : Recipe
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: recipe.image)) { image in
                image.resizable()
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 200)
            } placeholder: {
                ProgressView()
            }
            VStack(alignment : .leading) {
                HStack {
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Label("2, 5K", systemImage: "hand.thumbsup")
                            .font(.title3)
                            .foregroundColor(.white)
                        Label("3 m", systemImage: "clock.arrow.circlepath")
                            .font(.title3)
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: 100, maxHeight: 60)
                    .background(Color("bacgroundAppColor"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                }
                Spacer()
                VStack(spacing : 10) {
                    Text(recipe.label)
                        .font(.title2)
                        .foregroundColor(.white)
                        .bold()
                    Text(getIngredients())
                        .foregroundColor(.white)
                        .lineLimit(0)
                        .padding(.bottom)
                    
                    
                }
            }
        }
        .clipped()
        .frame(maxWidth: .infinity, maxHeight: 200)
        .border(.black, width: 2)
        
    }
    private func getIngredients() -> String {
        var  ingredients = ""
        
        for ingredient in recipe.ingredientLines {
            ingredients = ingredients + ", \(ingredient)"
        }
        return ingredients
    }
}

struct RecipeRow_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRow(recipe: Hit.defaultRecipe.recipe)
    }
}
