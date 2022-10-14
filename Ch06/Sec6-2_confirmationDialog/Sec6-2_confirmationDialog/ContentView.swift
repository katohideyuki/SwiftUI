//
//  ContentView.swift
//  Sec6-2_confirmationDialog
//  
//  Created in 2022/10/14
//  
//

import SwiftUI
/**
 -----------------------------------------------------------------
 確認ダイアログを表示する
 画面の下辺から登場する確認ダイアログ（コンファメーションダイアログ）は削除の確認
 などに用いる。

 ■ 確認ダイアログを表示するボタンを作る
 -----------------------------------------------------------------
 */
struct ContentView: View {
    @State private var isShowingDialog = false

    var body: some View {
        // 削除ボタン
        Button(action: {
            isShowingDialog = true
        }) {
            Label("削除ボタン", systemImage: "trash")
        }.confirmationDialog("注意!",
                             isPresented: $isShowingDialog,
                             titleVisibility: .visible) {
            // 選択肢1
            Button("削除する", role: .destructive) {
                destructiveAction()
            }
            // 選択肢2
            Button("キャンセル", role: .cancel) {
                cancelAction()
            }
        // 本文
        } message: {
            Text("削除すると戻せません。")
        }
    }
}

func destructiveAction() { print("削除が選ばれた!") }
func cancelAction()      { print("キャンセルが選ばれた!") }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
