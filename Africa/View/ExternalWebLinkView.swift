//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Harry Jafari on 13/8/2024.
//

import SwiftUI

struct ExternalWebLinkView: View {
    let animal: Animal
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("WIKIPEDIA")
                Spacer()
                Group {
                    Link(destination: (URL(string: animal.link) ?? URL(string: "google.com")!)) {
                        Text(animal.name)
                    }
                    
                    Image(systemName: "arrow.up.right.square")
                    
                   
                }
                .foregroundColor(.accentColor)
            }
        }
        
    }
}

struct ExternalWebLinkView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode ("animals.json")
    
    static var previews: some View {
        NavigationView {
        ExternalWebLinkView(animal: animals[0])
        }
    }
}
