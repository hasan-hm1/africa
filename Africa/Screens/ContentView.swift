//
//  ContentView.swift
//  Africa
//
//  Created by Hasan on 4/5/24.
//

import SwiftUI

struct ContentView: View {
    let animals : [Animal] = Bundle.main.decode("animals.json")
    @State var viewType : ViewType = .list
    @State var gridLayout : [GridItem] = Array(repeating: .init(.flexible()), count: 1)
    
    private func switchGridLayout() {
        gridLayout = Array(repeating: .init(.flexible()), count: (gridLayout.count % 3) + 1)
    }
    
    var body: some View {
        NavigationView{
            Group{
                if viewType == .list {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            .listRowInsets(EdgeInsets())
                        ForEach(animals){ animal in
                            AnimalListItemView(animal: animal)
                        }
                    }//: List
                    .listStyle(PlainListStyle())
                    .scrollIndicators(.hidden)
                    .padding(0)
                }
                else {
                    ScrollView(.vertical, showsIndicators: false){
                        LazyVGrid(columns: gridLayout){
                            ForEach(animals){ animal in
                                AnimalGridItemView(animal: animal)
                            }
                        }//: LazyVGrid
                        .animation(.easeOut, value: gridLayout.count)
                    }//:ScrollView
                }
            }//: VStack
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar(){
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        viewType = .list
                    }label: {
                        Image(systemName: "checklist.unchecked")
                            .foregroundStyle(viewType == .list ? .accent : .white)
                    }
                }//: ToolBarItem
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        viewType = .grid
                        switchGridLayout()
                    } label: {
                        Image(systemName: "rectangle.grid.\((gridLayout.count % 3) + 1)x2")
                            .foregroundStyle(viewType == .grid ? .accent : .white)
                    }
                }//: ToolBarItem
            }//: toolbar
        }//: NavigationView
        
    }
}

#Preview {
    ContentView()
}


enum ViewType {
    case list
    case grid
}

