//
//  ExternalWebLink.swift
//  Africa
//
//  Created by Hasan on 4/22/24.
//

import SwiftUI

struct ExternalWebLinkView: View {
    let animal : Animal
    var body: some View {
        GroupBox{
            HStack{
                Image(systemName: "globe")
                    .imageScale(.medium)
                Text("Wikipedia")
                Spacer()
                Group{
                    Link("\(animal.name)" , destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))! )
                    Image(systemName: "arrow.up.right.square")
                }
                .foregroundColor(.accent)
            }
           
        }
    }
}

#Preview {
    let animals : [Animal] = Bundle.main.decode("animals.json")
    return  ExternalWebLinkView(animal: animals[0])
}
