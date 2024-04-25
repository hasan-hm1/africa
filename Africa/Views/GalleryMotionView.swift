//
//  GalleryMotionView.swift
//  Africa
//
//  Created by Hasan on 4/25/24.
//

import SwiftUI

struct GalleryMotionView: View {
    let screenWidth : Double = UIScreen.main.bounds.width
    let screenHeight : Double = UIScreen.main.bounds.height
    let randomCircleCount : Int = Int.random(in: 6...12)
    var randomRadius : CGFloat {
        return CGFloat.random(in: 10...200)
    }
    var randomPostion : CGPoint {
        let randomX = Double.random(in: 0.0...screenWidth)
        let randomY = Double.random(in: 0.0...screenHeight)
        return CGPoint(x: randomX, y: randomY)
    }
    var randomOpacity : Double {
        return Double.random(in: 0.1...0.4)
    }
    var randoomScale : CGSize {
        let randomScale : Double = Double.random(in: 0.5...2)
        return CGSize(width: randomScale, height: randomScale)
    }
    var randomSpeed : Double {
        return Double.random(in: 0.025...1)
    }
    var randomDelay : Double {
        return Double.random(in: 0...2)
    }
    @State var isAnimating : Bool = false
    
    var body: some View {
        ZStack{
            ForEach(0...randomCircleCount , id: \.self){ _ in
                Circle()
                    .frame(width: randomRadius)
                    .position(randomPostion)
                    .opacity(randomOpacity)
                    .scaleEffect(isAnimating ? randoomScale : CGSize(width: 1, height: 1))
                    .animation(.interpolatingSpring(stiffness: 0.5, damping: 0.5).repeatForever()
                        .speed(randomSpeed)
                        .delay(randomDelay)
                               , value: isAnimating )
            }
        }//: ZStack
        .drawingGroup()
        .onAppear(){
            isAnimating = true
        }
    }
}

#Preview {
    GalleryMotionView()
}


extension GalleryMotionView: Equatable {
    static func == (lhs: GalleryMotionView, rhs: GalleryMotionView) -> Bool {
        // Return true because the background does not depend on any external properties
        return true
    }
}
