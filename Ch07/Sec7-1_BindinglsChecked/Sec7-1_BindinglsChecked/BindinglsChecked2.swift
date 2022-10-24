//
//  BindinglsChecked2.swift
//  Sec7-1_BindinglsChecked
//  
//  Created in 2022/10/23
//  
//

import SwiftUI
/**
 -----------------------------------------------------------------
 ■ チェック担当者を2人にする
 PersonCheckMarkビューを作ったので、担当者を何人でも作ることができる。
 -----------------------------------------------------------------
 */
struct BindinglsChecked2: View {
    // チェック状態を保存 (PersonCheckMarkビューのisCheckedとバインディングする)
    @State var isChecked1: Bool = false
    @State var isChecked2: Bool = false

    var body: some View {
        VStack {
            HStack {
                Text("担当者1のチェック")
                PersonCheckMark(isChecked: $isChecked1)
            }
            HStack {
                Text("担当者2のチェック")
                PersonCheckMark(isChecked: $isChecked2)
            }
            // 全チェックの判定
            Group {
                if isChecked1 && isChecked2 {
                    Text("全員チェック済み").foregroundColor(.blue)
                } else {
                    Text("チェック待ち").foregroundColor(.red)
                }
            }
            .font(.largeTitle)
            .padding(.top)
        }
    }
}

struct BindinglsChecked2_Previews: PreviewProvider {
    static var previews: some View {
        BindinglsChecked2()
    }
}
