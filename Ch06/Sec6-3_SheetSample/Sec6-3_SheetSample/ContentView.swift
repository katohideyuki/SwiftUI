//
//  ContentView.swift
//  Sec6-3_SheetSample
//  
//  Created in 2022/10/14
//  
//

import SwiftUI
/**
 -----------------------------------------------------------------
 シートで作るハーフモーダルビュー
 現在のビューに重なるように表示されるビューのこと。下へのスワイプで元のビューに戻
 る。

 ■ sheetモディファイアを使用してハーフモーダルビューを表示する
 `sheet`モディファイアを使用して、現在の`ContentViewビュー上に重なるように
 `新規ビューをハーフモーダルビューとして表示`する。

 ■ モーダルが閉じたタイミングで実行する
 sheetモディファイアにはisPresentedだけではなく、`onDismiss`という引数も付
 けることができる。
 onDismissには`ハーフモーダルビューが閉じたタイミングで実行する処理`を定義する。
 -----------------------------------------------------------------
 */
struct ContentView: View {
    @State var isModal: Bool = false
    @State var counter: Int = 0

    var body: some View {
        VStack {
            // Sheetテスト用ボタンを作る
            Button(action: {
                isModal = true
            }) {
                Text("Sheet テスト")
            // isModalがtrueになればSomeViewが開く
            }.sheet(isPresented: $isModal, onDismiss: { countUp() }) {
                SomeView()
            }
            // 3回表示したらボタンを非活性にして無効にする
            .disabled(counter >= 3)
            Text("回数 : \(counter)")
                .font(.title)
                .padding()
        }
    }
    // ハーフモーダルビューが閉じたタイミングでインクリメントされる
    func countUp() { counter += 1 }
}

/**
 -----------------------------------------------------------------
 ■ モーダル用のビューを用意する
 -----------------------------------------------------------------
 */
struct SomeView: View {
    var body: some View {
        ZStack {
            // SomeViewビュー全体の背景
            Color.mint.opacity(0.2).ignoresSafeArea()
            VStack {
                Text("プレゼンテーション")
                    .background(
                        RoundedRectangle(cornerRadius: 30)
                            .fill(.green).opacity(0.8)
                            .frame(width: 90, height: 80)
                            .rotationEffect(.degrees(45))
                    )
                Image(systemName: "leaf")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        SomeView()      // SomeViewビューのプレビュー追加
    }
}
