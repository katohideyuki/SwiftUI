//
//  ContentView.swift
//  Sec3-2_drawCircle
//  
//  Created in 2022/09/20
//  
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        /**
         -----------------------------------------------------------------
         図形を表示する。
         - ViewsライブラリからもCircleをドロップできる。
         -----------------------------------------------------------------
         */
        VStack {
            // 円
            Circle()
            // 円が青色になる
                .foregroundColor(.red)
            // 円の縦横サイズを設定
                .frame(width: 50, height: 50)

            // 楕円形
            Ellipse()
                .foregroundColor(.blue)
                .frame(width: 50, height: 100)

            // 四角形
            Rectangle()
                .foregroundColor(.green)
                .frame(width: 50, height: 100)

            // 角丸四角形 ※引数に角の半径を指定する
            RoundedRectangle(cornerRadius: 50)
                .foregroundColor(.pink)
                .frame(width: 50, height: 100)

            // カプセル形 ※縦横で短い辺が丸くなる
            Capsule()
                .foregroundColor(.black)
                .frame(width: 100, height: 50)
        }


        /**
         -----------------------------------------------------------------
         図形の塗り色
         - foregroundColor()またはfill()で指定可能。
         -----------------------------------------------------------------
         */
        VStack {
            Circle()
                .fill(Color.pink)
                .frame(width: 250, height: 100)
            Circle()
                .foregroundColor(Color("Wakakusa"))
                .frame(width: 250, height: 100)
        }

        /**
         -----------------------------------------------------------------
         図形の回転。
         - rotationEffect()で回転させる。
         - 領域が傾くのではなく、領域に描かれている図形が傾く。
         -----------------------------------------------------------------
         */
        VStack {
            Ellipse()
                .foregroundColor(.orange)
                .frame(width: 200, height: 400)
                // 45度傾ける
                .rotationEffect(.degrees(45))
                // 傾いて領域からはみ出た部分をクリッピング
                .clipped()
        }

        /**
         -----------------------------------------------------------------
         図形を重ねて表示する。
         - ZStack(Depth Stack)はビューを同じ位置に上に重ねる。
         - 基本的には定義した順番に重なっていくが、zIndex(順番)で指定することも可能。
         - anchor: .bottom  で回転の中心を指定している。
         -----------------------------------------------------------------
         */
        ZStack {
            Ellipse()
                // 線で描く
                .stroke(lineWidth: 4)
                .foregroundColor(.pink)
                .frame(width: 100, height: 300)
            Ellipse()
                .stroke(lineWidth: 4)
                .foregroundColor(.purple)
                .frame(width: 100, height: 300)
                // 回転させる
                .rotationEffect(.degrees(30), anchor: .bottom)
            Ellipse()
                .stroke(lineWidth: 4)
                .foregroundColor(.green)
                .frame(width: 100, height: 300)
                .rotationEffect(.degrees(-30), anchor: .bottom)
        }

        /**
         -----------------------------------------------------------------
         表示座標をposition()で指定する。
         - 図形を好きな位置に表示される方法の一つとして、position()で指定する。
         -----------------------------------------------------------------
         */
        ZStack {
            Circle()
                .foregroundColor(.green)
                .frame(width: 100, height: 100)
                .position(x: 120, y:150)

            Rectangle()
                .foregroundColor(.orange)
                .frame(width: 100, height: 100)
                .position(x: 300, y: 350)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/**
 AssetsにClolor Setを作る
 - ナビゲータエリアでAssetsを選択する
 - エディタエリアの左下にある+ボタンをクリックして表示されたメニューからColor Setを選択する。
 - Clolor Setに名前を付けて、Any Appearanceを選択する。
 - 右のインスペクタのColorで色を作る。
 */
