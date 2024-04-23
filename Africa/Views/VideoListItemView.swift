//
//  VideoListItemView.swift
//  Africa
//
//  Created by Hasan on 4/23/24.
//

import SwiftUI
 

struct VideoListItemView: View {
    let video : Video
    var body: some View {
        NavigationLink(destination: {
            VideoPlayerView(video: video)
        }) {
            HStack(spacing: 10){

                ZStack {
                    Image(video.thumbnil)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(9.0)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                   
                    Image(systemName: "play.circle")
                        .font(.system(size: 34))
                        .shadow(radius: 4)
                }//: ZStack
                    
                VStack(alignment: .leading){
                    Text(video.name)
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(.accent)
                    Text(video.headline)
                        .font(.footnote)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                }//: VStack
                Spacer()
            }
        }//: HStack
    }
}

#Preview {
    let videos : [Video] = Bundle.main.decode("videos.json")
    return VideoListItemView(video: videos[0])
}
