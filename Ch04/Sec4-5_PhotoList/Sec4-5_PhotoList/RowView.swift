//
//  RowView.swift
//  Sec4-5_PhotoList
//  
//  Created in 2022/09/23
//  
//

import SwiftUI

// 写真データ
struct RowView: View {
    var photo:PhotoData

    var body: some View {
        HStack {
            Image(photo.imageName)
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray))
            Text(photo.title)
            Spacer()
        }
    }
}

// 最初の写真データを使って１行分のプレビューを作る
struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(photo:photoArray[0])
            .previewLayout(.sizeThatFits)
    }
}
