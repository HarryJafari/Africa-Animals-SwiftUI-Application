//
//  InsetFactView.swift
//  Africa
//
//  Created by Harry Jafari on 13/8/2024.
//

import SwiftUI
 
struct InsetFactView: View {
    let animal:Animal
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact , id: \.self) { item in
                    Text(item)
                        
                    
                }
            }// tabview
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }//: Group BOX
    }
}

struct InsetFactView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode ("animals.json")
    
    static var previews: some View {
        NavigationView {
            InsetFactView(animal: animals[0])
        }
    }
}
