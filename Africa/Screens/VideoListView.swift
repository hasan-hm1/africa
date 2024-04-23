//
//  VideoListView.swift
//  Africa
//
//  Created by Hasan on 4/6/24.
//

import SwiftUI


struct VideoListView: View {
    @State var videos : [Video] = Bundle.main.decode("videos.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    var body: some View {
        NavigationView {
            List{
                ForEach(videos) { video in
                    VideoListItemView(video: video)
                        .padding(.vertical, 4)
                }
            }//: List
            .listStyle(.insetGrouped)
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button{
                videos.shuffle()
                hapticImpact.impactOccurred()
            } label: {
                Image(systemName: "shuffle")
            })
            .scrollIndicators(.hidden)
        }//: NavigationView
    }
}

#Preview {
    VideoListView()
}
