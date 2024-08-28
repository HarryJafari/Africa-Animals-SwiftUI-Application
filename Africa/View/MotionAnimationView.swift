//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Harry Jafari on 16/8/2024.
//

import SwiftUI

struct MotionAnimationView: View {
    
    //Propertires
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating: Bool = false
    
    //Functions
    // 1)
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    // 2)
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 100...300))
    }
    // 3)
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    //4)
    func randomSpeech() -> Double {
        return Double.random(in: 0.025...1.0)
    }
    //5)
    
    func randomDelay() -> Double {
        return Double.random(in: 0.0...2.0)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize() , height: randomSize() , alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(x: randomCoordinate(max: geometry.size.width),
                                  y: randomCoordinate(max: geometry.size.height))
                        .animation(
                            Animation.interpolatingSpring(
                                stiffness:0.5,
                                damping: 0.5)
                            .repeatForever()
                            .speed(randomSpeech())
                            .delay(randomDelay())
                        )
                        .onAppear(perform: {
                            isAnimating = true
                        })
                }//Loop
            }// ZSTACK
            .drawingGroup() // For the Performance // USE GPU INSTEED OF CPU
            
        }// GEOMETRY
    }
}

#Preview {
    MotionAnimationView()
}
