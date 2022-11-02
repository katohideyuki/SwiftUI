//
//  ContentView.swift
//  Sec7-5_StateObjectSample
//  
//  Created in 2022/10/31
//  
//

import SwiftUI

/**
 -----------------------------------------------------------------
 ■ @StateObjectオブジェクトを使うValueView2ビューを定義
 ValueMakerクラスのインスタンスを`@StateObjectオブジェクトmakerで保持`する。
 -----------------------------------------------------------------
 */
struct ValueView2: View {
    // ValueMakerのインスタンスを作り観測する
    @StateObject var maker = ValueMaker()

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
        .background(.blue.opacity(0.3))
        .frame(width: 200, height: 80)
    }
}
/**
 -----------------------------------------------------------------
 ■ 親ビューの再描画で子ビューがリセットする
 スイッチをオン/オフどちらのタイミングでも`ValueViewビューのカウンタはリセット`
 される。ValueView2ビューはスイッチに影響されずカウントアップを続ける。
 ValueViewビューがリセットされる理由は、ContentViewビューの「Hello,World!」
 のテキストが消えたり、表示されたりすつことによって`ContentViewビューが再描画`
 されるのが原因。
 以上を踏まえて、`親ビューが再描画しても @StateObjectオブジェクトはリセットし`
 `ないContentViewビューが再描画されると同時に @ObservableObjectオブジェク`
 `トもリセットされる`のに対して、`@StateObjectオブジェクトはそのままのインス`
 `タンスの値が保持される`。
 -----------------------------------------------------------------
 */
struct ContentView: View {
    @State var isShow = true

    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            // 子ビューの表示
            ValueView()
            ValueView2()
            // 親ビューにあるテキストの表示/非表示の切り替え
            Toggle(isOn: $isShow) {
            }.frame(width: 50).padding(.top, 30)
            if isShow {
                // トグルスイッチで表示/非表示することで、ContentViewビューが再描画される
                Text("Hello, World!").font(.largeTitle)
            }
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ValueView()
        ValueView2()
    }
}
