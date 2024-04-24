//
// Copyright © 2024 Antonio Marques. All rights reserved.
//

import SwiftUI

@main
struct SwiftPaletteApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(colors: Color.basePlusInvertedColors)
        }
    }
}
