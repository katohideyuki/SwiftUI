//
//  ContentView.swift
//  Sec9-1_AsyncImageSample
//  
//  Created in 2022/11/09
//  
//

import SwiftUI
/**
 -----------------------------------------------------------------
 ■ 画像データの型とURLの配列をつくるPhotoSourceクラス
 ダウンロードする画像データのPhoto型を定義。Photo型はList表示するため、
 Identifiableプロトコルに準拠したstructで定義する。また、画像データの配列
 photosをプロパティとしてもつPhotoSourceクラスを定義。
 -----------------------------------------------------------------
 */
// 画像データ
struct Photo: Identifiable {
    var id: URL{ url }
    var url: URL
}

// 画像データの配列をつくるクラス
class PhotoSource {
    var photos: [Photo] = []
    init() {
        photos = makePhotos()
    }
}

/**
 -----------------------------------------------------------------
 ■ 画像データの配列をつくる関数
 PhotoSourceクラスを継承して拡張する。画像ファイルのURLをつくって配列に入れて戻
 す。関数はPhotoSourceクラスのイニシャライザで実行され、つくられたURLの配列は
 photosプロパティに代入される。
 -----------------------------------------------------------------
 */
extension PhotoSource {
    func makePhotos() -> [Photo] {
        let path = "https://oshige.xsrv.jp/samples/photos/"
        let photoNames: [String] = [
            "IMG_1159.jpg", "IMG_1326.jpg", "IMG_1384.jpg", "IMG_1475.jpg",
            "IMG_1476.jpg", "IMG_1478.jpg", "IMG_1635.jpg", "IMG_1643.jpg",
            "IMG_1739.jpg", "IMG_1840.jpg", "IMG_1889.jpg", "IMG_2233.jpg",
            "IMG_2325.jpg", "IMG_2406.jpg", "IMG_2408.jpg", "IMG_4008.jpg",
        ]
        // URLの配列
        var photos: [Photo] = []
        for name in photoNames {
            photos.append(Photo(url: URL(string: path + name)!))
        }
        return photos
    }
}

/**
 -----------------------------------------------------------------
 ■ 画像データをダウンロードしてリスト表示する
 PhotoSourceクラスのインスタンスmyPhotoSourceをつくる。List機能を使って
 myPhotoSourceのプロパティphotosから画像データのオブジェクトを順に取り出し、
 AsyncImage(url: photo.url)でURLの画像データを`非同期処理でダウンロード`す
 る。ListやScrollViewに組み込まれている場合は、ビューが画面の範囲内に
 `スクロールされてからダウンロードが実施`されるので、表示していない範囲のダウンロ
 ードが先に進むことはない。
 -----------------------------------------------------------------
 */
struct ContentView: View {
    private var myPhotoSource = PhotoSource()

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
                    ForEach(myPhotoSource.photos) { photo in
                        AsyncImage(url: photo.url) { image in
                            NavigationLink(destination: image.resizable()
                                .aspectRatio(contentMode: .fit))
                            {
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                        } placeholder: {
                            Color.orange
                                .overlay(Image(systemName: "photo").scaleEffect(2.0))
                        }
                        .mask(RoundedRectangle(cornerRadius: 16))
                        .frame(height: 200)
                    }
                }
            }
            .padding(.horizontal)
            .navigationTitle("お気に入り")
            // ▼ 改修前
//            List(myPhotoSource.photos) { photo in
//                // イメージの読み込みと表示
//                AsyncImage(url: photo.url) { image in
//                    image.resizable()
//                        .aspectRatio(contentMode: .fit)
//                } placeholder: {
//                    Color.orange
//                        .overlay(Image(systemName: "photo").scaleEffect(2.0))
//                }
//                .mask(RoundedRectangle(cornerRadius: 16))
//                .frame(height: 160)
//            }
//            .navigationTitle("お気に入り")
            // ▲ 改修前
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentPreviews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
