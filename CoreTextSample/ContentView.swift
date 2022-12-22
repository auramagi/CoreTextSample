//
//  TableViewController.m
//  CoreTextSample
//
//  Created by Yu Sugawara on 12/07/08.
//  Copyright (c) 2012年 Yu Sugawara. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Group {
                    cell(title: "0. 最小限のコードで描画", content: Sample0.self)

                    cell(title: "1. 属性の設定1", content: Sample1.self)

                    cell(title: "2. 属性の設定2", content: Sample2.self)

                    cell(title: "3. 日本語行間問題の一部解決", subtitle: "※まだ日本語のみの描画で行間がつまる", content: Sample3.self)

                    cell(title: "4. 日本語行間問題の解決", content: Sample4.self)

                    cell(title: "5. 英語のみ文字色を変更", content: Sample5.self)

                    cell(title: "6. タップで情報取得", content: Sample6.self)

                    cell(title: "7. タップ範囲を囲う", content: Sample7.self)

                    cell(title: "8. タップ範囲を形態素で囲う", content: Sample8.self)

                    cell(title: "9. タップで1行ずつ描画", content: Sample9.self)
                }

                Group {
                    cell(title: "10. スクロールビュー", content: Sample10.self)

                    cell(title: "11. 10をUITextViewで") {
                        OtherViewRepresentable<Sample11>()
                    }

                    cell(title: "12. 1文字ずつ描画", content: Sample12.self)

                    cell(title: "13. 縦書", content: Sample13.self)

                    cell(title: "14. sizeToFit", content: Sample14.self)
                }
            }
            .navigationTitle("CoreText Sample")
            .navigationBarTitleDisplayMode(.inline)
        }
        .listStyle(.plain)
    }

    private func cell<V: CoreTextView>(title: String, subtitle: String? = nil, content: V.Type) -> some View {
        cell(title: title, subtitle: subtitle) {
            GeometryReader { proxy in
                CoreTextViewRepresentable<V>(size: proxy.size)
                    .background(.white)
            }
        }
    }

    private func cell<Content: View>(title: String, subtitle: String? = nil, @ViewBuilder content: () -> Content) -> some View {
        NavigationLink {
            content()
                .navigationTitle(title)
                .navigationBarTitleDisplayMode(.inline)
        } label: {
            LabeledContent {
                EmptyView()
            } label: {
                Text(title)

                if let subtitle {
                    Text(subtitle)
                }
            }
        }
    }
}

struct CoreTextViewRepresentable<UIViewType: CoreTextView>: UIViewRepresentable {
    let size: CGSize

    func makeUIView(context: Context) -> UIViewType {
        .init(frame: .init(origin: .zero, size: size))
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {

    }
}

struct OtherViewRepresentable<UIViewType: UIView>: UIViewRepresentable {
    func makeUIView(context: Context) -> UIViewType {
        .init(frame: .zero)
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {

    }
}
