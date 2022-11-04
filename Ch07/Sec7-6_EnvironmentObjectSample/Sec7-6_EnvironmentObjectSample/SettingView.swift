//
//  SettingView.swift
//  Sec7-6_EnvironmentObjectSample
//  
//  Created in 2022/11/02
//  
//

import SwiftUI

/**
 -----------------------------------------------------------------
 ■ SettingView構造体を定義
 スイッチとステッパーを表示する。「閉じる」ボタンはNavigationViewを利用してツー
 ルバーに追加する。
 -----------------------------------------------------------------
 */
struct SettingView: View {
    // 共有オブジェクトを指定
    @EnvironmentObject var setData: ShareData
    // シートが開いている状態 ※シートを閉じるために利用
    @Binding var isPresented: Bool

    var body: some View {
        NavigationView {
            VStack {
                // スイッチ
                Toggle(isOn: $setData.isOn) {
                    Text("設定 : \(setData.isOn ? "ON" : "OFF")")
                }.frame(width: 250)
                // ステッパー（★の個数）
                Stepper(value: $setData.num, in: 1...5) {
                    Text("★ :\(setData.num)")
                }
                .frame(width: 250)
            }
            .font(.title2)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.9, green: 0.9, blue: 0.5))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    // 閉じるボタン
                    Button("閉じる") {
                        isPresented = false
                    }
                }
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(isPresented: Binding.constant(false))
            .environmentObject(ShareData())  // プレビュー
    }
}
