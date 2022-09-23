//
//  RowView.swift
//  Sec4-4_PhotoList
//  
//  Created in 2022/09/23
//  
//

import SwiftUI

/**
 写真のサムネイルとタイトルを表示する1行分のビューを定義する。
 */
struct RowView: View {
    // RowViewビューを作る際に写真データが設定される
    var photo: PhotoData

    var body: some View {
        HStack {
            // 写真を表示
            Image(photo.imageName)
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray))
            // タイトルを表示
            Text(photo.title)
            Spacer()
        }
    }
}

/**
 最初の写真データを使って1行分のプレビューを作る。
 */
struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        // 配列photoArrayの1個目の写真データをRowView構造体のphotoに指定してプレビューする
        RowView(photo: photoArray[0])
            // コンテンツにフィットしたサイズになる
            .previewLayout(.sizeThatFits)
    }
}
