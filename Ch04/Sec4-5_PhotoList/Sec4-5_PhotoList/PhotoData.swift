//
//  PhotoData.swift
//  Sec4-5_PhotoList
//  
//  Created in 2022/09/23
//  
//

import Foundation

// 写真データを構造体で定義する
struct PhotoData: Identifiable{
    var id = UUID()
    var imageName:String
    var title:String
}
// 構造体PhotoData 型の写真データが入った配列を作る
var photoArray = [
    PhotoData(imageName:"IMG_0996", title: "湘南平展望レストランFlat"),
    PhotoData(imageName:"IMG_1035", title: "アウトリガーカヌー"),
    PhotoData(imageName:"IMG_1504", title: "えぼし号"),
    PhotoData(imageName:"IMG_1531", title: "富士山"),
    PhotoData(imageName:"IMG_2139", title: "DENTAL CLINIC"),
    PhotoData(imageName:"IMG_2250", title: "鵠沼漁港白灯台"),
    PhotoData(imageName:"IMG_2269", title: "サザンビーチ海の家"),
    PhotoData(imageName:"IMG_2470", title: "天使の翼"),
    PhotoData(imageName:"IMG_2883", title: "スイミングスクールバス"),
    PhotoData(imageName:"IMG_4199", title: "小田急線江ノ島駅"),
    PhotoData(imageName:"IMG_6460", title: "鷹取山"),
    PhotoData(imageName:"IMG_7122", title: "支笏湖ぼスワンボート"),
    PhotoData(imageName:"IMG_7216", title: "とまチョップ"),
    PhotoData(imageName:"IMG_7745", title: "スナックJunko"),
    PhotoData(imageName:"IMG_7851", title: "山の電話ボックス")
]
