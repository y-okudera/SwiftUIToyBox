//
//  TopBuilder.swift
//  SwiftUIToyBox
//
//  Created by yuoku on 13/02/2021.
//  Copyright © 2021 yuoku. All rights reserved.
//

import Domain

enum TopBuilder {

    static func build() -> TopView {
        let useCase = TopUseCaseProvider.provide()
        let wireframe = TopWireframeProvider.provide()
        let viewModel = TopViewModelProvider.provide(useCase: useCase, wireframe: wireframe)
        let view = TopView(viewModel: viewModel)
        return view
    }
}
