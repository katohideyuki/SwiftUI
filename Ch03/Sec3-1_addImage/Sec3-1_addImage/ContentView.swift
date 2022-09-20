//
//  ContentView.swift
//  Sec3-1_addImage
//  
//  Created in 2022/09/20
//  
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        /**
         -----------------------------------------------------------------
         写真を表示する。
         - Image("画像名")
         -----------------------------------------------------------------
         */
        VStack {
            Image("seaSky")
                // 画面サイズに合わせて伸縮する
                .resizable(resizingMode: .stretch)
                // 縦横比を保ちながら画面サイズにフィットさせる
                .aspectRatio(contentMode: .fit)
                // 写真サイズをwidth300に設定する ※fitモードにしているため、heightは指定不要
                .frame(width: 300.0)
            Text("Hello, world!")
        }
        .padding()
        
        /**
         -----------------------------------------------------------------
         比率を保って伸縮する.fillと.fitの違い。
         - .fill : 余白が出ないように領域を埋めるように伸縮する。
         - .fit : 縦横サイズに全体が納まるように比率を保ったまま伸縮する。
         -----------------------------------------------------------------
         */
        VStack {
            Image("seaSky")
                .resizable(resizingMode: .stretch)
                // 領域を埋めるように縦横の長い辺に合わせて伸縮する(この画像の長辺は縦)
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 300)
                // はみ出た部分をクリッピングする
                .clipped()
            Text("Hello, World!").padding()
        }
        
        /**
         -----------------------------------------------------------------
         伸縮率と位置の調整。
         - .fillモードで表示すると中央が切り取られたように表示されるが、伸縮率を
           scaleEffect()で指定し、offset()で画像をずれすことで見たい部分を表示でき
           る。
         - scaleEffect()とoffset()の実行順が違うと結果が変わるので注意する。
         -----------------------------------------------------------------
         */
        VStack {
            Image("seaSky")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fill)
                // 画像を1.8倍に拡大する
                .scaleEffect(/*@START_MENU_TOKEN@*/1.8/*@END_MENU_TOKEN@*/)
                // 表示する画像をずらす
                .offset(x: /*@START_MENU_TOKEN@*/-70.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/-30.0/*@END_MENU_TOKEN@*/)
                .frame(width: 200, height: 300)
                .clipped()
            Text("Hello, World!").padding()
        }
        
        /**
         -----------------------------------------------------------------
         オーバーレイを使って文字を重ねる。
         - overray()を使うとテキストなどを重ねたイメージを作ることができる。
         - テキストの位置をずらすには、offset()を使う。
         -----------------------------------------------------------------
         */
        VStack {
            Image("seaSky")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 400)
                .clipped()
                // 写真にテキストを重ねる
                .overlay(
                    Text("Hello, World!")
                        .font(.title)
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                        .offset(x: 0, y: -50)
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/**
 画像の取り込み
 - ナビゲーターエリアでAssetsを選択して開き、Finderから画像をドロップする。
 - 取り込んだら、ContentViewを選択し、ライブラリパネルを表示し、メディア
   ライブラリから取り込んだ画像をプレビューにドロップする。
 */
