//
//  ValueMaker.swift
//  Sec7-5_StateObjectSample
//  
//  Created in 2022/11/01
//  
//

import SwiftUI
/**
 -----------------------------------------------------------------
 ■ プロパティをパブリッシュするValueMakerクラス
 ObservableObjectプロトコルに準拠したValueMakerクラスを作る。Timerクラスを
 利用して定期的に乱数を発生してプロパティvalueに納め、valueが0.8より大きかった
 場合にプロパティcounterをカウントアップする。valueとcounterは値の更新を観察
 できるように@Publishedを付けてパブリッシュする。
 -----------------------------------------------------------------
 */
class ValueMaker: ObservableObject {
    // 値の更新をパブリッシュする変数にする
    @Published var value: Double
    @Published var counter: Int = 0
    private var timer: Timer

    // イニシャライザ
    init() {
        value = 0.0
        timer = Timer()     // タイマーをつくる
        start()             // スタート
    }

    // タイマースタート
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
            // valueに乱数をセット
            self.value = Double.random(in: 0 ... 1)
            // valueが0.8より大きかった場合にカウントする
            if self.value > 0.8 {
                self.counter += 1
            }
        }
    }
}

/** ObservedObjectオブジェクトを使うビュー */
struct ValueView: View {
    // ValueMakerのインスタンスを作り観測する
    @ObservedObject var maker = ValueMaker()

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("\(maker.value)")
                .font(.title)
                .foregroundColor((maker.value > 0.8) ? .white : .gray)
                .background((maker.value > 0.8) ? .red : .white)
            // カウンタを表示
            HStack {
                Text("カウンタ : ")
                Text("\(maker.counter)").font(.largeTitle)
            }
        }
        .background(.yellow.opacity(0.3))
        .frame(width: 200, height: 80)
    }
}
