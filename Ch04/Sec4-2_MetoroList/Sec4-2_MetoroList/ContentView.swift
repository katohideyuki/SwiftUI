//
//  ContentView.swift
//  Sec4-2_MetoroList
//  
//  Created in 2022/09/21
//  
//

import SwiftUI

struct ContentView: View {

    let FRUITS = ["Apple", "Grape", "Peach", "Banana", "Plum", "Mango", "Yuzu", "Lime", "Lemon"]
    @State private var searchText = ""

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

        /**
         配列から順に要素を取り出す ForEach-in
         配列から要素を順に取り出したいとき、Viewのbodyではfor-inではなくForEach-inを
         使うことで配列の要素数を順に取り出すことができる。
         */
        VStack {
            let COLORS: [Color] = [.red, .blue, .green, .orange, .yellow]
            // 配列の先頭から順に取り出す
            ForEach(COLORS.indices, id: \.self) { index in
                // 四角形を描く
                Rectangle()
                    .frame(width: 150, height: 30)
                    .foregroundColor(COLORS[index])
            }
        }

        /**
         配列のフィルタリングを利用する。
         - 配列のfilter()関数を利用することで、リストに並んでいる値を検索で絞り込んで表示する。
         検索語句を入力する検索ボックスは、Listのserchable()モディフィアで表示できる。
         */
        NavigationView {
            List {
                // フィルタリングの結果だけを表示する
                ForEach(serchResults, id: \.self) { name in
                    Text(name)
                }
            }
            // 検索ボックスを表示 (「フルーツの検索」は、プレースホルダーとして表示)
            .searchable(text: $searchText, prompt: "フルーツの検索")
            .keyboardType(.default)
            .navigationTitle("人気フルーツ")
        }
    }

    // 検索結果を返却する
    var serchResults: [String] {
        if searchText.isEmpty {
            return FRUITS
        } else {
            // 配列FRUITSをフィルタリングして得られた配列が変数の値となる
            return FRUITS.filter { $0.contains(searchText) }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
