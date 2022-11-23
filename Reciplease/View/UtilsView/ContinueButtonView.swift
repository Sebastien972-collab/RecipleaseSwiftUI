//
//  ContinueButtonView.swift
//  Reciplease
//
//  Created by Sébastien DAGUIN on 22/11/2022.
//

import SwiftUI

struct ContinueButtonView: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("Search for recipe")
                .foregroundColor(.white)
                .frame(maxWidth: 300, maxHeight: 60)
                .background(Color("greenApp"))
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        
    }
}

struct ContinueButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ContinueButtonView {
            
        }
    }
}
