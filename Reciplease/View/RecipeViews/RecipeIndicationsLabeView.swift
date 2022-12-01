//
//  RecipeIndicationsLabeView.swift
//  Reciplease
//
//  Created by Sébastien DAGUIN on 28/11/2022.
//

import SwiftUI

struct RecipeIndicationsLabeView: View {
    
    let likes : Int
    let time : String
    
    var body: some View {
        VStack(alignment : .leading, spacing: 8) {
            Label("\(likes)", systemImage: "hand.thumbsup.fill")
            Label(time , systemImage: "timer.circle.fill")
        }
        .accessibilityLabel(Text("Temps de cuisson \(time)"))
        .foregroundColor(.white)
        .padding()
        .background(Color("bacgroundAppColor"))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        
        
    }
}

struct RecipeIndicationsLabeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeIndicationsLabeView(likes: 240, time: "1H30")
    }
}
