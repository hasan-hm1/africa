//
//  AnimalListItemView.swift
//  Africa
//
//  Created by Hasan on 4/20/24.
//

import SwiftUI

struct AnimalListItemView: View {
    let animal : Animal
    var body: some View {
        NavigationLink(destination: {
            AnimalDetailsView(animal: animal)
        }) {
            HStack(alignment: .center, spacing: 10){
                Image(animal.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 90 , height: 90)
                    .cornerRadius(7)
                    
                VStack(alignment: .leading, spacing: 8){
                    Text(animal.name)
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.accent)
                    Text(animal.headline)
                        .font(.footnote)
                        .lineLimit(2)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                }
                Spacer()
            }
        }
     
    }
}

#Preview {
     
        AnimalListItemView(animal: Animal(id: "11", name: "Lion", headline: "some text", description: "", link: "", image: "cover-lion", gallery: [], fact: []))
    
}
