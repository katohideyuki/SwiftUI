//
//  ContentView.swift
//  Sec2-3_TextInspector
//  
//  Created in 2022/09/20
//  
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        /**
         -----------------------------------------------------------------
         各Textに対してプロパティの設定
         -----------------------------------------------------------------
         */
        VStack {
            // frame 文章の表示領域を設定する。
            // border 枠線を設定する。
            Text("Bicycle for the Mind")
                .font(.title)
                .fontWeight(.thin)
                .frame(width: 200.0, height: 200.0)
                .border(Color.green, width: 5)
                .padding(/*@START_MENU_TOKEN@*/.all, 20.0/*@END_MENU_TOKEN@*/)
            // foregroundColor 文字色を設定する。
            Text("知性の自転車")
                .foregroundColor(Color.red)
                .padding()
            // lineLimit 表示される文章の最大行数制限をかける。
            Text("春はあけぼの。やうやう白くなり行く、山ぎは少しあかりて、紫だちたる雲の細くたなびきたる。")
                .font(.body)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .frame(width: 200.0)
                .padding()
            Text("フォントサイズを直接指定する。")
                .font(.system(size: 30))
            // frame()のalignmentオプションを指定して、表示領域内での表示位置を調整する。
            Text("The quick brown fox \n jumps over \n the lazy dog.")
                .frame(width: 250, height: 100, alignment: .bottomTrailing)
        }
        /**
         -----------------------------------------------------------------
         上位の設定を受け継ぐInheritedの設定
         -----------------------------------------------------------------
         */
        VStack {
            Text("春はあけぼの")
            // 2行目だけ文字色を赤にする。
            Text("夏は夜").foregroundColor(.red)
            Text("秋は夕暮")
            Text("冬はつとめて")
        }
        // この指定がVStack内のTextに受け継がれてる。
        .font(.title)
        .foregroundColor(.blue)
        
        /**
         -----------------------------------------------------------------
         テキストを連結して表示する。
         文字連結しているのではなく、個々に指定したテキストを続けて表示している。
         -----------------------------------------------------------------
         */
        VStack {
            Text("No.").bold() + Text("123").font(.largeTitle).foregroundColor(.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/**
 フォントや縦横サイズを設定する。
 - テキストのフォントサイズ、種類、色、位置揃えなどの属性(プロパティ)を設定することができる。
 - プロパティの設定には、インスペクタエリアにあるアトリビュートインスぺクタを利用できる。
 - プロパティを設定するための修飾コードをモディファイア(Modifier)と呼ぶ。
 */
