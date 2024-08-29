//
//  ContentView.swift
//  Africa
//
//  Created by Harry Jafari on 1/8/2024.
//

import SwiftUI

struct ContentView: View {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    @State private var isGrideViewAcrive: Bool = false
    
    //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    @State private var grideLayout : [GridItem] = [GridItem(.flexible())]
    @State private var grideColumn: Int = 1
    @State private var toolBarIcon: String = "square.grid.2x2"
    
    func grideSwitch() {
        grideLayout = Array(repeating: .init(.flexible()), count: grideLayout.count % 3 + 1)
        grideColumn = grideLayout.count
        print("Grid Number \(grideColumn)")
        
        switch grideColumn {
        case 1:
            toolBarIcon = "square.grid.2x2"
        case 2:
            toolBarIcon = "square.grid.3x2"
        case 3:
            toolBarIcon = "rectangle.grid.1x2"
        default:
            toolBarIcon = "square.grid.2x2"

        }
    }
    
    
    var body: some View {
            NavigationView {
                Group {
                    if !isGrideViewAcrive {
                        List {
                            CoverImageView()
                                .frame(height: 300)
                                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalListItemView(animal: animal)
                                }//LINK
                            }//Loop
                            
                           CreditsView()
                                .modifier(CenterModifier())
                               
                        }//Grid
                        .listStyle(PlainListStyle())
                       
                    } else {
                        ScrollView(.vertical) {
                            LazyVGrid(columns: grideLayout, content: {
                                ForEach(animals) {item in
                                    NavigationLink(destination: AnimalDetailView(animal: item)) {
                                        AnimalGrideItemView(animal: item)
                                    }
                                  
                                    
                                }
                                
                            })
                        }//end Scroll
                    }// Enf of Condition
                }//End Group
                .navigationBarTitle("Africa", displayMode: .large)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack(spacing: 16) {
                            Button(action: {
                                //Acrion
                                isGrideViewAcrive = false
                                haptics.impactOccurred()
                            }){
                                Image(systemName: "square.fill.text.grid.1x2")
                                    .font(.title2)
                                    .foregroundColor(isGrideViewAcrive ? .primary : .accentColor)
                            }
                            //GRID
                            Button(action: {
                                //Action
                                isGrideViewAcrive = true
                                haptics.impactOccurred()
                                grideSwitch()
                            }) {
                                Image(systemName: toolBarIcon)
                                    .font(.title2)
                                    .foregroundColor(isGrideViewAcrive ? .accentColor : .primary)
                                
                            }
                        }
                    }
                }
            }
    }
}

#Preview {
    ContentView()
}

