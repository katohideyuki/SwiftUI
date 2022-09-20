//
//  ContentView.swift
//  Sec2-4_StackAlignment
//  
//  Created in 2022/09/20
//  
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        /**
         -----------------------------------------------------------------
         複数のテキストを整列させる。
         - Vstackの属性を設定する。
         -----------------------------------------------------------------
         */
        VStack(alignment: .leading, spacing: 15.0) {
            Text("春はあけぼの")
            Text("夏は夜")
            Text("秋は夕暮")
            Text("冬はつとめて")
        }
        .font(.largeTitle)
        
        /**
         -----------------------------------------------------------------
         スペーサーを使って位置を調整する。
         - Spacer()で余白を埋める。
         - 上、間、下にSpacer()を入れると、3個のスペーサーで余白を均等に埋めることができる。
         -----------------------------------------------------------------
         */
        VStack {
            Spacer()
            VStack(alignment: .trailing) {
                Text("知性の自転車")
                    .font(.largeTitle)
                    . fontWeight(.black)
                Text("Bicycle for the Mind.")
                    .italic()
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text("憐れみは恋の始まり")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                Text("Pity is akin to love.")
                    .italic()
            }
            Spacer()
        }
        
        /**
         -----------------------------------------------------------------
         パディングを使った余白の調整
         - パディング(Padding)を使うと上下左右の間隔を広げることができ、
           画面の縁や他のテキストなどとの余白を調整を細かくできる。
         - 間隔の数値をマイナスにすると余白が狭まる。
         オフセット
         - 表示座標をずらす
         -----------------------------------------------------------------
         */
        VStack {
            VStack(alignment: .trailing) {
                Text("知性の自転車")
                    .font(.largeTitle)
                    . fontWeight(.black)
                Text("Bicycle for the Mind.")
                    .italic()
                    // 表示座標を左に10ずらす
                    .offset(x: -10, y: 0)
            }
            // 領域の上の余白を80とる
            .padding(.top, 80.0)
            VStack(alignment: .trailing) {
                Text("憐れみは恋の始まり")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                Text("Pity is akin to love.")
                    .italic()
                    // 表示座標を左に10ずらす
                    .offset(x: -10, y: 0)
            }
            // 領域の上の余白を20とる
            .padding(.top, 20.0)
            // 下の余白を埋めるので、全体が上に詰まる
            Spacer()
        }
        
        /**
         -----------------------------------------------------------------
         パディングを使いこなす
         - .padding([.leading, .bottom], 20.0)のように、複数方向を指定するには
           カンマで区切って[]で囲む。
            - この形式はSetと呼ばれ、値の重複を許さず、順番を保証しない。
         -----------------------------------------------------------------
         */
        VStack {
            Text("1. 枕草子/清少納言")
                // 左と下の余白をセットで指定する
                .padding([.leading, .bottom], 20.0)
            Text("2. 春はあけぼの")
            Text("3. やうやう白くなり行く")
            Text("4. 山ぎは少しあかりて")
                .padding()
            Text("5. 紫だちたる雲の細くたなびきたる")
        }
        .padding(.vertical, 50.0)
        .padding(.horizontal, 30.0)
        .font(.callout)
        .border(Color.pink, width: 2)
        
        /**
         -----------------------------------------------------------------
         テキストの背景色と余白の背景色
         -----------------------------------------------------------------
         */
        VStack {
            Text("Hello, world!")
                // テキストの背景色を設定
                .background(Color.yellow)
                // パディングの背景色を設定 ※余白に色をつける
                .padding()
                .background(Color.green)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/**
 レイアウトを調整する
 - 基本的な位置揃えや余白の調整方法
 - 画像表示や図形の重なり、伸縮など
 */
