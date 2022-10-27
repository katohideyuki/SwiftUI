//
//  ObservedObjectValueMaker.swift
//  Sec7-3_ObservedObjectSample
//  
//  Created in 2022/10/27
//  
//

import SwiftUI
/**
 -----------------------------------------------------------------
 ■ 刻々と変わるオブジェクトの値を表示
 `@ObservedObject`を付けた変数`maker`にValueMaker()でインスタンスを作り、
 代入する。これで`maker.value`で値を見張ることができる。
 -----------------------------------------------------------------
 */
struct ObservedObjectValueMaker: View {
    // ValueMakerインスタンスを生成し、観測する
    @ObservedObject var maker = ValueMaker()

    var body: some View {
        VStack (alignment: .leading, spacing: 10) {
            Text("\(maker.value)")
                .font(.largeTitle)
                .foregroundColor((maker.value > 0.8) ? .white : .gray)
                .background((maker.value > 0.8) ? .red : .white)

            // 棒グラフ
            ZStack {
                Rectangle().stroke(.gray)
                Rectangle()
                    .foregroundColor(.green)
                    .scaleEffect(x: maker.value, y: 1.0, anchor: .leading)
            }
        }
        .frame(width: 200, height: 80)
        .onAppear(perform: {
            // スタート ※ビューが表示される際に実行され、タイマーがスタートする
            maker.start()
        })
    }
}
/**
 -----------------------------------------------------------------
 ■ 0.5秒間隔で値が変化するValueMakerクラス
 Timerクラスを利用して刻々と乱数を発生するオブジェクトを生成。`value`には
 `@Published`を付けて宣言してあるので、`値の更新の状況がパブリッシュされる`。

 ```Swift scheduledTimeメソッドの書式
 Timer.scheduledTimer(withTimeInterval: 秒間隔, repeats: 繰り返すか否か) {
    処理内容
 }
 ```
 -----------------------------------------------------------------
 */
class ValueMaker: ObservableObject {
    // 値の更新をパブリッシュする変数
    @Published var value: Double = 0.0
    // タイマーを生成
    private var timer = Timer()
    // タイマーをスタート
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
            // valueに乱数をセット
            self.value = Double.random(in: 0 ... 1)
        }
    }
}

struct ObservedObjectValueMaker_Previews: PreviewProvider {
    static var previews: some View {
        ObservedObjectValueMaker()
    }
}
