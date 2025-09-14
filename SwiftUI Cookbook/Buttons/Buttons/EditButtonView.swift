//
//  EditButtonView.swift
//  Buttons
//
//  Created by Harold Davidson on 9/13/25.
//

import SwiftUI

struct EditButtonView: View {
    @State private var animals = ["Cats", "Dogs", "Goats"]
    var body: some View {
        List {
            ForEach(animals, id: \.self) { animal in
                Text(animal)
            }
            .onDelete(perform: removeAnimal)
        }
        .toolbar {
            EditButton()
        }
        .navigationTitle("EditButtonView")
    }
    
    func removeAnimal(at offsets: IndexSet) {
        animals.remove(atOffsets: offsets)
    }
}

#Preview {
    EditButtonView()
}
