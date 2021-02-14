//
//  TopWireframe.swift
//  SwiftUIToyBox
//
//  Created by yuoku on 13/02/2021.
//  Copyright © 2021 yuoku. All rights reserved.
//

import Foundation

enum TopWireframeProvider {

    static func provide() -> TopWireframe {
        return TopWireframeImpl()
    }
}

/// Topから他の画面へ遷移するためのWireframe
///
/// TransitoToXXXWireframeを導線のパターンだけ準拠する
protocol TopWireframe: TransitToCarouselWireframe {}

final class TopWireframeImpl: TopWireframe {}
