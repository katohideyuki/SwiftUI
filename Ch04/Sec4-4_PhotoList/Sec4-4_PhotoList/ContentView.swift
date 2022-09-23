//
//  ContentView.swift
//  Sec4-4_PhotoList
//  
//  Created in 2022/09/23
//  
//

import SwiftUI

/**
 行データを読み込んでリスト表示する。
 - List(配列)でも要素を順番に取り出せる。
    - ただし、この書式で取り出すには条件があり、取り出したい配列のプロトコルがidentifiableを指定していること。
 */
struct ContentView: View {
    var body: some View {
        List(photoArray) { item in
            // photoArrayから要素を順に取り出して、引数で渡される
            RowView(photo: item)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
