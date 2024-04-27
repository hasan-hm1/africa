//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Hasan on 4/27/24.
//

import SwiftUI

struct AnimalGridItemView: View {
    let animal : Animal
    var body: some View {
        NavigationLink(destination: {
            AnimalDetailsView(animal: animal)
        }) {
            Image(animal.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(7)
        }
    }
}

#Preview {
    let animals : [Animal] = Bundle.main.decode("animals.json")
    return AnimalGridItemView(animal: animals[0])
}
