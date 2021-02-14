//
//  CarouselWireframe.swift
//  SwiftUIToyBox
//
//  Created by yuoku on 15/02/2021.
//  Copyright © 2021 yuoku. All rights reserved.
//

import Foundation

enum CarouselWireframeProvider {

    static func provide() -> CarouselWireframe {
        return CarouselWireframeImpl()
    }
}

/// Carouselから他の画面へ遷移するためのWireframe
///
/// TransitoToXXXWireframeを導線のパターンだけ準拠する
protocol CarouselWireframe {}

final class CarouselWireframeImpl: CarouselWireframe {}
