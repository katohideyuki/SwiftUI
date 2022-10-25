//
//  fullScreenCoverSample.swift
//  Sec7-2_SheetDismissButton
//  
//  Created in 2022/10/24
//  
//

import SwiftUI
/**
 -----------------------------------------------------------------
 ■ fullScreenCoverモディファイアのビューを閉じるボタンを作る
 sheetモディファイアの代わりに`fullScreenCoverモディファイア`を使うと、もとの
 ビューを完全に覆い隠すビューが表示される。つまり、このビューはsheetモディファイア
 で表示するビューと違って下向きにスワイプしても閉じることができない。
 -----------------------------------------------------------------
 */
struct ContentView2: View {
    @State var isShow: Bool = false

    var body: some View {
        Button(action: {
            isShow = true
        }) {
            Text("ビューを表示")
        }
        .fullScreenCover(isPresented: $isShow) {
            // SomeViewビューを表示 ※$isShowをバインディング
            SomeView2(isPresented: $isShow)
        }
    }
}

struct SomeView2: View {
    // ContentView2ビューの変数isShowとバインディングする
    @Binding var isPresented: Bool

    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "ladybug").scaleEffect(2.0)
                Text("ハロー").font(.title2).padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.9, green: 0.9, blue: 0.8))
            .toolbar {
                // ビューを閉じるボタン
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isPresented = false
                    } label: {
                        Text("閉じる")
                    }
                }
            }
        }
    }
}

struct fullScreenCoverSample_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
        SomeView2(isPresented: Binding.constant(false))
    }
}
