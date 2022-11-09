//
//  LocationManager.swift
//  Sec8-3_MapLocationManager
//  
//  Created in 2022/11/08
//  
//

import SwiftUI
import MapKit
/**
 -----------------------------------------------------------------
 ■ LocationManagerクラス
 `NSObject`を継承し、現在地の観測のための`ObservableObject`プロトコル、領域
 の更新のための`CLLocationManagerDelegate`デリゲートを採用。regionプロパティ
 は観測対象なので`@Published`を付ける。

 `requestWhenInUseAuthorization()`を実行すると、infoパネルで設定したプラ
 イバシー設定が確認され、アプリが初めて起動された際に、設定ダイアログが表示される。

 `override init()`はNSObjectクラスにあるイニシャライザinit()を上書きして、
 継承している`スーパークラスにもある同名のメソッドを上書き`している。ただし、1行目
 でsuper.init()を実行しているので、NSObjectクラスのイニシャライザを先に実行し
 ている。

 移動で変化する位置情報を取得するには、位置が移動する度に最新の位置情報を取得する
 必要がある。そのために欠かせないのが`デリゲート`という手法。
 -----------------------------------------------------------------
 */
class LocationManager: NSObject, ObservableObject/* 現在地の観測 */, CLLocationManagerDelegate/* 位置追従のデリゲート */ {
    // ロケーションマネージャー
    let manager = CLLocationManager()
    // 領域の更新をパブリッシュ
    @Published var region = MKCoordinateRegion()

    override init() {
        super.init()                                        // スーパークラスのイニシャライザ
        manager.delegate = self                             // デリゲート設定
        manager.requestWhenInUseAuthorization()             // プライバシー設定の確認
        manager.desiredAccuracy = kCLLocationAccuracyBest   // 現在地の精度
        manager.distanceFilter  = 2                         // 現在地の更新距離(m)
        manager.startUpdatingLocation()                     // 現在地の更新スタート（追従開始）
    }

    // 領域の更新(デリゲートメソッド)
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // locationsの最後の要素に対して実行
        locations.last.map {
            let center = CLLocationCoordinate2D(
                latitude: $0.coordinate.latitude,
                longitude: $0.coordinate.longitude)
            // 表示する領域の更新
            region = MKCoordinateRegion(
                center: center,
                latitudinalMeters: 1000.0,
                longitudinalMeters: 1000.0
            )
        }
    }
}
