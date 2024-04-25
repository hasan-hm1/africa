//
//  GalleryView.swift
//  Africa
//
//  Created by Hasan on 4/6/24.
//

import SwiftUI

struct GalleryView: View {
    
    @State private var selectedAniaml : Animal
    @State private var columnCount : Float
    @State var gridItems : [GridItem]
    
    let animals : [Animal]
    let hapticImpact  = UIImpactFeedbackGenerator(style: .medium)
    
    init() {
        animals = Bundle.main.decode("animals.json")
        selectedAniaml = animals[5]
        columnCount = 3.0
        gridItems = Array(repeating: .init(.flexible()), count: Int(_columnCount.wrappedValue))
    }
    
    private func refreshGrid(){
        gridItems = Array(repeating: .init(.flexible()), count: Int(columnCount) )
    }
    
    var body: some View {
        ScrollView(.vertical , showsIndicators: false){
            VStack(spacing:30){
                Image(selectedAniaml.image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(lineWidth: 4))
                
                Slider(value: $columnCount, in: 2...4, step: 1){ _ in
                    refreshGrid()
                }//: Slider
                .padding(.horizontal)
                
                
                LazyVGrid(columns: gridItems, alignment: .center , spacing: 10){
                    ForEach(animals) { animal in
                        Image(animal.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .overlay(Circle().stroke())
                            .onTapGesture {
                                selectedAniaml = animal
                                hapticImpact.impactOccurred()
                            }
                        
                    }//: Loop
                }//: LazyVGrid
                .animation(.easeOut , value: gridItems.count)
            }//: VStack
        }//: ScrollView
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background( GalleryMotionView().equatable())
    }
}

#Preview {
    GalleryView()
}
