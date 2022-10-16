//
//  ContentView.swift
//  Sec6-4_photoScrollView
//  
//  Created in 2022/10/15
//  
//

import SwiftUI

/**
 -----------------------------------------------------------------
 ■ 写真データを取り込んでスクロール表示する
 PhotoDataから写真データを取り込む。`ForEach(photoArray){...}`で
 photoArrayに入っている写真データ分だけPhotoViewが作られるので、それを
 `LazyVStack{}で縦に長く並べる`。この長いビューを`scrollView{}`で囲めば、
 スクロールが作れる。
 -----------------------------------------------------------------
 */
struct ContentView: View {
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .center, spacing: 20) {
                ForEach(photoArray) { photoData in
                    PhotoView(photo: photoData)
                }
            }
        }.padding(.horizontal)
    }
}

/**
 -----------------------------------------------------------------
 ■ 複数のビューをスクロールで表示する
 コンテンツを`ScrollView{}`で囲むだけでスクロールビューを作ることができる。
 -----------------------------------------------------------------
 */
struct printColor1: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                // Pageビューを10個生成
                ForEach(0 ..< 10) { num in
                    // Pageビューに表示する番号を渡す
                    Page(str: String(num))
                        .frame(width: 200, height: 150)
                        .cornerRadius(8)
                }
            }
        }
        .frame(width: 250, height: 500)
        .background(.gray.opacity(0.2))
    }
}
/**
  -----------------------------------------------------------------
 ■ 横スクロール
 `ScrollView(.horizontal){...}`のように指定することで、横スクロールすること
 ができる。表示するPageビューの横幅は、
 `画面の横幅 UIScreen.main.bounds.widthより20だけ狭く`している。
  -----------------------------------------------------------------
 */
struct printColor2: View {
    // 画面の横幅より-20狭くしたwidth
    let w: CGFloat = UIScreen.main.bounds.width-20

    var body: some View {
        VStack(alignment: .leading) {
            Text("横スクロール").padding([.leading])
            ScrollView(.horizontal) {
                LazyHStack(alignment: .center, spacing: 10) {
                    ForEach(0 ..< 10) { num in
                        Page(str: String(num))
                            .frame(width: w, height: 150)
                            .cornerRadius(8)
                    }
                }
            }
            .frame(width: 200)
            .background(.gray.opacity(0.2))
        }
    }
}

// 1個分のpageビューをつくる
struct Page: View {
    let colors: [Color] = [.green, .blue, .pink, .orange, .purple]
    let str: String

    var body: some View {
        ZStack {
            colors.randomElement()      // ランダムに要素を取得
            Text(str)                   // 渡された文字列を表示
                .font(.largeTitle)
                .foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        printColor1()
        printColor2()
    }
}
