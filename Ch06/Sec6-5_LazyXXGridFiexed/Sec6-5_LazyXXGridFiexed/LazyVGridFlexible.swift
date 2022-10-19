//
//  LazyVGridFlexible.swift
//  Sec6-5_LazyXXGridFiexed
//  
//  Created in 2022/10/16
//  
//

import SwiftUI
/**
 -----------------------------------------------------------------
 ■ グリッドのサイズを最小値と最大値で指定する flexible
 二番目のグリッドのsizeが`flexible()`なので、初期値の
 `flexible(minimum: 10, maximum: .infinity)`が指定されていることになる。
 maximumを`infinity`にしておけば`画面サイズに合わせて表示`できることになる。
 -----------------------------------------------------------------
 */
struct LazyVGridFlexible: View {
    // 1番目はfixedで固定幅70に指定
    // 2番目はflexible()で初期値を使用しているので、最小幅10、最大幅は画面幅に合わせる
    let grids = [GridItem(.fixed(70), spacing: 10),
                 GridItem(.flexible(), spacing: 10, alignment: .leading)]

    var body: some View {
        LazyVGrid(columns: grids, alignment: .leading, spacing: 20) {
            ForEach(photoArray) { item in
                Text(item.imageName).font(.caption)
                Text(item.title)
            }
        }.padding()
    }
}

struct LazyVGridFlexible_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGridFlexible()
    }
}
