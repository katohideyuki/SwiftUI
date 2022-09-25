//
//  ContentView.swift
//  Sec4-5_PhotoList
//  
//  Created in 2022/09/23
//  
//

import SwiftUI
/**
 -----------------------------------------------------------------
 リスト表示から詳細ページを開く
 NavigationViewのブロックの中にNavigationLinkを定義するとリンクになり、リンクをタッ
 プするとdestinationで指定したビューが開く。
 -----------------------------------------------------------------
 */
struct ContentView: View {
    var body: some View {
        NavigationView {
            List(photoArray) { item in
                // 行をタップすると開く詳細ビュー
                NavigationLink(destination: PhotoDetailView(photo: item)) {
                    // リストに表示する各行のビュー
                    RowView(photo: item)
                }
            }
            .navigationTitle(Text("写真リスト"))
        }

        /**
         上記のコードが少し複雑なので、もう少し単純なコードに修正する
         */
        NavigationView {
            NavigationLink(destination: SubView()) {
                // 移動のリンクボタン
                Label("Goサブビュー", systemImage: "message")
            }
            // 左肩に表示されるタイトルになり、戻りボタンのタイトルとしても表示
            .navigationTitle("Home")
        }.navigationViewStyle(.stack)

        /**
         detailView()関数を使用したナビゲーションリンクを作る。
         */
        NavigationView {
            // 遷移先のビュー
            NavigationLink (destination: detailView()) {
                // リンクボタン
                HStack(alignment: .bottom, spacing: 10) {
                    Image("IMG_6460")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                    Text("鷹取山")
                }
            }.navigationTitle("人気スポット")
        }.navigationViewStyle(.stack)
    }
}

/**
 -----------------------------------------------------------------
 複数のプレビューを表示
 プレビュー表示を行うためのContentView_PreviewsにはContentViewをプレビュー表示す
 るためにContentView()を定義していたが、detailView()も追加することで、ContentViewと
 detailViewの2つのプレビューを表示できる。
 -----------------------------------------------------------------
 */
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        detailView()        // プレビューを追加
    }
}

/**
 リンク先のサブビュー
 */
struct SubView: View {
    var body: some View {
        Text("SubView").font(.largeTitle)
    }
}

/**
 -----------------------------------------------------------------
 サブビューを`@ViewBuilder`で修飾した関数で作る
 これまでの例ではNavigationLinkの遷移先のビューをContentViewと同じようにstructで定義
 する構造体で作っていたが、`@ViewBuilder`を付与したユーザ定義関数で作ることもで
 きる。

 関数
 ```Swift 関数の書式
 func 関数名() -> 戻り値の型
 ```
 -----------------------------------------------------------------
 */
@ViewBuilder
func detailView() -> some View {
    VStack {
        Text("鷹取山ハイキングコース")
            .font(.title2)
        Image("IMG_6460")
            .resizable()
            .aspectRatio(contentMode: .fit)
        Text("横須賀 鷹取山の磨崖仏")
    }
    .padding()
}

/**
 -----------------------------------------------------------------
 プロトコルが指定してある構造体
 プロトコルとは
 規格のようなもので、クラスや構造体が保持するプロパティやメソッドなどの決まり事を
 定めるモノ。プロトコルが指定してあることで、クラスや構造体の機能や属性を知る事が
 できたり、コードの不備をXcodeが指摘してくれる。

 ```Swift プロトコルが指定してある構造体の書式
 struct 構造体名 : プロトコル {
 }
 ```
 -----------------------------------------------------------------
 */
// Viewプロトコルを指定
struct ContentView2: View {
    // Viewプロトコルに従ってbodyが必須
    var body: some View {
        Text("Viewプロトコルを指定")
    }
}

// PreviewProviderプロトコルを指定 ※ContentView2用のプレビュー
struct ContentView2_Previews: PreviewProvider {
    // PreviewProviderプロトコルに従ってpreviewsが必須
    static var previews: some View {
        ContentView2()
    }
}
