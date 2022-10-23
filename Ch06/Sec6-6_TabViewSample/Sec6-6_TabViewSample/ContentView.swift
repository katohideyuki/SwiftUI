//
//  ContentView.swift
//  Sec6-6_TabViewSample
//  
//  Created in 2022/10/23
//  
//

import SwiftUI
/**
 -----------------------------------------------------------------
 タブで切り替えるタブビューを作る
 タグ番号は`tag(1), tag(2)`のように指定する番号。tabItem{}の中にタブのボタン
 として表示される。
 -----------------------------------------------------------------
 */
struct ContentView: View {
    // 選ばれているタプのタグ番号が入る変数。初期値 1
    @State var selectedTag = 1

    var body: some View {
        TabView(selection: $selectedTag) {
            Text("Tab Content 1").tabItem { Text("Tab Label 1") }.tag(1)
            Text("Tab Content 2").tabItem { Text("Tab Label 2") }.tag(2)
            Text("Tab Content 3").tabItem { Text("Tab Label 3") }.tag(3)
        }
        .font(.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
