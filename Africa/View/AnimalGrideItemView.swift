//
//  AnimalGrideItemView.swift
//  Africa
//
//  Created by Harry Jafari on 28/8/2024.
//

import SwiftUI

struct AnimalGrideItemView: View {
    let animal: Animal
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

struct AnimalGrideItemView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode ("animals.json")
    
    static var previews: some View {
        NavigationView {
            AnimalGrideItemView(animal: animals[0])
        }
    }
}
