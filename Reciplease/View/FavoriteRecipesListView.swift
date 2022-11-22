//
//  FavoriteRecipesListView.swift
//  Reciplease
//
//  Created by Sébastien DAGUIN on 21/11/2022.
//

import SwiftUI

struct FavoriteRecipesListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \CDRecipe.label, ascending: true)],
        animation: .default)
    private var recipes: FetchedResults<CDRecipe>
    @State var detailsViewIsPresented = false
    var body: some View {
        NavigationStack {
            ZStack {
                Color("bacgroundAppColor").edgesIgnoringSafeArea(.top)
                List(recipes, id: \.self) { recipe in
                    Text(recipe.label ?? "unknow")
                }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Reciplease")
                            .font(.title)
                            .foregroundColor(.white)
                    }
            }
            }
        }
    }
//    func getRecipes() -> [Recipe] {
//        var newRecipes : [RecipeDetails] = []
//
//        for recipe in recipes {
//            let newRecipe = RecipeDetails(label: recipe.label!, image: recipe.image!, source: recipe.source!, url: recipe.url!, ingredientLines: [recipe.ingredientLines!])
//            newRecipes.append(newRecipe)
//
//        }
//    }
}

struct FavoriteRecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteRecipesListView()
    }
}
