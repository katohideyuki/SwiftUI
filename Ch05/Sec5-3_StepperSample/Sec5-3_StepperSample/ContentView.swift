//
//  ContentView.swift
//  Sec5-3_StepperSample
//  
//  Created in 2022/09/28
//  
//

import SwiftUI
let UNIT_PRICE = 240        // カウンター
let TAX        = 0.1        // 消費税

/**
 -----------------------------------------------------------------
 ステッパーを作る
 Stepperを使って+ボタンと-ボタンで値を1つずつカウントアップ/カウントダウンできる
 ステッパーを作る。
 `Stepper(value: $値を保持するための変数, in:値の範囲, step:ステップ間隔`
 のように値を指定する。引数stepを省略すると間隔は1となる。値の範囲は`-マイナス`
 でも可能で、値の範囲を省略すると制限がなくなる。
 -----------------------------------------------------------------
 */
struct ContentView: View {
    @State var count: Int = 0       // カウンター

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("1個 : \(UNIT_PRICE)円")

            // ステッパー ※0 ~ 10のステッパーを作り、ステップ間隔を2にする
            Stepper(value: $count, in: 0...10, step: 2) {
                // 現在値を表示
                Text("個数 : \(count)")
            }.frame(width: 200)

            // 料金計算と結果の表示
            let price = UNIT_PRICE * count
            // 消費税を掛けた後でInt型にキャスト
            let result = Int(Double(price) * (1 + TAX))
            Text("料金 : \(result)円").font(.headline)
                + Text("(税込み)").font(.footnote)
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
 料金を計算するcalc()関数を定義する
 料金計算を行う処理を関数calc()として定義することでbodyのステートメントが簡単になり
 関数定義することで変更可能な変数を計算式で使えるようになる。
 -----------------------------------------------------------------
 */
struct ContentView2: View {
    @State var count: Int = 0       // カウンター

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("1個 \(UNIT_PRICE)")

            Stepper(value: $count, in: 0...10, step: 2) {
                Text("個数: \(count)")
            }.frame(width: 200)

            // calc関数を呼び出し、料金を計算する
            Text("料金 \(calc(count))円").font(.headline)
                + Text("(税込)").font(.footnote)
        }
    }

    /// 料金の計算をする
    /// - Parameter num: 個数
    /// - Returns: 単価 * 個数 * 消費税
    func calc(_ num: Int) -> Int {
        var price = UNIT_PRICE * num                 // 引数numが個数として料金を計算する
        price = Int(Double(price) * (1+TAX))        // 消費税を計算する
        return price
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}

/**
 -----------------------------------------------------------------
 Computedプロパティで計算して料金を表示する
 料金計算を関数定義するのではなく、`Computedプロパティの変数price`を定義する。
 変数priceの値がそのまま料金計算の結果になるので、料金はText("料金 : \(price)円")のよう
 にpriceの値を表示する。ステッパーの値countが変更されるとpriceを再計算した値が表示
 される。
 -----------------------------------------------------------------
 */
struct ContentView3: View {
    @State var count: Int = 0       // カウンター

    // 料金 ※変数priceの値は料金計算の結果になる
    var price: Int {
        var value = UNIT_PRICE * count
        value = Int(Double(value) * (1 + TAX))
        return value
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("1個 \(UNIT_PRICE)")

            Stepper(value: $count, in: 0...10, step: 2){
                Text("個数 : \(count)")
            }.frame(width: 200)

            Text("料金 : \(price)円").font(.headline)
                + Text("(税込)").font(.footnote)
        }
    }
}

struct ContentView3_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
    }
}
