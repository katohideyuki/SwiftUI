//
//  ContentView.swift
//  Sec5-7_DatePicker
//  
//  Created in 2022/10/09
//  
//

import SwiftUI

/**
 -----------------------------------------------------------------
 デートピッカーをつくる
 デートピッカーは年月日と時刻を選択できるピッカー。シュミレーターまたは実機で検証
 すると、ホイールの時刻をクリックすると数値入力用のキーボードが表示される。

 ■ 日時を表示する簡単なデートピッカー
 Date()は実行した現在日時を返却する。

 ■ カレンダーを日本語で表示する(localeの設定)
 カレンダーの日付を日本語にするには`environment`モディファイアで
 `ロケール(言語や国の設定)`を日本すなわち`ja_JP`に設定する。

 ■ 和暦のカレンダーにする(calendarの設定)
 カレンダーの日本語化にはlocaleの日本語表示とは別にcalendarの設定もある。
 `calendarをjapanese`にすることで、`和暦表示`になる。また、localeを指定しなけれ
 ば、`Reiwa`表示になる

 ■ 選択できる日付の範囲を制限する
 デートピッカーで選択できる日付の範囲を制限することができる。DatePicker()に引数
 `in: レンジ`を追加して範囲を指定する。`Calsendar.current.date()`では引数
 byAddingが`.day`ならば日数、`.month`ならば月数で指定した相対的な日付をつくる。
 引数`to`は制限区間の基準にする日付であり、to:Date()とした場合、当日を基準日として
 いる。
 -----------------------------------------------------------------
 */
struct ContentView: View {
    @State var theDate = Date() // 初期値として現在日時を取得

    // 選択できる日付の範囲 レンジを返却する
    var dateClosedRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .day, value: -7, to: Date())!
        let max = Calendar.current.date(byAdding: .month, value: 1, to: Date())!
        return min...max
    }

    var body: some View {
        // デートピッカーで選択した日付が変数theDateが格納される
        DatePicker(selection: $theDate,
                   // 選択できる範囲を選択
                   in: dateClosedRange,
                   label: { Text("日時") })
            // ロケールを設定することで、カレンダーを日本語にする
            .environment(\.locale, Locale(identifier: "ja_JP"))
            // 和暦のカレンダーにする
            .environment(\.calendar, Calendar(identifier: .japanese))
            .padding(50)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/**
 -----------------------------------------------------------------
 ■ デートピッカーで選択した日時データを表示する
 デートピッカーで選択した日時データはDatePicker()の引数selection: で指定した変数に入
 る。`DateFormatter`で書式をつくって適用することで、日付を読みやすく表示できる
 。`dateStyle`プロパティと`timeStyle`プロパティで書式を指定する。書式は予め用
 意されている`full, long, medium, short`から選択する。
 また、`書式をカスタマイズ`することができ、`年月日ならyy, YYYY, MM, ddなど`、
 `時刻なら HH, mm, ssなど`の記号を文字列に埋め込んで書式をつくることができる。
 `曜日はEは「火」だが、EEEEならば「火曜日」`となる。
 -----------------------------------------------------------------
 */
struct ContentView2: View {
    @State var theDate = Date()

    // 日付表示の書式 1
    var dateFormat1: DateFormatter {
        let df       = DateFormatter()
        df.locale    = Locale(identifier: "ja_JP")
        df.dateStyle = .full
        df.timeStyle = .short
        return df
    }
    // 日付表示の書式 2
    var dateFormat2: DateFormatter {
        let df        = DateFormatter()
        df.locale     = Locale(identifier: "ja_JP")
        df.calendar   = Calendar(identifier: .japanese)
        df.dateFormat = "令和yy(YYYY)年M月dd日(E)HH時mm分"
        return df
    }

    var body: some View {
        VStack {
            // 作った書式を使って日付表示
            Text(dateFormat1.string(from: theDate))
            Text(dateFormat2.string(from: theDate))
            // デートピッカー
            DatePicker(selection: $theDate, label: { EmptyView() })
                .environment(\.locale, Locale(identifier: "ja_JP"))
                .frame(width: 200, height: 40)
                .padding()
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
 ■ 日付データをdescriptionプロパティを使って表示する
 Dateクラスの`description`プロパティを使えばUTC(協定世界時)での表示、ロケール
 指定での表示ができる。
 -----------------------------------------------------------------
 */
struct ContentView3: View {
    let theDate = Date()

    var body: some View {
        VStack(alignment: .leading) {
            Text("\(theDate)")
            Text(theDate.description).padding(.vertical)    // UTC
            Text(theDate.description(with: Locale(identifier: "ja_JP")))
        }.padding()
    }
}

struct ContentView3_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
    }
}

/**
 -----------------------------------------------------------------
 ■ 日付と日時の2つのコンポーネントに分けて表示する
 `DatePicker()`に引数`displayedComponents`を追加することで、日付だけ
 `.date`、時刻だけ`.hourAndMinute`のコンポーネントにできる。省略時は両方を表
 示する`[.hourAndMinute, .date]`になる。
 -----------------------------------------------------------------
 */
struct ContentView4: View {
    @State var theDate = Date()

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // 日付ピッカー
            DatePicker("日付", selection: $theDate, displayedComponents: .date)
                .environment(\.locale, Locale(identifier: "ja_JP"))
                .frame(width: 200)
            // 時刻ピッカー
            DatePicker("時刻", selection: $theDate, displayedComponents: .hourAndMinute)
                .frame(width: 200)
            // ピッカーで選択している日時
            Text(theDate.description(with: Locale(identifier: "ja_JP")))
                .font(.footnote)
        }
        .padding()
        .border(.gray, width: 1 )
    }
}

struct ContentView4_Previews: PreviewProvider {
    static var previews: some View {
        ContentView4()
    }
}
