//
//  CreditsView.swift
//  Africa
//
//  Created by Harry Jafari on 29/8/2024.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128 , height: 128)
            Text("""
    Copyright @ Harry Jafari
    All right reserved
    Better Apps ♡ Less Code
    """)
            .font(.footnote)
        .multilineTextAlignment(.center)
        }
        .padding()
        .opacity(0.4)
    }
}

#Preview {
    CreditsView()
        .previewLayout(.sizeThatFits)
        .padding()
}
