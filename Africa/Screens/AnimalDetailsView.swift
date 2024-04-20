//
//  AnimalDetailsView.swift
//  Africa
//
//  Created by Hasan on 4/20/24.
//

import SwiftUI

struct AnimalDetailsView: View {
    let animal : Animal
    var body: some View {
   
        ScrollView(.vertical , showsIndicators: false) {
                VStack(spacing : 20){
                    // MARK: - Header
                    Image(animal.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                    
                    // MARK: - Info
                    VStack(spacing : 20){
                        Text(animal.name.uppercased())
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .background(){
                                Color(.accent)
                                    .frame(height: 6)
                                    .offset(y: 24)
                            }
                        Text(animal.headline)
                            .font(.headline)
                            .foregroundStyle(.accent)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        HStack{
                            Image( systemName: "photo.on.rectangle.angled")
                                .font(.title3)
                                .foregroundColor(.accent)
                            Text("Wilderness in Pictures")
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                        // MARK: - Gallery
                     
                    }.padding(.horizontal, 16)
                    ScrollView(.horizontal , showsIndicators: false){
                        HStack(spacing : 10){
                            ForEach(animal.gallery, id: \.self){ image in
                            Image(image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 200)
                                    .cornerRadius(8)
                            }
                        }
                    }
                    .padding(.leading , 16)
                    .padding(.bottom , 20)
                    
                    
            
                    
                }
                
            }.navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
                .padding(.bottom, 20)
          

        
    }
}

#Preview {
    AnimalDetailsView(animal: Animal(id: "11", name: "Lion", headline: "some text", description: "", link: "", image: "cover-lion", gallery: [
        "lion-1",
        "lion-2",
        "lion-3",
        "lion-4"
      ], fact: []))
}
