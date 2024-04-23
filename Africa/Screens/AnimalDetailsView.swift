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
                Group{
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
                }.padding(.horizontal)
                    .padding(.bottom, 10)
                
                // MARK: - Gallery
                Group{
                    HeadingView(icon: "photo.on.rectangle.angled", title: "Wilderness in Pictures")
                    
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
                    }//: ScrollView
                    .padding(.leading , 16)
                    .padding(.bottom , 10)
                }//: Group Gallery
                
              // MARK: - Facts
                Group{
                    HeadingView(icon: "questionmark.circle", title: "Did you know?")
                    
                    FactsGalleryView(facts: animal.fact)
                }//: Group Facts
                .padding(.horizontal)
                
                // MARK: - Description
                    Group{
                        HeadingView(icon: "info.circle", title: "All about \(animal.name)")
                        
                        Text(animal.description)
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                            .layoutPriority(1)
                    }//: Group Facts
                    .padding(.horizontal)
                
                // MARK: - Map
                    Group{
                        HeadingView(icon: "map", title: "National Parks")
                        CompactMapView()
 
                    }//: Group Facts
                    .padding(.horizontal)
                
                // MARK: - Link
                    Group{
                        HeadingView(icon: "books.vertical", title: "Learn More")
                        ExternalWebLinkView(animal: animal)
                    }//: Group Facts
                    .padding(.horizontal)
                    .padding(.bottom , 20)
                
            } //: VStack
            
            .padding(.bottom , 10)
  
        } //: ScrollView
        .navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
            .padding(.bottom, 20)
        
        
        
    }
}

#Preview("Lion") {
    let animals : [Animal] = Bundle.main.decode("animals.json")
    return   AnimalDetailsView(animal: animals[0])
}

#Preview("Zebra") {
    let animals : [Animal] = Bundle.main.decode("animals.json")
    return   AnimalDetailsView(animal: animals[1])
}
