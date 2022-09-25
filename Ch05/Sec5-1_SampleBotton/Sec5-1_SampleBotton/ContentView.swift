//
//  ContentView.swift
//  Sec5-1_SampleBotton
//  
//  Created in 2022/09/25
//  
//

import SwiftUI

/**
 -----------------------------------------------------------------
 乱数を表示するボタンを作る
 ボタンの定義 その1
 ```Swift
 Button(action: { 実行するアクション }) {
    Text(ボタン名)
 }
 ```

 @Stateを付けて変更可能な変数にする
 `@State`を付けて宣言された変数は値の更新が見張られるようになり、値が変化したな
 らば値を反映するためにViewも更新されるようになる。
 -----------------------------------------------------------------
 */
struct ContentView: View {
    // ContentView構造体の自身が書き換える変数
    // @Stateを付けないと、numプロパティは不変とみなされエラーとなる
    @State var num: Int = 0

    var body: some View {
        VStack {
            Button(action: {
                // 0 ~ 100の乱数を作り、numプロパティに代入
                num = Int.random(in: 0...100)
                // Debug Preview ※デバッグエリアに出力される
                //                print(num)
            }) {
                // ボタンのレイアウト ※角丸四角形のピンクボタン
                Text("Random Button")
                    .font(.largeTitle)
                    .frame(width: 280, height: 60, alignment: .center)
                    .foregroundColor(.white)
                    .background(Color.pink)
                    .cornerRadius(15, antialiased: true)        // 最後に実行
            }
            // numプロパティを画面に表示する ※ボタンを押すごとに値が更新される
            Text("\(num)")
                .font(.largeTitle)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/**
 -----------------------------------------------------------------
 Buttonの簡易的な書式
 ボタンの書式 その2
 ```Swift
 Button("ボタン名"){
    実行するアクション
 }
 ```
 -----------------------------------------------------------------
 */
struct ContentView2: View {
    @State var msg = "Thank you!"

    var body: some View {
        VStack {
            // ボタンのタップでmsgの値を入れ替える
            Button("Tap") {
                if msg == "Thank you!" {
                    msg = "ありがとう!"
                } else {
                    msg = "Thank you!"
                }
            }
            // ボタンのレイアウト ※カプセル形のボタン
            .font(.headline)
            .foregroundColor(.white)
            .background(
                Capsule()       // カプセルの形の図形
                    .foregroundColor(.green)
                    .frame(width: 80, height: 30)
            )
            // msgプロパティを画面に表示する
            Text(msg).padding()
        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}

/**
 -----------------------------------------------------------------
 ボタン名を引数labelで指定
 ボタンの書式 その3
 ```Swift
 Button(action: { 実行するアクション }, label: {
    Text(ボタン名)
 }
 ```
 -----------------------------------------------------------------
 */
struct ContentView3: View {
    @State var num: Int = 0

    var body: some View {
        HStack {
            // numプロパティを画面に表示する
            Text("\(num)")
                .font(.system(size: 50))
                .padding(.trailing)
            // カウントアップ
            Button(action: { num += 1}, label: {
                Text("Tap").font(.largeTitle)
            })
        }
        .frame(width: 200, height: 80, alignment: .center)
        .border(.gray, width: 1)
    }
}

struct ContentView3_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
    }
}
