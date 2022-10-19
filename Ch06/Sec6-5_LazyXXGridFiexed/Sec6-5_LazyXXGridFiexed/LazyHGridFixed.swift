//
//  LazyHGridFixed.swift
//  Sec6-5_LazyXXGridFiexed
//  
//  Created in 2022/10/19
//  
//

import SwiftUI
/**
 -----------------------------------------------------------------
 ■ 垂直方向のグリッド
 LazyVGridはコンテンツの列を指定するグリッドなのに対して、
 `LazyHGridは行数と高さを指定するグリッド`。
 -----------------------------------------------------------------
 */
struct LazyHGridFixed: View {
    // LazyHStackでレイアウトする場合は、各行の高さ、行間隔、位置揃えのグリッド指定
    let grids = [
        GridItem(.fixed(150), spacing: 20, alignment: .leading),
        GridItem(.fixed(20), spacing: 5, alignment: .leading),
        GridItem(.fixed(20), alignment: .leading)
    ]

    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: grids, spacing: 20) {
                ForEach(photoArray) { item in
                    // 1行目
                    Image(item.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(8)
                    // 2行目
                    Text(item.imageName).bold()
                    // 3行目
                    Text(item.title).font(.caption)
                }
            }.padding()
        }
    }
}

struct LazyHGridFixed_Previews: PreviewProvider {
    static var previews: some View {
        LazyHGridFixed()
    }
}
