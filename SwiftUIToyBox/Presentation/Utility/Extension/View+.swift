//
//  View+.swift
//  SwiftUIToyBox
//
//  Created by okudera on 2021/02/14.
//

import SwiftUI

extension View {
    /// ナビバーにイメージを追加
    @ViewBuilder func navigationBarImage(uiImage: UIImage, geometryProxy: GeometryProxy) -> some View {
        self.navigationBarItems(leading: ZStack {
            HStack {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometryProxy.size.width, height: 44.0, alignment: .center)
            }
        })
    }
}
