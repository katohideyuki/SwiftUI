//
//  ContentView.swift
//  Sec2-1_addText
//  
//  Created in 2022/09/19
//

import SwiftUI

/// VStack, HStack
struct ContentView: View {

    /// リードオンリー変数
    var body: some View {
        // 垂直スタック（部品を縦に並べる）
        VStack {
            Text("Hello, world!")
                .padding()      // 一行空けるための修飾
            Text("Placeholder")
            Text("Placeholder 2")
        }

        // 水平スタック（部品を横に並べる）
        HStack {
            Text("Hello, wolrd!")
                .padding()
            Text("Placeholder 3")
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
