//
//  ContentView3.swift
//  Sec7-4_ListSwipeAction
//  
//  Created in 2022/10/31
//  
//

import SwiftUI
/**
 -----------------------------------------------------------------
 ■ 編集モードを追加する
 Editボタンは`EditButton()`を実行するだけで作ることができる。Editボタンをクリ
 ックすると、それだけで編集モードになるが、ドラッグで行を入れ替えられるようにする
 には`onMove`モディファイア、削除ボタンを表示するには`onDelete`モディファイアを
 `ForEachに追加`してそれぞれ処理を行うコートを定義する。
 -----------------------------------------------------------------
 */
struct ContentView3: View {
    @ObservedObject var books = Books()

    var body: some View {
        NavigationView {
            List {
                ForEach(books.booksData) { item in
                    BookView(item)
                        // 右方向へのスワイプアクション（ボタンを左端に表示）
                        .swipeActions(edge: .leading) {
                            Button {
                                books.toggleIsRead(item)
                            } label: {
                                if item.isRead {
                                    Label("未読にする", systemImage: "book.closed")
                                } else {
                                    Label("既読にする", systemImage: "book.fill")
                                }
                            }.tint(.blue)       // ボタンの色
                        }
                }
                // ドラッグ処理
                .onMove { indexSet, index in
                    books.booksData.move(fromOffsets: indexSet, toOffset: index)
                }
                // 削除処理
                .onDelete { indexSet in
                    books.booksData.remove(at: indexSet.first!)
                }
            }
            .navigationBarTitle(Text("図書リスト"))
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()        // 編集ボタンをツールバーに表示
                }
            }
        }
    }
}

struct ContentView3_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
    }
}
