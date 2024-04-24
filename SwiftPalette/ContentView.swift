//
// Copyright © 2024 Antonio Marques. All rights reserved.
//

import SwiftUI

extension Color {
    static let baseColors: [(inverted: Bool, Color)] = [
        .white,
        .pink,
        .red,
        .orange,
        .yellow,
        .green,
        .teal,
        .cyan,
        .blue,
        .indigo,
        .purple,
        .brown,
        .gray,
        .black,
    ]
        .map { (inverted: false, $0) }

    static let invertedColors: [(inverted: Bool, Color)] = [
        .black,
        .teal,
        .cyan,
        .blue,
        .indigo,
        .purple,
        .pink,
        .red,
        .orange,
        .yellow,
        .green,
        .brown,
        .gray,
        .white,
    ]
        .map { (inverted: true, $0) }

    static let basePlusInvertedColors: [(inverted: Bool, Color)] = [
        (false, .white),
        (true, .black),
        (false, .pink),
        (false, .red),
        (true, .teal),
        (true, .cyan),
        (true, .blue),
        (false, .orange),
        (false, .yellow),
        (true, .indigo),
        (true, .purple),
        (false, .green),
        (true, .pink),
        (true, .red),
        (false, .teal),
        (false, .cyan),
        (false, .blue),
        (true, .orange),
        (true, .yellow),
        (false, .indigo),
        (false, .purple),
        (true, .green),
        (true, .brown),
        (false, .brown),
        (false, .gray),
        (true, .gray),
        (false, .black),
        (true, .white),
    ]
}

extension Color {
    var variants: [any ShapeStyle] {
        [
            quaternary,
            tertiary,
            secondary,
            self,
            gradient,
            gradient.secondary,
            gradient.tertiary,
            gradient.quaternary,
        ]
    }
}

struct ContentView: View {
    let colors: [(inverted: Bool, Color)]

    var body: some View {
        let views = colors.map { (
            $0,
            $0.inverted ?
            $0.1.variants.map {
                AnyView(
                    Rectangle().fill(AnyShapeStyle($0))
                        .colorInvert()
                        .rotationEffect(.radians(.pi))
                )
            } :
            $0.1.variants.map {
                AnyView(
                    Rectangle().fill(AnyShapeStyle($0))
                )
            }
        )}
        VStack(spacing: 0) {
            ForEach(views.indices, id: \.self) { index in
                let color = views[index].0
                let variants = views[index].1
                HStack(spacing: 0) {
                    ForEach(variants.indices, id: \.self) {
                        if $0 == 1 && color.inverted {
                            variants[$0]
                                .overlay {
                                    Text("inverted")    }
                        } else if $0 == 2 {
                            variants[$0]
                                .overlay {
                                    Text(color.1.description)
                                }
                        } else {
                            variants[$0]
                        }
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView(colors: Color.baseColors)
}

#Preview {
    ContentView(colors: Color.invertedColors)
}

#Preview {
    ContentView(colors: Color.basePlusInvertedColors)
}
