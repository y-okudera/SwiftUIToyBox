//
//  CarouselViewModel.swift
//  SwiftUIToyBox
//
//  Created by yuoku on 15/02/2021.
//  Copyright © 2021 yuoku. All rights reserved.
//

import Combine
import Domain
import Ricemill
import SwiftUI

enum CarouselViewModelProvider {

    static func provide(useCase: CarouselUseCase, wireframe: CarouselWireframe) -> CarouselViewModel {
        CarouselViewModel(
            input: CarouselViewModel.Input(),
            store: CarouselViewModel.Store(),
            extra: CarouselViewModel.Extra(useCase: useCase, wireframe: wireframe)
        )
    }
}

final class CarouselViewModel: Machine<CarouselViewModel.Resolver> {

    typealias Output = Store

    final class Input: BindableInputType {
        // No Input
    }

    final class Store: StoredOutputType {
        // No Output
    }

    struct Extra: ExtraType {
        var useCase: CarouselUseCase
        var wireframe: CarouselWireframe
    }

    enum Resolver: ResolverType {

        static func polish(input: Publishing<Input>, store: Store, extra: Extra) -> Polished<Output> {
            var cancellables: [AnyCancellable] = []
            
            return Polished(cancellables: cancellables)
        }
    }
}
