//
//  ContentView.swift
//  Sec5-6_PickerNavigationView
//  
//  Created in 2022/10/09
//  
//

import SwiftUI

/**
 -----------------------------------------------------------------
 ピッカーとナビゲーションビューを組み合わせる

 ■ 値を別ページのリストから選択するピッカーをつくる。
 FormとNavigationViewの機能を使ってピッカーで選ぶ選択肢を別のページに開く仕組みを
 つくる。Pickerブロックを`Form{}`で囲み、さらに全体を`NavigationView{}`で囲
 むと、labelでラベルも表示されるようになる。クリックで選択肢を別ページで開くことが
 できる。

 ■ 別ページに設定できずに、menuスタイルのピッカーになってしまう。
 結論、現時点の自分の環境では実現不可能。iOS16以降は別ページに遷移するピッカーは
 削除されている。代わりに、Xcode14.1ベータ3以降であればピッカーのスタイルに
 `.navigationLink`を指定すればiOS16以前のように別ページで選択できるピッカーを
 つくることができるらしい。
 -----------------------------------------------------------------
 */
struct ContentView: View {
    @State var selectedSize = 2
    let sizes = ["XS", "S", "M", "L", "LL"]

    var body: some View {
        NavigationView {
            Form {
                Picker(selection: $selectedSize, label: Text("Size")) {
                    ForEach(0..<sizes.count, id: \.self) { index in
                        Text(sizes[index])
                    }
                }
                // 選んだサイズを表示する
                Text("選んだサイズ : \(sizes[selectedSize])")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/**
 -----------------------------------------------------------------
 ■ 複数のピッカーをセクション分けして表示する
 Formブロックの中には複数のPickerブロックを定義することができるが、コンテンツのブ
 ロックを`Section`で囲むことで複数のセクションに分けて表示できる。
 -----------------------------------------------------------------
 */
struct ContentView2: View {
    @State var selectedSize  = 2
    @State var selectedColor = 0
    let sizes  = ["XS", "S", "M", "L", "LL"]
    let colors = ["Red", "Green", "Blue", "Yellow", "Pink", "White"]

    var body: some View {
        NavigationView {
            Form {
                // サイズのセクション
                Section(header: Text("サイズ").font(.headline),
                        footer: Text("USサイズの少し大きめです").padding(.bottom, 20)) {
                    // サイズのピッカー
                    Picker(selection: $selectedSize, label: Text("Size")) {
                        ForEach(0..<sizes.count, id: \.self) { index in
                            Text(sizes[index])
                        }
                    }
                    Text("選んだサイズ : \(sizes[selectedSize])")
                }
                // 色のセクション
                Section(header: Text("色").font(.headline)) {
                    // 色のピッカー
                    Picker(selection: $selectedColor, label: Text("Color")) {
                        ForEach(0..<colors.count, id: \.self) { index in
                            Text(colors[index])
                        }
                    }
                    Text("選んだ色 : \(colors[selectedColor])")
                }
            } // From
            // ナビゲーションのタイトル
            .navigationTitle(Text("サイズと色"))
        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
