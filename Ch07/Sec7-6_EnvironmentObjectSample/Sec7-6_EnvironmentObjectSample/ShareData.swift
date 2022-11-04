//
//  ShareData.swift
//  Sec7-6_EnvironmentObjectSample
//  
//  Created in 2022/11/02
//  
//

import Foundation

/**
 -----------------------------------------------------------------
 ■ ShareDataクラスで共有する変数をパブリッシュする
 `ObservableObjectプロトコル`を採用したShareDataクラスを定義。プロパティとし
 て、isOnとnumのプロパティ変数に`@Published`を付けてパブリッシュにする。
 ContentViewビューとSettingViewビューから参照される。
 -----------------------------------------------------------------
 */
class ShareData: ObservableObject {
    @Published var isOn = false
    @Published var num = 1
}
