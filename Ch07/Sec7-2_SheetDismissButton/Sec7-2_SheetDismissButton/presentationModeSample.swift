//
//  presentationModeSample.swift
//  Sec7-2_SheetDismissButton
//  
//  Created in 2022/10/25
//  
//

import SwiftUI
/**
 -----------------------------------------------------------------
 ■ 環境変数presentationModeにアクセスしてビューを閉じる
 `@Environment`を使って環境変数`EnvironmentValues`の1つのpresentationMode
 にアクセスする変数presentationを定義しておき、
 presentation.wrappedValue.dismiss()を実行することでビューを閉じることがで
 きる。この方法ならsheetモディファイアやfullScreenCoverモディファイアでビュー
 を開く際に$isShowをバインディングする必要がない。
 -----------------------------------------------------------------
 */
struct ContentView3: View {
    @State var isShow: Bool = false

    var body: some View {
        Button(action: {
            isShow = true
        }) {
            Text("シート")
        }
        .sheet(isPresented: $isShow) {
            // SomeViewビューを表示 ※$isShowをバインディングしなくてよい
            SomeView3()
        }
    }
}

struct SomeView3: View {
    // 環境変数presentationModeにアクセス
    @Environment(\.presentationMode) var presentation

    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "ladybug").scaleEffect(2.0)
                Text("ハロー").font(.title2).padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.9, green: 0.9, blue: 0.8))
            .toolbar {
                // 現在のビューを閉じる
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        presentation.wrappedValue.dismiss()
                    } label: {
                        Text("閉じる")
                    }
                }
            }
        }
    }
}

struct presentationModeSample_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
        SomeView3()
    }
}
