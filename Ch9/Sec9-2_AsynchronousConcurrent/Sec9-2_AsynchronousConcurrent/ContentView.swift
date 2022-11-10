//
//  ContentView.swift
//  Sec9-2_AsynchronousConcurrent
//  
//  Created in 2022/11/10
//  
//

import SwiftUI
/**
 -----------------------------------------------------------------
 ■ 時間がかかる処理を擬似的に作成
 非同期処理で実行するgetWho()とgetMessage()を`asyncとawait`を使って定義。
 ※ Task.sleepは非推奨になったらしい
 -----------------------------------------------------------------
 */
// 非同期で実行したい処理 1
func getWho() async -> String {
    await Task.sleep(5 * 1000 * 1000 * 1000)        // 5秒スリープ
    return "山本さん"
}

// 非同期で実行したい処理 2
func getMessage() async -> String {
    await Task.sleep(3 * 1000 * 1000 * 1000)        // 3秒スリープ
    return "ハロー"
}

/**
 -----------------------------------------------------------------
 ■ 経過時間を測るためのタイマー
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

struct ContentView: View {
    @State var message: String = ""
    @ObservedObject var watch = StopWatch()

    var body: some View {
        VStack {
            Button(action: {
                // タスク実行
                Task {
                    watch.start()
                    message = "- - -"
                    // 非同期処理を並行して実行
                    async let who = getWho()
                    async let msg = getMessage()
                    // whoとmsgの処理が終わるまで待機
                    message = await who + ", " + msg + " ! "
                    watch.stop()
                }
            }) {
                Label("async TEST", systemImage: "testtube.2")
                    .background(
                        Capsule()
                            .stroke(lineWidth: 1)
                            .frame(width: 180, height: 40))
            }.padding(30)
            Text("\(message)").font(.title2)                    // 実行結果を表示
            // 経過秒数
            let milliSeconds = Int((watch.elapsedTime) * 100)%100
            let seconds = Int(watch.elapsedTime)
            Text("\(seconds).\(milliSeconds)").padding()        // 経過時間を表示
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
