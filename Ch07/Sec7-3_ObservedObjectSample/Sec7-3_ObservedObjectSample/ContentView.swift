//
//  ContentView.swift
//  Sec7-3_ObservedObjectSample
//  
//  Created in 2022/10/25
//  
//

import SwiftUI
/**
 -----------------------------------------------------------------
 ■ オブジェクトのクラス定義とプロパティをつくった処理
 -----------------------------------------------------------------
 */
struct ContentView: View {
    // 観測するオブジェクト ※観測対象のオブジェクトであることを示す
    @ObservedObject var user = User()

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            // インスタンスのプロパティを変更する
            Group {
                // 入力を受け付ける
                TextField("名前を入力してください", text: $user.name)
                TextField("身長を入力してください", text: $user.tall)
                    .keyboardType(.numberPad)
            }.textFieldStyle(RoundedBorderTextFieldStyle())

            // プロパティを参照してサイズを表示
            if !(user.name).isEmpty && !(user.tall).isEmpty {
                Text("\(user.name)さんは\(fitSize(tall: user.tall))")
            }
        }.frame(width: 250)
    }
}

/**
 -----------------------------------------------------------------
 ■ 名前(name), 身長(tall)の2個の観測するプロパティがあるUserクラスを定義
 値の更新を観測したいnameプロパティとtallプロパティがあるUserクラスを
 `ObservableObjectプロトコル`準拠で定義する。
 -----------------------------------------------------------------
 */
class User: ObservableObject {
    // 変更をパブリッシュする
    @Published var name = ""
    @Published var tall = ""
}

/**
 -----------------------------------------------------------------
 ■ 身長からサイズを求める関数fitSize()を定義
 引数tallで身長を受け取り、該当するサイズを返却する関数。引数はString型なので、
 `Double(tall)`で数値に変換する。また、tallの値を数値化できない可能性があるの
 で、`gurad let-else`を使う。
 -----------------------------------------------------------------
 */
func fitSize(tall:String) -> String {
    // tallを数値に変換できない場合は"???"を返却して中断
    guard let height = Double(tall) else {
        return "???"
    }
    // tallを数値化した値heightで場合分けする
    switch height {
        case 145..<155:
            return "Sサイズです"
        case 155..<176:
            return "Mサイズです"
        case 176..<185:
            return "Lサイズです"
        default:
            return "適したサイズがありません"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
