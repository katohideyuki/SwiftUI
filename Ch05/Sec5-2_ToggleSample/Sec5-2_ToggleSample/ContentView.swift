//
//  ContentView.swift
//  Sec5-2_ToggleSample
//
//  Created in 2022/09/25
//  
//

import SwiftUI
/**
 -----------------------------------------------------------------
 オン/オフ切り替えトグルスイッチ
 トグルスイッチは現在の状態がオン/オフのどちらなのかを保存するための変数を用意する
 必要がある。また、トグルスイッチを実際に活用するには、スイッチの状態に応じて処理
 されること。

 オン/オフによって内部的に行われるのは、`Toggle(isOn: $iLike)`で指定した
 `変数iLikeの値の反転`である。iLikeの値は`論理値(Bool型)`なので`true/false`
 のどちらかの値となる。また、iLikeを引数isOnに渡すときは`$をつけて$iLikeにする`
 こと。
 オン → true
 オフ → false
 -----------------------------------------------------------------
 */
struct ContentView: View {
    // オン/オフで値を変更するため、`@State`を付ける
    @State var iLike = true

    var body: some View {
        VStack {
            // トグルスイッチを作成
            Toggle(isOn: $iLike) {
                Text("Like or Not")
                    .font(.largeTitle)
            }
            .fixedSize()
            .padding(50)

            // オン/オフで分岐する
            if iLike {
                // オンの場合 ※赤いハートマーク
                Image(systemName: "heart.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.red)
            } else {
                // オフの場合 ※斜線が入ったグレーのハートマーク
                Image(systemName: "heart.slash")
                    .font(.system(size: 80))
                    .foregroundColor(.gray)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/**
 -----------------------------------------------------------------
 ボタンスタイルのToggle
 Toggleに`toggleStyle(.button)`を指定することでボタンの形にすることができる。
 動作はスイッチと同じで、タップするごとに引数isOnで指定した変数の値の論理値が反転
 する。

 ?演算子 ※三項演算子のこと
 ```Swift ?演算子の書式
 論理式 ? trueの場合の値 : falseの場合の値
 ```

 写真の表示/非表示は`opacity()で透明度の設定`で行う。1.0であればそのまま表示し、
 0.0であれば写真が表示が見えなくなる。透明度の変化を`animation()`を使ってアニ
 メーションで表示する。`easeInOut(dulation: 1.0)`ならば1秒間のイーズインアウ
 ト(最初の最後の変化をじんわり行う)の変化になる。
 -----------------------------------------------------------------
 */
struct ContentView2: View {
    @State var isShow = true

    var body: some View {
        VStack {
            // Toggleでカプセル形のボタンを作成
            Toggle(isOn: $isShow) {
                Label(isShow ? "消す" : "表示する",
                      systemImage: isShow ? "eye.slash" : "eye")
                .frame(width: 150)
            }
            .toggleStyle(.button)
            .tint(isShow ? .red : .indigo)
            .clipShape(Capsule())
            // フェードイン/アウトのアニメーションになる
            .animation(.easeInOut(duration: 0.2), value: isShow)

            // 写真
            Image("eigakan")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300)
                // オフの場合、透明度を0.0にすることで写真が表示されない
                .opacity(isShow ? 1.0 : 0.0)
                .animation(.easeInOut(duration: 1.0), value: isShow)
        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}

/**
 -----------------------------------------------------------------
 トグルスイッチの色指定
 トグルスイッチは初期値では緑色だが、`tint()`モディファイアで色を設定できる。
 -----------------------------------------------------------------
 */
struct ContentView3: View {
    @State var isYaruki = true
    @State var isAuto   = true

    var body: some View {
        VStack(alignment: .leading) {
            Toggle("やる気モード", isOn: $isYaruki)
                .tint(.yellow)
            Toggle("自動設定", isOn: $isAuto)
                .tint(.red)
        }
        .frame(width: 200)
    }
}

struct ContentView3_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
    }
}

/**
 -----------------------------------------------------------------
 Buttonでトグルボタンを作る
 Toggleを使わずにButtonでもトグルボタンを作ることができる。
 -----------------------------------------------------------------
 */
struct ContentView4: View {
    @State var isFast = true

    var body: some View {
        HStack {
            Button(action: {
                // プロパティ値の変更を徐々に行う
                withAnimation{
                    // 実行の度にisFastの値をtrue/falseで入れ替える
                    isFast.toggle()
                }
            }){
                // ボタン名の変更
                Text(isFast ? "RUN" : "STOP")
                    .font(.title)
                    .foregroundColor(isFast ? .red : .black)
                    .padding(.trailing)
                    .frame(width: 100)
                // イメージの変更
                Image(systemName: isFast ? "hare" : "tortoise")
                    .foregroundColor(isFast ? .blue : .green)
                    // 回転角度を決める
                    .rotationEffect(.degrees(isFast ? 0 : 180))
                    // 3倍サイズにする
                    .scaleEffect(3)
                    .frame(width: 100)
            }.frame(width: 240, height: 70)
        }
    }
}

struct ContentView4_Previews: PreviewProvider {
    static var previews: some View {
        ContentView4()
    }
}

/**
 -----------------------------------------------------------------
 手軽に使えるSF Symbols
 イメージを用意しなくても手軽に使えるSF Symbols。IOS13以降、watchOS6以降で利用
 できる。SF Symbolsの表示は`Image(systemName: "sun.max"`のようにイメージ名
 を指定する。イメージの大きさ時は`imageScale()で.smail, .medium, .large`
 から指定する。

 SF Symbols  にどんな絵があるか、`SF Symbols 3 アプリ`で調べることができる。
 -----------------------------------------------------------------
 */
struct ContentView5: View {
    var body: some View {
        HStack {
            // SF Symbolsを表示
            Image(systemName: "sun.max")
            Image(systemName: "cloud.rain")
            Image(systemName: "camera")
            Image(systemName: "message")
            Image(systemName: "a.circle")
            Image(systemName: "calendar")
            // 塗り色を指定し、背景を円でクリッピングする
            Image(systemName: "star.fill")
                .frame(width: 34, height: 34)
                .foregroundStyle(.yellow)
                .background(.green)
                .clipShape(Circle())
        }
        .imageScale(.large)
    }
}

struct ContentView5_Previews: PreviewProvider {
    static var previews: some View {
        ContentView5()
    }
}
