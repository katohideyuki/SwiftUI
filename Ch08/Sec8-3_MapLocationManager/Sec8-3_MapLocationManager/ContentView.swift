//
//  ContentView.swift
//  Sec8-3_MapLocationManager
//  
//  Created in 2022/11/06
//  
//

import SwiftUI
import MapKit
/**
 -----------------------------------------------------------------
 ■ ContentViewに現在地を表示する地図を表示
 ContentViewにも`MapKit`をインポートする。また、`LocationManager`クラスの
 インスタンス`manager`を作り、`@ObservedObject`を付けて観測する。トラッキン
 グモードはバインディングできる変数`@State trackingMode`を宣言し、追従する設定
 の`MapUserTrackingMode.follow`を代入。この2つの値は、トラッキングモードを
 指定できる書式の
 `Map(coordinateRegion: showsUserLocation: userTrackingMode:)`の引数
 に指定。
 -----------------------------------------------------------------
 */
struct ContentView: View {
    // managerの更新を観測
    @ObservedObject var manager = LocationManager()
    // ユーザートラッキングモード（追従モード）
    @State var trackingMode = MapUserTrackingMode.follow

    var body: some View {
        // 現在地を追従する地図を表示
        Map(coordinateRegion: $manager.region,
            showsUserLocation: true,
            userTrackingMode: $trackingMode)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
