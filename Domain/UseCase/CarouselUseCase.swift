//
//  CarouselUseCase.swift
//  Domain
//
//  Created by okudera on 2021/02/15.
//

public enum CarouselUseCaseProvider {

    public static func provide() -> CarouselUseCase {
        return CarouselUseCaseImpl()
    }
}

public protocol CarouselUseCase {

}

private final class CarouselUseCaseImpl: CarouselUseCase {

    init() {}
}


