//
//  AnimalListItemView.swift
//  Africa
//
//  Created by Harry Jafari on 9/8/2024.
//

import SwiftUI

struct AnimalListItemView: View {
    let animal: Animal
    var body: some View {
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 16) {
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading , spacing: 8) {
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(animal.description)
                    .font(.footnote)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .padding(.trailing , 8)
            }
        }
    }
}

#Preview {
    AnimalListItemView(animal: Animal(id: "", name: "animal", headline: "animal", description: "", link: "", image: "lion", gallery: [""], fact: [""]))
        .previewLayout(.sizeThatFits)
        .padding()
}
