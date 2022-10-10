//
//  ContentView.swift
//  Sec5-8_TextField
//  
//  Created in 2022/10/10
//  
//

import SwiftUI

/**
 -----------------------------------------------------------------
 キーボードでテキストフィールドに入力する
 iPhoneのキーボード入力を試すためにライブプレビューではなくシュミレーターを使って
 動作テストする。

 ■ テキストフィールドをつくる
 テキストフィルドは`TextField`でつくる。
 ```Swift テキストフィールドの書式
 TextField("プレースホルダの値", text: $格納する変数)
 ```
テキストフィールドに数値を入れでも`String型の文字列`になる。
 -----------------------------------------------------------------
 */
struct ContentView: View {
    @State var name: String = ""

    var body: some View {
        TextField("お名前は？", text: $name)
            // 角丸の枠
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(width: 250)

        // 名前が空でないとき表示
        if (!name.isEmpty) {
            Text("\(name)さん、こんにちは")
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
 ■ キーボードの種類を指定する
 キーボードの種類は`keyboardtype(.numberPad)`のように指定する。numberPad
 を指定すると、`0 ~ 9の数字だけのキーボード`が表示される。

 ■ テキストフィールドの計算結果を表示する
個数チェック関数で分岐した結果がどうであれTextで表示するので、全体を
 `Group{}で囲い`、結果のTextに`共通したframeサイズを指定`している。
 `Groupは複数のビューをひとまとめにして同じ設定をしたいときに有効。`

 ■ 個数チェック関数
 個数チェックでは、個数に入っている値がString型なので数値に変換(キャスト)する必
 要がある。ただし、`必ず整数に変換できるとは限らない。`そこで`guard let-else`
 という構文を使い、整数に変換できるなら変換後の値をnumに代入し、変換できなかった
 らfalseを返却して処理終了する。

 ■ 料金計算する関数
 個数チェック関数で個数が1 ~ 10の整数に変換できることをチェックしているので
 Double(quantity)がnilになることはないが、安全のため`if let-else`を使って
 `オプショナルバインディング`と呼ばれるコードを入れて
 `Double(quantity)がnilであった場合のエラー回避`をしている。

 ■ 入力確定のDoneボタンを追加する
 テキストフィールドが入力状態になったときに表示されるキーボードにはreturnキー(改行)
 を入力することでキーボードを下げることができる。しかし、keyboardTypeが
 `numberPadで表示されるキーボードにはreturnキーがない`ことから、実機では表示
 されたキーボードを下げることができない。そこで、入力を確定しキーボードを下げる
 Doneボタンをキーボードのツールバーに追加する。
-----------------------------------------------------------------
 */
struct ContentView2: View {
    @FocusState var isInputActive: Bool     // フォーカスがあるかどうか示す
    @State var quantity: String = ""        // 個数
    let unitPrice: Double       = 250       // 単価
    let tax                     = 1.1       // 税

    var body: some View {
        VStack(alignment: .leading) {
            // 入力テキストフィールド
            HStack {
                Text("個数 : ").padding(.horizontal, 0)
                TextField("0", text: $quantity)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    // 数値入力のみ
                    .keyboardType(.numberPad)
                    .frame(width: 100)
                    // テキストフィールドのフォーカスを設定する
                    .focused($isInputActive)
            }
            .font(.title)
            .frame(width: 200)

            // 計算結果の表示
            Group {
                if quantityCheck(min: 1, max: 10) {
                    Text("\(priceCalc())円です。")
                        .font(.title)
                } else {
                    Text("個数は1 ~ 10個を入れてください。")
                        .foregroundColor(.red)
                        .font(.headline)
                }
            }.frame(width: 300, height: 30)
        }

        // キーボードのツールバーにDoneボタンをつくる
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    isInputActive = false
                }
            }
        }
    }

    /// 個数チェック
    /// - Parameters:
    ///   - min: 最小値
    ///   - max: 最大値
    /// - Returns: 範囲内であればtrue
    func quantityCheck(min: Int, max: Int) -> Bool {
        // Intにキャストできなければelse内の処理が実行される
        guard let num = Int(quantity) else {
            return false
        }
        return (num >= min && num <= max)
    }

    /// 料金の計算
    /// - Returns: 単価 * 個数 * 税
    func priceCalc() -> Int {
        // Doubleにキャストできなければelse内の処理が実行される
        if let num = Double(quantity) {
            let result = Int(unitPrice * num * tax)
            return result
        } else {
            return -1
        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
