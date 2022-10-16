//
//  PhotoData.swift
//  Sec6-4_photoScrollView
//  
//  Created in 2022/10/15
//  
//

import Foundation

/**
 -----------------------------------------------------------------
 ■ 写真データのPhotoDataを定義して配列photoArrayをつくる
 写真データのイメージ名と写真タイトルをPhotoDataは`Identifiableプロトコル`を
 採用した`構造体PhotoData`で定義し、写真データを作って`配列photoArray`にする
 コードを書き込む。
 -----------------------------------------------------------------
 */
// 構造体を定義
struct PhotoData: Identifiable {
    var id = UUID()
    var imageName: String       // ファイル名
    var title: String           // 画像のタイトル
}

// 構造体PhotoData型の写真データが入った配列
var photoArray = [
    PhotoData(imageName: "IMG_0463", title: "台風で流された旧鵠沼橋の親柱"),
    PhotoData(imageName: "IMG_0495", title: "横須賀ヴェルニー記念公園軍港閲見門"),
    PhotoData(imageName: "IMG_1478", title: "恋人たちの湘南平テレビ塔"),
    PhotoData(imageName: "IMG_1739", title: "赤い漁具倉庫1"),
    PhotoData(imageName: "IMG_1742", title: "赤い漁具倉庫2"),
    PhotoData(imageName: "IMG_2233", title: "江ノ電501系"),
    PhotoData(imageName: "IMG_2406", title: "茅ヶ崎漁港引き上げモーター小屋"),
    PhotoData(imageName: "IMG_2407", title: "茅ヶ崎漁港第2えぼし丸"),
    PhotoData(imageName: "IMG_2864", title: "相模川河口調整水門"),
    PhotoData(imageName: "IMG_2909", title: "つくばエキスポセンター H2ロケット")
]
