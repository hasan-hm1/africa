//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Hasan on 4/23/24.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    let video : Video
    var videoPlayer : AVPlayer {
        let videoPlayer : AVPlayer =
        AVPlayer(url:  Bundle.main.url(forResource: "\(video.id)", withExtension: "mp4")!)
        videoPlayer.play()
        return videoPlayer
    }

    var body: some View {
        VideoPlayer(player:videoPlayer)
            .scaledToFit()
            .navigationBarTitle("Watch \(video.name) in action")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let videos : [Video] = Bundle.main.decode("videos.json")
    return VideoPlayerView(video: videos[0])
}
