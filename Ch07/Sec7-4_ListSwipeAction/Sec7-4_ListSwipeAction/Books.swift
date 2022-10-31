//
//  Books.swift
//  Sec7-4_ListSwipeAction
//  
//  Created in 2022/10/31
//  
//

import SwiftUI
/**
 -----------------------------------------------------------------
 ■ リストに表示する本Book構造体のリストを持つ、Booksクラスを定義
 
 -----------------------------------------------------------------
 */
// ObserableObjectを継承したBooksクラス
class Books: ObservableObject {
    @Published var booksData = [
        Book(title: "風の又三郎", author: "宮沢賢治"),
        Book(title: "人間失格", author: "太宰治"),
        Book(title: "坊ちゃん", author: "夏目漱石"),
        Book(title: "遠野物語", author: "柳田国男"),
        Book(title: "生まれいずる悩み", author: "有島武郎"),
        Book(title: "舞姫", author: "森鴎外"),
        Book(title: "人間椅子", author: "江戸川乱歩"),
        Book(title: "人間レコード", author: "夢野久作"),
        Book(title: "山月記", author: "中島敦")
    ]

    // 既読と未読の反転
    func toggleIsRead(_ item: Book) {
        guard let index = booksData.firstIndex(of: item) else { return }
        booksData[index].isRead.toggle()
    }
}
