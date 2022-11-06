//
//  ContentView.swift
//  Sec8-2_MapMarkerSample
//  
//  Created in 2022/11/06
//  
//

import SwiftUI
import MapKit
/**
 -----------------------------------------------------------------
 ■ マーカーを配置する位置情報をSpotとして定義
 位置情報を`Identifiableプロトコル`を採用した構造体を定義。Identifiableプロ
 トコルはidプロパティが必須で、初期値として`UUID`を指定しておく。マーカー表示のた
 めに必要となるプロパティで、
 座標は`CLLocationCoordinate2D(latitude: longitude:)`で作成。

 -----------------------------------------------------------------
 */
// スポットの構造体
struct Spot: Identifiable {
    let id = UUID()
    let latitude: Double
    let longitude: Double
    // 座標を指定するComputedプロパティ
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

/**
 -----------------------------------------------------------------
 ■ 位置情報の作成と地図の表示
 Map(coordinateRegion: annotationItems: annotationContent)を使った場
 合、引数`annotationItems`に指定したspotlistから順に位置情報が取り出され、引
 数`annotationContent`で指定したspotに代入される。そして、`MapMarker`が実行
 されてマーカーが作られる。引数`coordinate`がマーカーの`表示座標`で、
 spot.coordinateでspotから取り出す。`tint`はマーカーの`色`を決める。
 -----------------------------------------------------------------
 */
struct ContentView: View {
    // 3箇所の位置情報
    let spotlist = [
        Spot(latitude: 35.6834843, longitude: 139.7644207),
        Spot(latitude: 35.6790079, longitude: 139.7675881),
        Spot(latitude: 35.6780057, longitude: 139.7631035),
    ]

    // 座標と領域を指定
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
        Map(coordinateRegion: $region,      // 地図の範囲
            annotationItems: spotlist,      // マーカー座標の配列
            annotationContent: { spot in MapMarker(coordinate: spot.coordinate, tint: .orange) })
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ContentView_previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
