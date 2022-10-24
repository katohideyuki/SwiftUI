//
//  ContentView.swift
//  Sec7-1_BindinglsChecked
//  
//  Created in 2022/10/23
//  
//

import SwiftUI

struct ContentView: View {
    // チェック状態を保存 (PersonCheckMarkビューのisCheckedとバンディングする)
    @State var isChecked_person1: Bool = false

    var body: some View {
        HStack {
            Text("担当者1のチェック")
            // PersonCheckMarkビューを作る
            PersonCheckMark(isChecked: $isChecked_person1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
