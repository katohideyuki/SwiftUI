//
//  ContentView.swift
//  Sec6-1_AlertOKButton
//  
//  Created in 2022/10/12
//  
//

import SwiftUI

/**
 -----------------------------------------------------------------
 アラートを表示する
 ■ Alertテスト用のボタンをつくる
 ■ ボタンにalertモディファイアを追加する
 ■ アラートを表示するコードを追加する
 表示したいアラートは`Alert()`でつくる
 ■ ボタンのalert処理の中でアラートを表示する
 alert()の引数`isPresentedには、アラートを表示するかどうかを決めるBool型の値`
 を指定する。Alert()の引数`titleでアラートのタイトル`、引数
 `messageでえラーの説明`、引数`dismissButtonでボタンを指定`する。引数
 `actionでボタンをタップしたときに実行したい処理を定義`する。
 -----------------------------------------------------------------
 */
struct ContentView: View {
    @State var isError: Bool = false

    var body: some View {

        Button(action: { isError = true }) {
            Text("Alert テスト")
        }.alert(isPresented: $isError) {
            Alert(title: Text("タイトル"), message: Text("メッセージ文"),
                  dismissButton: .default(Text("OK"), action: {}))
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
 ■ OKとキャンセルがあるアラートを表示する
 2つボタンがあるアラートでは、Alert()の引数に`primaryButton`、
 `secondaryButton`ボタンを指定する。なお、`cancel()`で指定する「キャンセル」
 ボタンは、primaryButton、secondayButtonのどちらで指定しても左側に配置され
 る。キーボードが接続されている場合は、`default()`で指定したボタンがreturnキー
 あるいはenterキーで選択される。
 -----------------------------------------------------------------
 */
struct ContentView2: View {
    @State var isError: Bool = false

    var body: some View {
        Button(action: { isError = true }) {
            Text("Alertテスト")
        }.alert(isPresented: $isError) {
            Alert(title: Text("タイトル"), message: Text("メッセージ文"),
                  primaryButton: .default(Text("OK"),
                                          action: { okAction() }),
                  secondaryButton: .cancel(Text("キャンセル"),
                                           action: {})
            )}.padding()
    }
}

// OKボタンがタップされたら出力
func okAction() {
    print("OKボタンが選ばれた")
}

struct ContentView2_previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}

/**
 -----------------------------------------------------------------
 ■ 赤文字で警告する削除ボタン
 `destructive()`でつくるボタンは赤文字で表示される。用途としては削除ボタンなど
 の実行に`注意が必要となる選択肢に用いられる`。キーボードが接続されているときは、
 returnキーまたはenterキーで選択されている。
 -----------------------------------------------------------------
 */
struct ContentView3: View {
    @State var isError: Bool = false

    var body: some View {
        Button(action: { isError = true }) {
            Text("Alert警告テスト")
        }.alert(isPresented: $isError) {
            Alert(title: Text("タイトル"), message: Text("確認メッセージ"),
                  primaryButton: .destructive(Text("削除する"), action: {}),
                  secondaryButton: .cancel(Text("キャンセル"), action: {}))
        }
    }
}

struct ContetView3_previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
    }
}
