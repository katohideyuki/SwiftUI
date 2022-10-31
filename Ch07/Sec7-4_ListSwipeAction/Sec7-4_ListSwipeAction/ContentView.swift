//
//  ContentView.swift
//  Sec7-4_ListSwipeAction
//  
//  Created in 2022/10/27
//  
//

import SwiftUI
import Foundation

/**
 -----------------------------------------------------------------
 ■ BookViewビューに定義してリストを表示
 `@ObservedObject`を付けてBooksクラスのインスタンスbooksを生成。bodyは
 booksData配列からでーたを取り出してBookViewビューとしてリスト表示する。
 `BookViewビューは@ViewBuilder`を付けて関数定義し、引数で渡された各本のデータ
 から書名と著者名を歳出してVStackでレイアウトする。

 ■ BookViewビューに未読/既読のスワイプアクションを付ける
 リスト表示しているBookViewビューに`swipeActions`モディファイアを追加。
 swipeActionsにはスワイプアクションで表示する`button`を作る。ボタンでは
 `books.toggleIsRead(item)を実行`するようにする。
 -----------------------------------------------------------------
 */
struct ContentView: View {
    // Book構造体をリストに持つBooksクラスを観測
    @ObservedObject var books = Books()

    var body: some View {
        List(books.booksData) { item in
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
        }.listStyle(.grouped)
    }
}

// リストの行に表示するビュー
@ViewBuilder
func BookView(_ item: Book) -> some View {
    VStack(alignment: .leading) {
        Text(item.title).bold()     // 書名
        Text(item.author)           // 著書名
    }
    // 既読のときグレー
    .foregroundColor(item.isRead ? .gray : .black)
    .frame(height: 80)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
