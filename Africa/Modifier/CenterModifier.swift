//
//  CenterModifier.swift
//  Africa
//
//  Created by Harry Jafari on 29/8/2024.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack{
            Spacer()
            content
            Spacer()
        }
    }
}
