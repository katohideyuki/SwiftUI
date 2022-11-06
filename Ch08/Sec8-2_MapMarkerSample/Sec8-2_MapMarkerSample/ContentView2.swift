//
//  ContentView2.swift
//  Sec8-2_MapMarkerSample
//  
//  Created in 2022/11/06
//  
//

import SwiftUI
import MapKit

struct Spot2: Identifiable {
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

struct ContentView2: View {
    let spotlist2 = [
        Spot2(name: "丸善", latitude: 35.6834843, longitude: 139.7644207),
        Spot2(name: "八重洲ブックセンター", latitude: 35.6790079, longitude: 139.7675881),
        Spot2(name: "出光美術館", latitude: 35.6780057, longitude: 139.7631035),
    ]

    // 座標と領域を指定
    @State var region2 = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 35.6805702,       // 緯度
            longitude: 139.7676359      // 経度
        ),
        latitudinalMeters: 1000.0,      // 南北距離
        longitudinalMeters: 1000.0      // 東西距離
    )

    var body: some View {
        Map(coordinateRegion: $region2,
            annotationItems: spotlist2,
            annotationContent: { spot2 in
                MapAnnotation(coordinate: spot2.coordinate,
                              anchorPoint: CGPoint(x: 0.5, y: 0.5),
                              content: {
                                    Image(systemName: "house.fill").foregroundColor(.red)
                                    Text(spot2.name).italic()
                              }
                )
            }
        ).edgesIgnoringSafeArea(.bottom)
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
