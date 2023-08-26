//
//  ColorView.swift
//  Grid_Example
//
//  Created by Denis Obukhov on 28.05.2020.
//  Copyright © 2020 Exyte. All rights reserved.
//

import SwiftUI

struct ColorView: View {
    @Environment(\.pixelLength) var pixelLength: CGFloat

    let color: GridColor
    let cornerRadius: CGFloat
    let debugSize: Bool

    init(_ color: GridColor, cornerRadius: CGFloat = 5, debugSize: Bool = false) {
        self.color = color
        self.cornerRadius = cornerRadius
        self.debugSize = debugSize
    }

    @ViewBuilder
    var underlyingBody: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .fill(
                LinearGradient(gradient:
                    Gradient(colors:
                        [Color(self.color.lighter()),
                         Color(self.color.darker())]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
        )
    }


    var body: some View {
        if debugSize {
            GeometryReader { proxy in
                ZStack {
                    underlyingBody

                    VStack {
                        Text("Pixels: \(proxy.size.width / pixelLength, specifier: "%.3f")")
                        Text("Points: \(proxy.size.width, specifier: "%.3f")")
                    }
                    .font(.caption2)

                }
            }
        } else {
            underlyingBody
        }
    }
}
