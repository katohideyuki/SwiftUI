//
//  PhotoData.swift
//  Sec4-4_PhotoList
//  
//  Created in 2022/09/23
//  
//

import Foundation

/**
 配列PhotoArrayを作るコードを定義する。
 - 写真データをPhotoData構造体に定義し、15枚分の写真データを配列に追加する。
 */
// 1枚分の写真データの構造を示す構造体 ※Identifiableプロトコルを指定
struct PhotoData: Identifiable {
    var id = UUID()                 // Identifiableプロトコルでは必ずidが必要
    var imageName: String           // イメージ名
    var title: String               // 表示するタイトル
}

// 構造体PhotoData型の写真データが入った配列を作る
var photoArray = [
    // 構造体PhotoDataで写真データを作る
    PhotoData(imageName: "IMG_0996", title: "湘南平展望レストランFlat"),
    PhotoData(imageName: "IMG_1035", title: "アウトリガーカヌー"),
    PhotoData(imageName: "IMG_1504", title: "えぼし号"),
    PhotoData(imageName: "IMG_1531", title: "富士山"),
    PhotoData(imageName: "IMG_2139", title: "DENTAL CLINIC"),
    PhotoData(imageName: "IMG_2250", title: "鵠沼魚港白灯台"),
    PhotoData(imageName: "IMG_2269", title: "サザンビーチ海の家"),
    PhotoData(imageName: "IMG_2470", title: "天使の翼"),
    PhotoData(imageName: "IMG_2883", title: "スイミングスクールバス"),
    PhotoData(imageName: "IMG_4199", title: "小田急線江ノ島駅"),
    PhotoData(imageName: "IMG_6460", title: "鷹取山"),
    PhotoData(imageName: "IMG_7122", title: "支笏湖スワンボート"),
    PhotoData(imageName: "IMG_7216", title: "とまチョップ"),
    PhotoData(imageName: "IMG_7745", title: "スナック Junko"),
    PhotoData(imageName: "IMG_7851", title: "山の電話ボックス")
]
