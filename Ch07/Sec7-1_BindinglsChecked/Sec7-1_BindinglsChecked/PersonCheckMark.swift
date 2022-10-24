//
//  PersonCheckMark.swift
//  Sec7-1_BindinglsChecked
//  
//  Created in 2022/10/23
//  
//

import SwiftUI
/**
 -----------------------------------------------------------------
 ■ ひも付けて使う変数を@Bindingで宣言する
 Toggleで作るスイッチのように未チェック/チェック済みが切り替わるチェックボタンを
 作る。タップすると未チェック/チェック済みのイメージと色が切り替わるボタンを表示す
 る。
 -----------------------------------------------------------------
 */
struct PersonCheckMark: View {
    // バインディングして使う
    @Binding var isChecked: Bool

    var body: some View {
        Button(action: {
            // isCheckedのtrue/false を反転する
            isChecked.toggle()
        }) {
            // isCheckedがtrueかfalseかでイメージと色を選ぶ
            Image(systemName: isChecked ? "person.fill.checkmark" : "person")
                .foregroundColor(isChecked ? .blue : .gray)
                .scaleEffect(2.0)
                .frame(width: 40, height: 40)
        }
    }
}
