//
//  ContentView.swift
//  Sec2-2_addTextStacking
//  
//  Created in 2022/09/19
//  
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Hello, world!")
                    .padding()
                Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/)
            }
            HStack {
                Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/)
                Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/**
 Commond + View(Textなどを選択)
 - アクションメニューが表示され、Embed in HStack など選択すれば
   該当箇所に　HStack{}のブロックで囲まれたコードになる。
 - ライブラリを操作する場合、ドラッグ&ドロップではなく、ダブル
   クリックでも適応する
 - エディター右側のContent View に対して、Commong + 選択しても
   アクションメニューが表示される。
 */
