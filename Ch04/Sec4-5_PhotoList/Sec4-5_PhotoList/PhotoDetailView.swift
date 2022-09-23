//
//  PhotoDetailView.swift
//  Sec4-5_PhotoList
//  
//  Created in 2022/09/23
//  
//

import SwiftUI

struct PhotoDetailView: View {
    var photo: PhotoData

    var body: some View {
        VStack {
            Image(photo.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(photo.title)
            Spacer()
        }
        .padding()
    }
}

struct PhotoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // 変数photoの初期値を設定する
        PhotoDetailView(photo: photoArray[0])
    }
}
