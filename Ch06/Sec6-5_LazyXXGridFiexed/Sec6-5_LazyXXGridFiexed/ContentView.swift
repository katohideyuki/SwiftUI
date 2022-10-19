//
//  ContentView.swift
//  Sec6-5_LazyXXGridFiexed
//  
//  Created in 2022/10/16
//  
//

import SwiftUI

/**
 -----------------------------------------------------------------
 ■ グリッドレイアウト
 LazyVStackとLazyHStackはコンテンツを垂直はまた水平のどちらかの方向にレイアウ
 トするが、`LazyVGridとLazyHGridはマス目に並べるように行や列を折り返してコン`
 `テンツをグリッド上に配置する`

 ■ グリッドのサイズ指定の3つのモード
 `LazyVGrid(columns: grids)`のグリッドレイアウトでコンテンツを何列で並べる
 か、列幅はどうするかという設定は引数columnsで指定する`配列grids`で決まる。
 gridsの要素はGridItem型。`列幅`は第1引数のsizeで指定する。sizeの値は
 `fixed, flexible, adaptive`の3種類
 ```Swift GridItem型の書式
 GridItem(_ size: GridItem.Size = .flexible(),
    spacing: CGFloat? = nil, alignment: Aligment? = nil)
 ```

 `fixedは列幅と列数が固定`になるので、画面が回転してもレイアウトは変化しない。
 -----------------------------------------------------------------
 */
struct ContentView: View {
    // グリッドの形式を決める配列
    // GridItem(.fixed(80))が4個入った配列
    let grids = Array(repeating: GridItem(.fixed(80)), count: 4)

    var body: some View {
        ScrollView() {
            LazyVGrid(columns: grids) {
                // Pageビューを100個作り並べる
                ForEach((1 ... 100), id: \.self) { num in
                    Page(str: String(num))
                        .cornerRadius(8)
                        .frame(height: 60)
                }
            }
        }
    }
}

// Pageビュー
struct Page: View {
    let colors: [Color] = [.green, .blue, .orange, .purple]
    let str: String

    var body: some View {
        // ランダムに選んだColorビュー上に番号を表示したビューを作る
        ZStack {
            colors.randomElement()
            Text(str)
                .font(.title)
                .foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
