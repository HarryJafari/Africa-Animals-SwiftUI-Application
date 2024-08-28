//
//  GalleryView.swift
//  Africa
//
//  Created by Harry Jafari on 1/8/2024.
//

import SwiftUI

struct GalleryView: View {
    
    @State private var selectedAnimal: String = "lion"
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let heptics = UIImpactFeedbackGenerator(style: .medium)
    
    //Simple Gride Definetion
//    let gridLayout: [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
    
    //Efficient Grid Defenition
    //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var grideColumn: Double = 3.0
    
    func gridSwitch(){
        gridLayout = Array(repeating: .init(.flexible()), count: Int(grideColumn))
    }
    
    
    var body: some View {
        ScrollView(.vertical , showsIndicators: false) {
            VStack(alignment: .center , spacing: 30) {
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(Color.white , lineWidth: 10))
                
                //Slider
                
                Slider(value: $grideColumn , in:2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: grideColumn, perform: { value in
                        gridSwitch()
                    })
                LazyVGrid(columns: gridLayout,alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white , lineWidth: 2))
                            .onTapGesture {
                                selectedAnimal = item.image
                                heptics.impactOccurred()
                            }
                        
                        
                    }
                }// End of Grid
                .animation(.easeIn)
                .onAppear(perform: {
                    gridSwitch()
                })
            } // VStak
            .padding(.horizontal,10)
            .padding(.vertical , 50)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ , maxHeight: .infinity)
        .background(MotionAnimationView())
        
    }
}

#Preview {
    GalleryView()
}
