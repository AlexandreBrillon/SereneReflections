//
//  DiagonalLinePattern.swift
//  HabitApp
//
//  Created by Alexandre  Brillon on 2024-10-15.
//

import Foundation
import SwiftUI

struct DiagonalLinePattern: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let spacing: CGFloat = 20
                for x in stride(from: 0, through: geometry.size.width, by: spacing) {
                    path.move(to: CGPoint(x: x, y: 0))
                    path.addLine(to: CGPoint(x: x - geometry.size.height, y: geometry.size.height))
                }
            }
            .stroke(Color.white, lineWidth: 0.5)
        }
    }
}
