//
//  HeadingView.swift
//  Africa
//
//  Created by Hasan on 4/22/24.
//

import SwiftUI

struct HeadingView: View {
    let icon : String
    let title : String
    var body: some View {
        HStack{
            Image( systemName:icon )
                .font(.title3)
                .foregroundColor(.accent)
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
        }
    }
}

#Preview {
    HeadingView(icon: "photo.on.rectangle.angled", title: "Wilderness in Pictures")
}
