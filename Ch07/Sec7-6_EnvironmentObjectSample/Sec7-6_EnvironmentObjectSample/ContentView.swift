//
//  ContentView.swift
//  Sec7-6_EnvironmentObjectSample
//  
//  Created in 2022/11/02
//  
//

import SwiftUI

/**
 -----------------------------------------------------------------
 ■
 `@EnvironmentObject`属性を付けたsetDataと`@State`属性を付けたisShow変数
 を定義。bodyでは共有しているsetDataのisOnとnumの現在値を表示するテキストと、
 設定値を変更するシートを表示するボタンを作る。
 -----------------------------------------------------------------
 */
struct ContentView: View {
    // 共有オブジェクトを指定
    @EnvironmentObject var setData: ShareData
    // シートが開いている状態
    @State var isShow: Bool = false

    var body: some View {
        VStack {
            // 現在の設定
            GroupBox(label: Label("設定", systemImage: "gearshape")) {
                Text("\(setData.isOn ? "ON" : "OFF")")
                if setData.isOn {
                    // countの数だけ★を繰り返す
                    Text(String(repeating: "★", count: setData.num))
                }
            }.frame(width: 300)
            // シートを表示するボタン
            Button(action: {
                isShow = true
            }){
                Label("設定を変える", systemImage: "ellipsis.circle")
            }
            .padding()
            .sheet(isPresented: $isShow) {
                // シートを作る
                SettingView(isPresented: $isShow)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // プレビュー用
        ContentView()
            .environmentObject(ShareData())
    }
}
