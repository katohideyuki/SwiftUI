//
//  ContentView.swift
//  Sec5-5_MenuStyleSample
//  
//  Created in 2022/10/08
//  
//
/**
 -----------------------------------------------------------------
 メニュースタイルのピッカーをつくる
 ピッカーは複数の値の中から1つを選ぶUIとして利用される。ピッカーにはいくつかスタイ
 ルがあり、iOSで利用できるメニュースタイルとセグメンテッドスタイル試してみる。

 ```Swift ピッカーの書式
 Picker(selection: 選択されたインデックス番号を格納する変数, label: ラベル名) {
    // 選択肢
    Text("選択肢1").tag(インデックス番号)
 }.pickerStyle(ピッカーのスタイル)
 ```

 画面に表示される選択肢は定義した順ではなく、tagの番号順に表示される。ピッカーのス
 タイルは、省略可能で定義しない場合はピッカースタイルが`.menu`になる。
 -----------------------------------------------------------------
 */
import SwiftUI

struct ContentView: View {
    // 選択したインデックス番号が格納される
    @State private var selectedColor = 0

    let colorViews: [Color] = [.red, .green, .blue]
    let colorName = ["Red", "Green", "Blue"]

    var body: some View {
        VStack {
            // "Red", "Green", "Blue"から値を選ぶホイールピッカーをつくる
            Picker(selection: $selectedColor, label: Text("Color")) {
                // 選択できるアイテム
                Text("Red").tag(0)
                Text("Green").tag(1)
                Text("Blue").tag(2)
            }
            // ピッカーのスタイル「セグメント」
            .pickerStyle(.segmented)

            HStack {
                // ピッカーで選んだアイテムのインデックス番号が入る
                colorViews[selectedColor]
                    // 選んだ値によって表示される文字の長さでレウアウトが崩れないようにする
                    . frame(width: 50, height: 100)
                Text("value: \(selectedColor)").frame(width: 60)
                Text("\(colorName[selectedColor])").frame(width: 70)
            }
        }
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
 ピッカーで選んだ値で処理を分岐する
 ピッカーでは定義された選択肢は必ず1個の値を選択するので、条件によって分岐させるこ
 とができる。
 -----------------------------------------------------------------
 */
struct ContentView2: View {
    // 選択したインデックス番号が格納される
    @State private var selectedColor = 0

    let colorViews: [Color] = [.red, .green, .blue]
    let colorName = ["Red", "Green", "Blue"]

    var body: some View {
        VStack {
            Picker(selection: $selectedColor, label: Text("Color")) {
                Text("Red").tag(0)
                Text("Green").tag(1)
                Text("Blue").tag(2)
            }
            .pickerStyle(.segmented)
            .frame(width: 250, height: 30)
            .padding()

            // 選択された色を取得
            let color = colorViews[selectedColor]
            // colorで処理を振り分ける
            switch color {
            case .red:
                Rectangle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.red)

            case .green:
                Circle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.green)

            case .blue:
                Circle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.blue)

            default:
                Text("default")
            }
            Text(colorName[selectedColor])
        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
