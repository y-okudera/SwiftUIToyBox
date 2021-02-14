//
//  TransitToTopWireframe.swift
//  SwiftUIToyBox
//
//  Created by yuoku on 13/02/2021.
//  Copyright © 2021 yuoku. All rights reserved.
//

import Foundation

/// Topへ遷移するためのWireframe
protocol TransitToTopWireframe {
    func routeToTopView() -> TopView
}

extension TransitToTopWireframe {
    func routeToTopView() -> TopView {
        TopBuilder.build()
    }
}
