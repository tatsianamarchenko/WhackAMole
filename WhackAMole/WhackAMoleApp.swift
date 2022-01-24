//
//  WhackAMoleApp.swift
//  WhackAMole
//
//  Created by Tatsiana Marchanka on 24.01.22.
//

import SwiftUI

@main
struct WhackAMoleApp: App {
    var body: some Scene {
        WindowGroup {
          ContentView(viewModel: WhackAMoleViewModel())
        }
    }
}
