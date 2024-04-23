//
//  NationalParkAnnotation.swift
//  Africa
//
//  Created by Hasan on 4/23/24.
//

import SwiftUI

struct NationalParkAnnotation: View {
    let location : NationalParkLocation
    let baseCirlceRadius : CGFloat = 44
//    @State  var outerCircleRadius : CGFloat = 0
//    @State var outcircleOpacity : CGFloat = 1
    @State private var animation : Double = 0.0
    var body: some View {
        ZStack{
            Circle()
                .stroke(.accent,
                        style: StrokeStyle(
                            lineWidth: 2
                        ))
                .frame(width: baseCirlceRadius, height: baseCirlceRadius)
                .scaleEffect(CGSize(width :1 + animation ,height:  1 + animation))
                .opacity(1.0 - animation)
            Circle()
                .fill(Color.accentColor)
                .frame(width: baseCirlceRadius + 4, height: baseCirlceRadius + 4)
            
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: baseCirlceRadius, height: baseCirlceRadius)
                .clipShape(Circle())
            
        }
        .onAppear(){
            withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: false)){
               animation = 1
            }
        }
    }
}

#Preview {
    let locations : [NationalParkLocation] = Bundle.main.decode("locations.json")
    return NationalParkAnnotation(location: locations[0])
}
