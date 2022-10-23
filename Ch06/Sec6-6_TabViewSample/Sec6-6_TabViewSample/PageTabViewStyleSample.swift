//
//  PageTabViewStyle.swift
//  Sec6-6_TabViewSample
//  
//  Created in 2022/10/23
//  
//

import SwiftUI
/**
 -----------------------------------------------------------------
 ■ 左右のスワイプでページ送りできるタブビュースタイル
 TabViewに`tabViewStyle(PageTabViewStyle())`のモディファイアを付けると
 ビューを左右のスワイプでページ送りできるスタイルになる。このスタイルは
 `ページコントロール`が表示されて、現在開いているページがハイライト表示される。こ
 れに対して、分かれているタブのタップでビューを切り替える初期値のスタイルは、
 `tabViewStyle(DefaultTabViewStyle())`。
 -----------------------------------------------------------------
 */
struct PageTabViewStyleSample: View {
    @State var selectedTag = 1

    var body: some View {
        TabView (selection: $selectedTag) {
            HomeTabView().tag(1)
            WeatherTabView().tag(2)
            NewsTabView().tag(3)
        }
        .tabViewStyle(PageTabViewStyle())
        .ignoresSafeArea()
    }
}

struct PageTabViewStyle_Previews: PreviewProvider {
    static var previews: some View {
        PageTabViewStyleSample()
    }
}
