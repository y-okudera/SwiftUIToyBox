//
//  TopViewModel.swift
//  SwiftUIToyBox
//
//  Created by yuoku on 13/02/2021.
//  Copyright © 2021 yuoku. All rights reserved.
//

import Combine
import Domain
import Ricemill
import SwiftUI

enum TopViewModelProvider {

    static func provide(useCase: TopUseCase, wireframe: TopWireframe) -> TopViewModel {
        TopViewModel(
            input: TopViewModel.Input(),
            store: TopViewModel.Store(),
            extra: TopViewModel.Extra(useCase: useCase, wireframe: wireframe)
        )
    }
}

final class TopViewModel: Machine<TopViewModel.Resolver> {

    typealias Output = Store

    final class Input: BindableInputType {
        let tappedAtIndex = PassthroughSubject<Int, Never>()
    }

    final class Store: StoredOutputType {
        @Published var viewData: TopViewData = TopViewData()
        /// カルーセル画面への遷移のトリガー
        @Published var navigationTrigger: (view: CarouselView?, trigger: Bool) = (nil, false)
    }
    
    struct Extra: ExtraType {
        var useCase: TopUseCase
        var wireframe: TopWireframe
    }
    
    enum Resolver: ResolverType {
        
        static func polish(input: Publishing<Input>, store: Store, extra: Extra) -> Polished<Output> {
            var cancellables: [AnyCancellable] = []
            
            store.viewData = extra.useCase.get()
            
            input.tappedAtIndex.sink { [weak store] index in
                switch index {
                case 0:
                    store?.navigationTrigger.view = extra.wireframe.routeToCarouselView()
                    store?.navigationTrigger.trigger = true
                default:
                    break
                }
            }
            .store(in: &cancellables)
            
            return Polished(cancellables: cancellables)
        }
    }
}
