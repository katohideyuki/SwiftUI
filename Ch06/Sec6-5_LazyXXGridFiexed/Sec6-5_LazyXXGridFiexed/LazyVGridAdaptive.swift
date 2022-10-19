//
//  LazyVGridAdaptive.swift
//  Sec6-5_LazyXXGridFiexed
//  
//  Created in 2022/10/16
//  
//

import SwiftUI
/**
 -----------------------------------------------------------------
 ■ 画面サイズに合わせて配置する adaptive
 `adaptive(minumum: CGFloat, maximum: CGFloat = .infinity)`は画面に
 合わせるように`グリッド間隔が自動的`に決まる。具体的には、adaptiveのminumum値
 とGridItemのspacing値を合わせた幅で画面にもっともたくさん並ぶように計算して余
 りを均等に調整する。adaptiveを使用することで、画面サイズが違うデバイスや縦横回転
 に対応できる。なお、adaptiveは`列数が自動的にきまるのでGridItemの指定は1個`。
 複数個指定すると不規則な間隔になる。
 -----------------------------------------------------------------
 */
struct LazyVGridAdaptive: View {
    // 列数は自動的に決まるので、1列分だけ指定する
    let grids = [GridItem(.adaptive(minimum: 80, maximum: .infinity))]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: grids, alignment: .leading, spacing: 10) {
                ForEach(1...100, id: \.self) { num in
                    Ball(str: String(num))
                        .frame(width: 50, height: 50)
                }
                .padding()
            }
        }
    }
}

struct Ball: View {
    let str: String

    var body: some View {
        ZStack {
            // 赤い丸に数字を重ねたビュー
            Circle().fill(Color.red)
            Text(str)
                .font(.title)
                .foregroundColor(.white)
        }
    }
}

struct LazyVGridAdaptive_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LazyVGridAdaptive()
            // プレビューを横画面で表示する
            LazyVGridAdaptive()
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
