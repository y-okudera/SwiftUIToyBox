//
//  CarouselBuilder.swift
//  SwiftUIToyBox
//
//  Created by yuoku on 15/02/2021.
//  Copyright © 2021 yuoku. All rights reserved.
//

import Domain

enum CarouselBuilder {

    static func build() -> CarouselView {
        let useCase = CarouselUseCaseProvider.provide()
        let wireframe = CarouselWireframeProvider.provide()
        let viewModel = CarouselViewModelProvider.provide(useCase: useCase, wireframe: wireframe)
        let view = CarouselView(viewModel: viewModel)
        return view
    }
}
