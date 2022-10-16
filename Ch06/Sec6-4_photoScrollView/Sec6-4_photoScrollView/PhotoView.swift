//
//  PhotoView.swift
//  Sec6-4_photoScrollView
//  
//  Created in 2022/10/15
//  
//

import SwiftUI

/**
 -----------------------------------------------------------------
 ■ 写真データ1個分の表示するPhotoViewビューを作成
 -----------------------------------------------------------------
 */
struct PhotoView: View {
    var photo: PhotoData

    var body: some View {
        VStack {
            Image(photo.imageName)      // 画像
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(photo.title)
                .bold()
                .padding(.top, 10)
                .padding(.bottom, 20)
        }
        .background(Color(red: 0.3, green: 0.8, blue: 0.5))
        .cornerRadius(8)
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        // 最初の写真データでプレビューする
        PhotoView(photo: photoArray[0])
    }
}
