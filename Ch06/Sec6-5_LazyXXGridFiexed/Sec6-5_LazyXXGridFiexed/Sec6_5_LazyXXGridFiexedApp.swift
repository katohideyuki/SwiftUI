//
//  Sec6_5_LazyXXGridFiexedApp.swift
//  Sec6-5_LazyXXGridFiexed
//  
//  Created in 2022/10/16
//  
//

import SwiftUI

@main
struct Sec6_5_LazyXXGridFiexedApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            LazyVGridFixed2()
            LazyVGridFlexible()
            LazyVGridAdaptive()
            LazyHGridFixed()
        }
    }
}
