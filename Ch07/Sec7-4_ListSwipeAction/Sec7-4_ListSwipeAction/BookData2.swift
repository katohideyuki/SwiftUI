//
//  BookData2.swift
//  Sec7-4_ListSwipeAction
//  
//  Created in 2022/10/31
//  
//

import SwiftUI
import Foundation       // 基本的な機能を提供するフレームワーク
/**
 -----------------------------------------------------------------
 ■ 右から左へスワイプアクションを追加
 スワイプアクションによってフラグを付けられるようにBook構造体に`isFlag`プロパティ
 を追加し、Booksクラスに`toggleIsFlag()とremoveBook()`関数を定義。
 -----------------------------------------------------------------
 */
struct Book2: Identifiable, Equatable {
    var id = UUID()
    var title: String       // 書名
    var author: String      // 著者
    var isRead = false      // 既読のときtrue
    var isFlag = false      // フラグありのときtrue
}


// ObserableObjectを継承したBooksクラス
class Books2: ObservableObject {
    @Published var booksData2 = [
        Book2(title: "風の又三郎", author: "宮沢賢治"),
        Book2(title: "人間失格", author: "太宰治"),
        Book2(title: "坊ちゃん", author: "夏目漱石"),
        Book2(title: "遠野物語", author: "柳田国男"),
        Book2(title: "生まれいずる悩み", author: "有島武郎"),
        Book2(title: "舞姫", author: "森鴎外"),
        Book2(title: "人間椅子", author: "江戸川乱歩"),
        Book2(title: "人間レコード", author: "夢野久作"),
        Book2(title: "山月記", author: "中島敦")
    ]

    // 既読と未読の反転
    func toggleIsRead(_ item: Book2) {
        guard let index = booksData2.firstIndex(of: item) else { return }
        booksData2[index].isRead.toggle()
    }

    // フラグ反転
    func toggleIsFlag(_ item: Book2) {
        guard let index = booksData2.firstIndex(of: item) else { return }
        booksData2[index].isFlag.toggle()
    }

    // 配列からの削除
    func removeBook(_ item: Book2) {
        guard let index = booksData2.firstIndex(of: item) else { return }
        booksData2.remove(at: index)
    }
}
