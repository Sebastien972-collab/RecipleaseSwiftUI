//
//  FavoriteRecipesListView.swift
//  Reciplease
//
//  Created by Sébastien DAGUIN on 21/11/2022.
//

import SwiftUI

struct FavoriteRecipesListView: View {
    @State private var detailsViewIsPresented = false
    @State private var favoriteRecipes : [Recipe] = []
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backgroundApp.edgesIgnoringSafeArea(.top)
                RecipesListView(recipes: favoriteRecipes)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Reciplease")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                    }
            }
            .onAppear() {
                favoriteRecipes = FavoriteRecipe.shared.all
            }
        }
    }
}

struct FavoriteRecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteRecipesListView()
    }
}
