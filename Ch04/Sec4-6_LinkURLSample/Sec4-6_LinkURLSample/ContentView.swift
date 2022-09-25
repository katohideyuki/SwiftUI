//
//  ContentView.swift
//  Sec4-6_LinkURLSample
//  
//  Created in 2022/09/25
//  
//

import SwiftUI

/**
 -----------------------------------------------------------------
 Webページのデータを構造体で定義する
 -----------------------------------------------------------------
 */
struct webData: Identifiable {
    // 必須プロパティであるidのみ初期値を設定
    var id = UUID()
    var name: String
    var url: String
    var favicon: String
}

// Webデータのリストを作る
let webList = [
    // idは初期値を設定しているので省略
    webData(name: "アップル", url: "https://www.apple.com/jp/", favicon: "apple"),
    webData(name: "東京国立博物館", url: "https://www.tnm.jp", favicon: "tnm"),
    webData(name: "東京都現代美術館", url: "https://www.mot-art-museum.jp", favicon: "mo"),
    webData(name: "川崎水族館", url: "https://kawa-sui.com", favicon: "kawa-sui")
]

/**
 -----------------------------------------------------------------
 標準ブラウザで開くWebリンクリストを作る
 タップするとWebブラウザでWebページを開くリンクは
 `Link(タイトル名, destination: URL(string: URLの文字列))`の書式で作るこ
 とができる。第一引数は外部引数名が`_`なので引数名は不要。

 URLのチェック
 URLの書式が間違っているとエラーになるため、正しいURLを取得できているかどうか
 チェックすることができる。
 `urlのオプションバインディング`と`UIApplication.shared.canOpenURL(url)`
 によるURLチェックを組み合わせる。

 複数条件のif文
 複数の条件式をカンマで区切り、左の式から順に評価する。この場合、オプショナルバイ
 ンディング`URL(String: list.url)`の結果が`url`に代入される。その後urlに代入
 された値が有効なURLかどうかを`canOpenURL(url)`でチェックしている。
 ※ 最初の式`URL(String: list.url)`の結果が`nil`だった場合、右側の式は評価さ
 れず、else文へ抜ける。
 -----------------------------------------------------------------
 */
struct ContentView: View {
    var body: some View {
        NavigationView {
            List(webList) { list in
                HStack {
                    // ファビコン
                    Image(list.favicon).resizable().frame(width: 40, height: 40)
                    // Webリンク ※URLチェックなしの場合は、この書式でWebリンクに遷移できる
//                        Link(list.name, destination: URL(string: list.url)!)

                    // URLチェック
                    if let url = URL(string: list.url), UIApplication.shared.canOpenURL(url) {
                        // URLが正しい場合 → Webリンクに遷移
                        Link(list.name, destination: url)
                    } else {
                        // URLが不正の場合 → エラーメッセージを表示
                        Text(list.name).foregroundColor(.gray)
                        + Text("URLエラー").foregroundColor(.red).italic()
                    }

                }
            }.navigationTitle("Webリスト")
        }.navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

