//
//  ContentView.swift
//  Sec9-3_AsynchronousSequences
//  
//  Created in 2022/11/10
//  
//

import SwiftUI
/**
 -----------------------------------------------------------------
 ■ 時間がかかる処理を擬似的に作る
 ※いまさらだけど、なぜ1000ずつ分けて掛けているのか。。。
 -----------------------------------------------------------------
 */
func getWho() async -> String {
    await Task.sleep(5 * 1000 * 1000 * 1000)        // 5秒待機
    return "山本さん"
}

func getMessage() async -> String {
    await Task.sleep(3_000_000_000)        // 3秒待ち
    return "ハロー"
}

/**
 -----------------------------------------------------------------
 ■ 経過時間を測るためのタイマー ※
 -----------------------------------------------------------------
 */
class StopWatch: ObservableObject {
    // 経過秒数
    @Published var elapsedTime: Double = 0.0
    private var timer = Timer()     // タイマーをつくる
    // タイマースタート
    func start() {
        guard !timer.isValid else { return }        // timer実行中はキャンセル
        self.elapsedTime = 0.0
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
            self.elapsedTime += 0.01
        }
    }

    // タイマーストップ
    func stop() {
        timer.invalidate()
    }
}

/**
 -----------------------------------------------------------------
 ■ 経過秒数を返却するgetElapsedTIme()をStopWtachクラスに拡張する
 extensinを利用して前セクションで定義したStopWtachクラスに
 `現在の経過秒数をStringで返却する関数getSlapsedTime()`を拡張する。

 `非同期処理の結果を待って次のステップへと進みたい`場合は`await`を付けて実行する。
 -----------------------------------------------------------------
 */
extension StopWatch {
    func getElapsedTime() -> String {
        // 経過秒数
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2     // 小数点以下の桁数を指定
        let seconds = formatter.string(from: NSNumber(floatLiteral: self.elapsedTime)) ?? "0:00"
        return seconds
    }
}

struct ContentView: View {
    @State var message: String = ""
    @State var logTime: String = ""
    @ObservedObject var watch  = StopWatch()

    var body: some View {
        VStack {
            Button(action: {
                // タスク
                Task {
                    logTime = ""
                    watch.start()
                    //  逐次処理 ※非同期処理の結果を待って順に進めていく
                    message = "_ _ _"
                    message = await getWho()
                        // ↓ getWho()の処理が完了するまで実行されない
                        logTime = watch.getElapsedTime()
                        message += ", "
                        message += await getMessage()
                            // ↓ getMessage()の処理が完了するまで実行されない
                            logTime = "\n" + watch.getElapsedTime()
                            message += "! "
                            watch.stop()
                }
            }) {
                Label("await TEST", systemImage: "testtube.2")
                    .background(
                        Capsule()
                            .stroke(lineWidth: 1)
                            .frame(width: 180, height: 40))
            }.padding(30)
            // 実行結果と経過秒数のログを表示する
            Text("\(message)").font(.title2)
            Text("\(logTime)").padding()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
