//
//  CoverImageView.swift
//  Africa
//
//  Created by Harry Jafari on 4/8/2024.
//

import SwiftUI

struct CoverImageView: View {
    
    //MARK: properties
    
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    
    //MARK: Body
    var body: some View {
        TabView{
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                .scaledToFill()
            } //: LOOP
        }//: TabView
        .tabViewStyle(PageTabViewStyle())
       
    }
}

// MARK: Review
#Preview {
    CoverImageView()
        .previewLayout(.fixed(width: 400, height: 300))
}
