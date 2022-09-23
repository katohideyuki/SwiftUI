//
//  ContentView.swift
//  Sec4-3_ListSection
//  
//  Created in 2022/09/22
//  
//

import SwiftUI

struct ContentView: View {
    let SHIKOKU = ["徳島県", "香川県", "愛媛県", "高知県"]
    let KYUSYU  = ["福岡県", "佐賀県", "長崎県", "熊本県", "大分県", "宮崎県", "鹿児島県"]

    var body: some View {
        /**
         リストをセクションで分ける。
         - Section(header: footer:)でヘッダとフッタを設定する。
         - セクションの中はListで各行を作る場合と同じ。

         リストの表示スタイル
         - listStyle(GroupedListStyle()) を指定すると、セクションの横幅がデバイスの側辺まで伸びた
           形になる。
         */
        List {
            // 1つ目のセクション(四国)
            // ヘッダとフッタを付ける
            Section(header: Text("四国").font(.largeTitle).padding(.top),
                    footer: Text("最高標高は石鎚山の1,982m")) {
                // itemには四国の県名が順に格納される
                ForEach(SHIKOKU, id: \.self) { item in
                    Text(item)
                }
            }
            // 2つ目のセクション(九州)
            Section(header: Text("九州").font(.largeTitle).padding(.top),
            footer: Text("最高標高は宮之浦岳の1,936m")) {
                // itemには九州の県名が順に格納される
                ForEach(KYUSYU, id: \.self) { item in
                    Text(item)
                }
            }
        }
        // リストのスタイルにGroupedListStyleを指定することで、行の幅が画面サイズと同じになる
        .listStyle(GroupedListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
