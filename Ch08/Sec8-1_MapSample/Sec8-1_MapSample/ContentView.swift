//
//  ContentView.swift
//  Sec8-1_MapSample
//  
//  Created in 2022/11/04
//  
//

import SwiftUI
import MapKit       // MapKitフレームワークを利用
/**
 -----------------------------------------------------------------
 ■ Map()で地図を作る
 地図を表示するにはMapKitフレームワークを利用する。また、地図を表示するためのメソ
 ッド`Map(cordinateRegion:)`を定義し、引数には地図で表示する領域を渡す。
 -----------------------------------------------------------------
 */
struct ContentView: View {
    // 地図で表示する地点と範囲を定める（東京駅周辺）
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 35.6805702,       // 緯度
            longitude: 139.7676359      // 経度
        ),
        latitudinalMeters: 1000.0,      // 南北距離
        longitudinalMeters: 1000.0      // 東西距離
    )

    var body: some View {
        // 地図を表示
        Map(coordinateRegion: $region)
            .edgesIgnoringSafeArea(.bottom)     // 画面下部のセーフティエリアを無視して表示する
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
