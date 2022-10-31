//
//  ContentView2.swift
//  Sec7-4_ListSwipeAction
//  
//  Created in 2022/10/31
//  
//

import SwiftUI
/**
 -----------------------------------------------------------------
 ■ BookView2ビューにフラグ、削除のスワイプアクションを追加
 BookView2ビューに`右から左へスワイプするスワイプアクション`を追加する。フラグを
 付ける/外すのボタンとリストから削除ボタンの2個のボタンを表示。右から左へスワイプす
 るスワイプアクションをするには、swipeActionsの引数`edgeをtrailing`にする。
 `allowsFullSwipe: false`の引数を追加することで、フルスワイプの操作をしても途
 中でスワイプが止まり、ボタンが表示され続ける。
 -----------------------------------------------------------------
 */
struct ContentView2: View {
    @ObservedObject var books2 = Books2()

    var body: some View {
        List(books2.booksData2) { item in
            BookView2(item)
                // 右方向へのスワイプアクション（ボタンを左端に表示）
                .swipeActions(edge: .leading) {
                    Button {
                        books2.toggleIsRead(item)
                    } label: {
                        if item.isRead {
                            Label("未読にする", systemImage: "book.closed")
                        } else {
                            Label("既読にする", systemImage: "book.fill")
                        }
                    }.tint(.blue)       // ボタンの色
                }
                // 左方向へのスワイプアクション（ボタンを右端に表示）
                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                    // ボタン1 - 削除
                    Button(role: .destructive) {
                        withAnimation(.linear(duration: 0.4)) {
                            books2.removeBook(item)
                        }
                    } label: {
                        Label("削除", systemImage: "trash")
                    }

                    // ボタン2 - フラグを付ける/外すボタン
                    Button {
                        books2.toggleIsFlag(item)
                    } label: {
                        if item.isFlag {
                            Label("フラグを外す", systemImage: "trash")
                        } else {
                            Label("フラグ", systemImage: "flag")
                        }
                    }.tint(item.isFlag ? .gray : .blue)
                }
        }.listStyle(.plain)
    }
}

// リストの行に表示するビュー
func BookView2(_ item: Book2) -> some View {
    HStack(alignment: .top) {
        VStack(alignment: .leading) {
            Text(item.title).bold()     // 書名
            Text(item.author)           // 著者
        }
        if item.isFlag {
            Spacer()        // 右寄せ
            Image(systemName: "flag")
        }
    }
    .foregroundColor(item.isRead ? .gray : .black)
    .frame(height: 80)      // 行の高さ
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
