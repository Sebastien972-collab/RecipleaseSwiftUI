//
//  SearchRecipeTextFieldView.swift
//  Reciplease
//
//  Created by Sebby on 15/10/2024.
//

import SwiftUI

struct SearchRecipeTextFieldView: View {
    @Binding var text: String
    var action: () -> Void
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.gray)
                TextField("Entrez vos ingredients !", text: $text)
                    .padding()
                Button {
                    action()
                } label: {
                    Image(systemName: "plus.circle")
                }

                Divider()
                Button(action: {}) {
                    Image(systemName: "slider.horizontal.3")
                }
                .disabled(true)
            }
            .padding()
        }
        .frame(maxWidth: 350, maxHeight: 60)
        .clipShape(RoundedRectangle(cornerRadius: 90))
        
        
        
    }
}

#Preview {
    ZStack {
        Color("bacgroundAppColor").edgesIgnoringSafeArea(.all)
        SearchRecipeTextFieldView(text: .constant("")) {
            print("tapped")
        }
    }
}
