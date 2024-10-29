//
//  PatternBackgroundView.swift
//
//  Created by Alexandre  Brillon on 2024-10-15.
//

import SwiftUI

struct PatternBackgroundView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.teal.opacity(0.9), Color.blue.opacity(0.8)]),
                           startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)

            DiagonalLinePattern()
                .blendMode(.overlay)
                .opacity(0.1)
        }
    }
}

#Preview {
    PatternBackgroundView()
}
