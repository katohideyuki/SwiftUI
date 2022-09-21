//
//  ContentView.swift
//  Sec4-1_ContentList
//  
//  Created in 2022/09/21
//  
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        /**
         表示したいテキストを直接書いてリストを作る。
         */
        List {
            Text("Content 1")
            Text("Content 2")
            Photo1().frame(height: 150)
            Text("Content 4")
            Photo2().frame(height: 150)
            Text("Content 6")
        }

        /**
         リストにタイトルを付ける。
         - navigationTitle()を使用するには、NavigationView{}を宣言しておく必要がある。
         */
        // タイトルを表示するために宣言する
        NavigationView {
            List {
                Text("Content 1")
                Text("Content 2")
                Text("Content 3")
                Text("Content 4")
            }
            // タイトル
            .navigationTitle("タイトル")
        }
    }
}

/**
 写真1の構造体を定義しておく。
 - 画像を使用するため、Assetsに"bus"をセットしておく必要がある。
 */
struct Photo1: View {
    var body: some View {
        HStack {
            Image("bus")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("えぼし号")
                .padding(.horizontal)

        }
    }
}

/**
 写真2の構造体を定義しておく。
 - 画像を使用するため、Assetsに"lighthouse"をセットしておく必要がある。
 */
struct Photo2: View {
    var body: some View {
        HStack {
            Image("lighthouse")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("白灯台")
                .padding(.horizontal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
