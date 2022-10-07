//
//  ContentView.swift
//  Sec5-4_SliderSample
//  
//  Created in 2022/10/04
//  
//

import SwiftUI

/**
 -----------------------------------------------------------------
 スライダーを作る
 スライダーの値は浮動小数点でそのまま表示すると桁数が多いので、小数点以下2位までを
 表示するように数値表示の桁数を2桁にする関数も作って適用する。

 `値の範囲は省略でき、省略すると0 ~ 1の範囲になる。`値は整数ではなく、小数点以
 下がある値（浮動小数点）。
 ```Swift Sliderの書式
 Slider(value: $表示する値, 値の範囲)
 ```
 -----------------------------------------------------------------
 */
struct ContentView: View {
    @State var volume: Double = 0.0

    var body: some View {
        HStack {
            // スライダーの現在値を表示
            Text("\(format(volume))").frame(width: 100)
            HStack {
                Image(systemName: "speaker.slash").imageScale(.large)       // スピーカー
                Slider(value: $volume)                                      // スライダー
                Image(systemName: "speaker.3").imageScale(.large)           // スピーカー
            }
            .frame(width: 200)
        }
    }
}

/// 数値を受け取り、小数点以下2桁に丸めて文字列を返却する
/// - Parameter num: 数値
/// - Returns: 文字列に変換した数値
func format(_ num: Double) -> String {
    let result = String(round(num * 100) / 100)
    return result
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/**
 -----------------------------------------------------------------
 スライダーの値の範囲を設定する
 スライダーの値は浮動小数点で変化するので、数値を表示する際にはText(String(Int(R)))の
 ように、Intでキャストして整数化している。色の指定をする際に、値の範囲を0 ~ 255に設
 定してもよいが、デフォルトの範囲0 ~ 1の値に255を掛けることでも0 ~ 255の範囲の値を
 作ることができる。

 表示する値が変化した際にレイアウトが崩れないよう注意する
 スライダーの値とほかのもの横に並べて表示すると、値が変化することで数字の幅が変わ
 って表示位置も微妙に動いてしまう。これを避けるには、値を表示するテキストには余裕
 をもった幅を固定する。

 よく使う色はColorクラスに定義されているが、それ以外の色を使いたい場合は、RGBで指
 定する。`Color(red:green:blue)`のように色を作れる。透明度をつけたい場合は、
 `opacity:`をさらに追加する。
 -----------------------------------------------------------------
 */
struct ContentView2: View {
    // RGBAの値を保持する
    @State var R: Double = 0
    @State var G: Double = 0
    @State var B: Double = 0
    @State var A: Double = 1

    var body: some View {
        VStack(alignment: .center) {
            ZStack {
                // 下に隠れているイメージ ※opacityの値を下げると表示される
                Image(systemName: "ladybug")
                    .scaleEffect(3)
                // 色を付ける円
                Circle()
                    .frame(width: 100, height: 100)
                    .padding()
                    // 塗り色と透明度の現在値からカラーを作る
                    .foregroundColor(
                        Color(red: R/255, green: G/255, blue: B/255, opacity: A))
            }
            // redのスライダー
            HStack {
                Circle()
                    .foregroundColor(.red)
                    .frame(width: 20, height: 20)
                // 表示する値でレイアウトが崩れないよう余裕を持ったフレーム幅にする
                Text(String(Int(R))).frame(width: 40)
                // Rを0 ~ 255のスライダーで決める
                Slider(value: $R, in: 0...255).frame(width: 200)
            }
            // greenのスライダー
            HStack {
                Circle()
                    .foregroundColor(.green)
                    .frame(width: 20, height: 20)
                Text(String(Int(G))).frame(width: 40)
                Slider(value: $G, in: 0...255).frame(width: 200)
            }
            // blueのスライダー
            HStack {
                Circle()
                    .foregroundColor(.blue)
                    .frame(width: 20, height: 20)
                Text(String(Int(B))).frame(width: 40)
                Slider(value: $B, in: 0...255).frame(width: 200)
            }
            // opacityのスライダー
            HStack {
                Rectangle()
                    .stroke(lineWidth: 2)
                    .foregroundColor(.blue)
                    .frame(width: 18, height: 18)
                Text(String(round(A * 10) / 10)).frame(width: 40)
                Slider(value: $A).frame(width: 200)
            }
        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
