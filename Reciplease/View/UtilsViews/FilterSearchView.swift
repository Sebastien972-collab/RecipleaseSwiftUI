//
//  FilterSearchView.swift
//  Reciplease
//
//  Created by Sebby on 20/10/2024.
//

import SwiftUI
struct FilterSearchView: View {
    @State var valueMax: Double = 0
    var body: some View {
        Form {
            Section {
                TextField("Min", text: .constant(""))
                    .keyboardType(.numberPad)
                HStack {
                    Slider(value: $valueMax, in: 0...20)
                    Text("Max \(valueMax)")
                }
            } header: {
                Text("Nombre d'aliments")
            }

            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .navigationTitle("Filtres")
    }
}

#Preview {
    NavigationStack {
        FilterSearchView()
    }
}
