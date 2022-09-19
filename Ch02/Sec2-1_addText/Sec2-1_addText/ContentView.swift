//
//  ContentView.swift
//  Sec2-1_addText
//  
//  Created in 2022/09/19
//  
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // 水平スタック (部品を横に並べる)
        HStack {
            // 垂直スタック (部品を縦に並べるVStack)
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
                    .padding()
                Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/)
                Text("Placeholder 2")
            }
            Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/**
 ## ■ 変数bodyは値を代入しないリードオンリーの変数
 - 式の値を返す変数
 var 変数名 : 型 {
    ステートメント
    return
 }
 
 - ステートメントの式の値が1つだけなら予約語returnを省略できる。
 var 変数名 : 型 {
    ステートメントの式の値
 }
 
 */
