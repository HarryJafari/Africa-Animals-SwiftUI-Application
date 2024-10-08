//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Harry Jafari on 16/8/2024.
//

import SwiftUI

struct MapAnnotationView: View {
    
    var location: NationalParkLocationModel
    
    @State private var animation: Double = 0.0
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)
            
            Circle()
                .stroke(Color.accentColor , lineWidth: 2)
                .frame(width: 52 , height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
            .clipShape(Circle())
        }
        .onAppear {
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
    }
}

struct MapAnnotationView_Previews: PreviewProvider {
    
    static let locations: [NationalParkLocationModel] = Bundle.main.decode("locations.json")
    
    static var previews: some View {
        NavigationView {
            MapAnnotationView(location: locations[0])
            
        }
    }
}
