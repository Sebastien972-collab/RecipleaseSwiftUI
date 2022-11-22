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
    private var cdRecipes: FetchedResults<CDRecipe>
    @State var detailsViewIsPresented = false
    @State private var recipes : [Recipe] = []
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("bacgroundAppColor").edgesIgnoringSafeArea(.top)
                RecipesListView(recipes: recipes)
                    .onAppear(){
                        getRecipes()
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
    private func getRecipes(){
        for recipe in cdRecipes {
            let newRecipe = Recipe(label: recipe.label!, image: recipe.image!, source: recipe.source!, url: recipe.url!, ingredientLines: [recipe.ingredientLines!])
            recipes.append(newRecipe)
            
        }
    }
}

struct FavoriteRecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteRecipesListView()
    }
}
