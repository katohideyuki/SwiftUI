//
//  LazyVGridFixed2.swift
//  Sec6-5_LazyXXGridFiexed
//  
//  Created in 2022/10/16
//  
//

import SwiftUI

struct LazyVGridFixed2: View {
    // LazyVGridでレイアウトする場合は、各列の幅、列間隔、位置揃えのグリッド指定
    let grids = [GridItem(.fixed(30), spacing: 10, alignment: .center),
                 GridItem(.fixed(50), spacing: 10),
                 GridItem(.fixed(240))]

    var body: some View {
        LazyVGrid(columns: grids, alignment: .leading, spacing: 20) {
            ForEach(photoArray) { item in
                Image(systemName: "doc")            // 1列目のアイコン
                Text(item.imageName).font(.caption) // 2列目のイメージ名
                Text(item.title)                    // 3列目の写真タイトル
            }
        }
    }
}

struct LazyVGridFixed2_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGridFixed2()
    }
}
