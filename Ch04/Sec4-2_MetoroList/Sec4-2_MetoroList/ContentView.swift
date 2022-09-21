//
//  ContentView.swift
//  Sec4-2_MetoroList
//  
//  Created in 2022/09/21
//  
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        /**
         配列をリスト表示する。
         - 繰り返し処理。
         */
        // 0 ~ 4の数を順にitemに取り出す繰り返し処理
        List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { index in
            HStack {
                // 番号を表示する
                Text(String(index))
                Text("Hello, world!")
            }
        }

        /**
         配列から要素を取り出してリストを表示する。
         - あらかじめ値が格納された配列を使う。
         - 要素数は変数名.countで定義できる。
            - ただし、定数ではないという警告「Non-costant range ~」が表示されてしまう。
              そのため、第2引数にid: \.selfのように引数idを指定する必要がある。
         */
        // 地下鉄路線
        let metoro = ["銀座線", "丸ノ内線", "日比谷線", "東西線", "千代田線", "半蔵門線", "南北線", "副都心線"]
        List(0 ..< metoro.count, id: \.self) { index in
            HStack {
                Text(String(index))
                // 地下鉄路線の配列から、路線名を取得して表示する
                Text(metoro[index])
            }
        }

        /**
         0 ..< metoro.count は、以下のように定義することも可能。
         - 変数名.indices
         */
        List(metoro.indices, id: \.self) { index in
            HStack {
                Text(String(index))
                Text(metoro[index])
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
