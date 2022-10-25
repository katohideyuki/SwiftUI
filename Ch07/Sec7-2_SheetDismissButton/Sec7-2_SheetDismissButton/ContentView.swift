//
//  ContentView.swift
//  Sec7-2_SheetDismissButton
//  
//  Created in 2022/10/24
//  
//

import SwiftUI
/**
 -----------------------------------------------------------------
 ■ SomeViewビューをボタンで表示するContentCiewビューを定義
 ボタンでtrueにする`変数isShowは@State`を付けて宣言する。
 `sheet(isPresented: $isShow)`だけではなく、シート表示するSomeViewビュー
 を作る`SomeView(isPresentes: $isShow)`にも$isSHowを引数で渡す。

 ■ sheetモディファイアで表示したビューを閉じる
 sheetモディファイアの引数isPresentedにtrueを渡すとシートが表示される。つまり、
 `変数isShowがtrueのときにシートが表示`される。逆に言えば
 `isShowをfalseにすれば表示されているシートを閉じる`ことができる。
 -----------------------------------------------------------------
 */
struct ContentView: View {
    @State var isShow: Bool = false

    var body: some View {
        Button(action: {
            isShow = true
        }) {
            Text("シートを表示")
        }
        .sheet(isPresented: $isShow) {
            // $isShowがtrueならば、someViewビューのプロパティ$isPresented
            // に渡されて表示される。 ※$isShowをバインディング
            SomeView(isPresented: $isShow)
        }
    }
}

/**
 -----------------------------------------------------------------
 ■ @Bindingの機能を使って閉じるボタンを作る
 ContentViewビューに重ねて表示するSomeViewビューを定義する。シートに表示する
 VStackにtoolbarモディファイアを追加し、ツールバーに「閉じる」ボタンでは、タッ
 プされたならば`変数isPresentedをfalseに設定`する。このisPresentedは、
 @Stateではなく`@Bingind`を付けて宣言しておく。

 ■ 閉じるボタンでisShowをfalseにする
 SomeViewの閉じるボタンでContentViewの変数isShowの値をfalseにできるように、
 ContentViewの`isShowをSomeViewの変数isPresentedとをバインディング`する。
 そのためにSomeViewを定義する際に`@Binding`を付けて変数isPresentedを宣言。


 ※ 個人的に階層が深くて見づらい。。。
 -----------------------------------------------------------------
 */
struct SomeView: View {
    // ContentViewビューの変数isShowとバインディングする
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
                ToolbarItem(placement: .navigationBarTrailing) {
                    // 閉じるボタン
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

/**
 -----------------------------------------------------------------
 ■ SomeViewビューもプレビューされるようにする
 struct SomeViewにはバインディングで値を指定するisPresentedがあるので、
 `SomeView(isPresented: Binding.constant(false))`のようｊに初期値を指定
 してプレビューを作る。
 @Bindingを指定した場合は、そのままではプレビューを表示することができないため。
 こては紐づける変数が未指定のままなので初期値がブランクのままだから。それを回避す
 るため、Binding.constantを定義してプレビューに追加する。
 -----------------------------------------------------------------
 */
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        // SomeViewビューもプレビューする
        SomeView(isPresented: Binding.constant(false))
    }
}
