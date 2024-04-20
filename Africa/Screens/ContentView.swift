//
//  ContentView.swift
//  Africa
//
//  Created by Hasan on 4/5/24.
//

import SwiftUI

struct ContentView: View {
    let animals : [Animal] = Bundle.main.decode("animals.json")
    var body: some View {
        NavigationView{
            List {
                    CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                ForEach(animals){ animal in
                    AnimalListItemView(animal: animal)
                }
            }
            .scrollIndicators(.hidden)
            .navigationBarTitle("Africa", displayMode: .large)
          
           
        }
    }
}

#Preview {
    ContentView()
}
