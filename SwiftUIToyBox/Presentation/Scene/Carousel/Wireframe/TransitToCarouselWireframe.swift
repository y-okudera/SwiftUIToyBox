//
//  TransitToCarouselWireframe.swift
//  SwiftUIToyBox
//
//  Created by yuoku on 15/02/2021.
//  Copyright © 2021 yuoku. All rights reserved.
//

import Foundation

/// Carouselへ遷移するためのWireframe
protocol TransitToCarouselWireframe {
    func routeToCarouselView() -> CarouselView
}

extension TransitToCarouselWireframe {
    func routeToCarouselView() -> CarouselView {
        CarouselBuilder.build()
    }
}
