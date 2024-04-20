//
//  CoverImageView.swift
//  Africa
//
//  Created by Hasan on 4/20/24.
//

import SwiftUI

struct CoverImageView: View {
    
    // MARK: - Properties

    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    // MARK: - Body
    var body: some View {
        TabView{
            ForEach(coverImages) { cover in
                Image(cover.name)
                    .resizable()
                    .scaledToFill() 
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

#Preview(traits: .fixedLayout(width: 400, height: 300)) {
    CoverImageView()
}
