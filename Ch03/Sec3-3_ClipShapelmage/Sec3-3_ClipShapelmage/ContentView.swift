//
//  ContentView.swift
//  Sec3-3_ClipShapelmage
//  
//  Created in 2022/09/20
//  
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        /**
         イメージを図形で切り抜く。
         - clipShape(Circle())で円の形で写真が切り取られて表示される。
         */
        Image("bodyboarder")
            // 伸縮可能にする
            .resizable()
            // 領域を埋めるように表示する
            .aspectRatio(contentMode: .fill)
            .frame(width: 300, height: 300)
            // 画像を円でクリッピングする
            .clipShape(Circle())

        /**
         ビューに影を付ける。
         */
        Image("bodyboarder")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 300, height: 300)
            // 角丸四角形でクリッピングする
            .clipShape(RoundedRectangle(cornerRadius: 20))
            // 影を付ける
            .shadow(radius: 20)

        /**
         ビューを回転する。
         */
        Image("bodyboarder")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 300, height: 400)
            // 先にクリッピングしてから回転させる
            .clipped()
            .rotationEffect(.degrees(10), anchor: .center)

        /**
         ビューを角を丸める。
         */
        VStack {
            Text("Helo, world!")
                .font(.body)
                .frame(width: 150, height: 150)
                // 枠線を表示する
                .border(.pink, width: 10)
                // 角を丸める
                .cornerRadius(10)
        }

        /**
         テキストの背景の角を丸める。
         */
        VStack {
            Text("Helo, world!")
                .font(.largeTitle)
                .padding(15)
                .foregroundColor(.white)
                // 自作したShapeViewビューを背景にする
                .background(ShapeView())
                // 背景の角を丸める
                .cornerRadius(50)
                .frame(width: 150, height: 150)
        }

        /**
         ビューを3D回転する
         - rotation3DEffect()を使うとビューを3D回転できる。
            - X軸回転で縦、Y軸回転で横、Z軸はXY平面に対して垂直な軸で回転する。
         */
        VStack {
            Text("春はあけぼの。やうやう白くなり行く、山ぎは少しあかりて、紫だちたる雲の細くたなびきたる。")
                .fontWeight(.light)
                .font(.title)
                .frame(width: 250)
                // テキストがY軸周りで横回転する
                .rotation3DEffect(.degrees(45), axis: (x:0, y:1, z:0))
        }

        /**
         スタック全体を3D回転する。
         */
        ZStack {
            Image("bodyboarder")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .offset(x: 150, y: 0)
                .frame(width: 250)
        }
    }
}

/**
 背景にするShapeViewビューを作成する。
 */
struct ShapeView: View {
    var body: some View {
        ZStack {
            // 回転させた2個の長方形を重ねる
            Rectangle().rotationEffect(.degrees(45))
            Rectangle().rotationEffect(.degrees(-45))
        }
        .foregroundColor(.green)
        .frame(width: 50, height: 150)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/**

 */
