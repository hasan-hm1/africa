//
//  FactsGalleryView.swift
//  Africa
//
//  Created by Hasan on 4/22/24.
//

import SwiftUI

struct FactsGalleryView: View {
    let facts : [String]
    var body: some View {
        GroupBox{
            TabView{
                ForEach(facts , id: \.self){ fact in
                Text(fact)
                }
                
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(minWidth: 150, idealHeight: 165, maxHeight: 180)
        }
    }
}

#Preview("Preview 1", traits: .sizeThatFitsLayout) {
    let animals : [Animal] = Bundle.main.decode("animals.json")
   return  FactsGalleryView(facts: animals[0].fact)
}


#Preview("Preview 2", traits: .sizeThatFitsLayout) {
    let animals : [Animal] = Bundle.main.decode("animals.json")
   return  FactsGalleryView(facts: animals[1].fact)
}
