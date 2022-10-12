//
//  ContentView.swift
//  Sec5-9_TextEditor
//  
//  Created in 2022/10/10
//  
//

import SwiftUI

/**
 -----------------------------------------------------------------
 ■ 入力編集ができるテキストエディタをつくる
 TextEditorをつくって`入力編集ができるテキストエディタ`をつくる。テキストデータ
 を保存する`@State`をつけた変数を用意し、`"""改行 ~ 改行"""`の区間は文章の改
 行を含めたStringになる。テキストエディタは`TextEditor(text:)`の一行で作るこ
 とができる。
 -----------------------------------------------------------------
 */
struct ContentView: View {
    @State private var theText: String = """
春はあけぼの。やうやう白くなり行く、山ぎは少しあかりて、紫だちたる雲の補足たなびきたる。
 ~ 中略 ~
冬はつとめて。雲の降りたるはいふべきにもあらず。霜のいと白きも、またさらでも、いと寒きに、
火などいそぎおこして、炭もてわたるもいとつきづきし。昼になりて、ぬるくゆるびもて行けば、
火桶の火も白き灰がちになりてわろし。
"""
    var body: some View {
        TextEditor(text: $theText)
            .lineSpacing(10)        // 行間
            .border(.gray)          // 外枠
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/**
 -----------------------------------------------------------------
 ■ テキストエディタのデータを保存/読み込みができるようにする
 テキストエディタを使うからには、入力したテキストデータを保存したり、保存したデータ
 を読み込み直すといったところまでやりたい。そのために`テキストエディタの`
 `テキストデータの保存と読み込みを行うボタンを追加`する。
 -----------------------------------------------------------------
 */
struct ContentView2: View {
    @State var theText: String = ""

    var body: some View {
        NavigationView {
            TextEditor(text: $theText)
                .lineSpacing(10)
                .border(.gray)
                // title「メモ」を表示するためpadding(.top)は除く
                .padding([.leading, .bottom, .trailing])
                .navigationTitle("メモ")
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
 ■ ツールバーに読み込みボタンと保存ボタンを追加する
 ツールバーのコンテンツとしてボタンごとにToolbarItemを作り、その中にボタンを配置
 する。ToolbarItem()の引数に`placement`で`.navigationBarTrailing`を指定
 するとツールバーの右端に寄った位置に表示される。

 ■ 保存ボタンでキーボードを下げ、保存を実行する
 テキストの保存と同時にテキストエディタの編集を終了してキーボードを下げたいので、
 `FocusState` を指定した定数isInputActiveを宣言し、テキストエディタのフォー
 カスを`focused($isInputActive)`で制御している。

 ■ saveText()定義：テキストファイルへの保存を例外処理の中で行う
 ユーザ定義関数の`docURL(fileName)`を実行して保存するURLを取得して、そのURLパ
 ス(url.path)に書き込む。何らかの理由で保存するURLが得られずにdocURL関数の結果
 がnilの場合があり、`guard let-else`によるオプショナルバインディングで取得して
 いる。
 -----------------------------------------------------------------
 */
struct ContentView3: View {
    // キーボードを下げるために定義する
    @FocusState var isInputActive: Bool
    @State var theText: String = ""

    var body: some View {
        NavigationView {
            TextEditor(text: $theText)
                .lineSpacing(10)
                .border(.gray)
                .padding([.leading, .bottom, .trailing])
                .navigationTitle("メモ")
                // テキストエディタのフォーカス
                .focused($isInputActive)
                // ツールバーをつくる
                .toolbar {
                    // 読み込みボタン
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("読み込む") {
                            if let data = loadText("sample.txt") {
                                theText = data
                            }
                        }
                    }
                    // 保存ボタン
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("保存") {
                            isInputActive = false   // キーボードを下げる
                            saveText(theText, "sample.txt")
                        }
                    }
                }
        }
    }
}

// テキストデータを保存する
func saveText(_ textData: String, _ fileName: String) {
    // URLを取得
    guard let url = docURL(fileName) else {
        return
    }
    // ファイルパスへの保存
    do {
        let path = url.path
        // ファイルにUTF8で書き込む
        try textData.write(toFile: path, atomically: true, encoding: .utf8)
    } catch let error as NSError {
        print(error)
    }
}

// テキストデータを読み込む
func loadText(_ fileName: String) -> String? {
    // URLを取得
    guard let url = docURL(fileName) else {
        return nil
    }
    // urlの読み込み
    do {
        // UTF8のファイルを読み込む
        let textData = try String(contentsOf: url, encoding: .utf8)
        return textData
    } catch {
        return nil
    }
}

/// 保存ファイルへのURLを作る
/// - Parameter fileName: ファイル名
/// - Returns: ファイルへのURL、またはnil ※URLを取得できなかった場合
func docURL(_ fileName: String) -> URL? {
    // fileManagerオブジェクト生成
    let fileManager = FileManager.default
    // 例外処理
    do {
        // DocmentsフォルダまでのURL取得
        let docsUrl = try fileManager.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: false)
        // DocumentsフォルダのURLにファイル名を追加し、
        // 「ファイルへURL」としてのURLを返却
        return docsUrl.appendingPathComponent(fileName)
    } catch {
        return nil
    }
}

struct ContentView3_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
    }
}
