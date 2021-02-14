//
//  StatefulNavigationLinkBuilder.swift
//  SwiftUIToyBox
//
//  Created by okudera on 2021/02/14.
//

import SwiftUI

/// ラベルを設置せず、isActiveの変更をトリガーとするNavigationLinkのビルダー
enum StatefulNavigationLinkBuilder<V: View> {

    static func build(destination: V, isActive: Binding<Bool>) -> some View {
        NavigationLink(destination: destination, isActive: isActive, label: EmptyView.init)
            .isDetailLink(false)
    }
}
