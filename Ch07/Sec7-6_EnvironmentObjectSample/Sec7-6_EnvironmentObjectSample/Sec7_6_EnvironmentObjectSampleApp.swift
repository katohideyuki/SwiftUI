//
//  Sec7_6_EnvironmentObjectSampleApp.swift
//  Sec7-6_EnvironmentObjectSample
//  
//  Created in 2022/11/02
//  
//

import SwiftUI

@main // アプリ起動時に最初に実行するコードに付ける
struct Sec7_6_EnvironmentObjectSampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ShareData())
        }
    }
}
