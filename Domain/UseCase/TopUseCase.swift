//
//  TopUseCase.swift
//  Domain
//
//  Created by okudera on 2021/02/13.
//

public enum TopUseCaseProvider {

    public static func provide() -> TopUseCase {
        return TopUseCaseImpl()
    }
}

public protocol TopUseCase {
    func get() -> TopViewData
}

private final class TopUseCaseImpl: TopUseCase {

    init() {}

    func get() -> TopViewData {
        TopViewData(titles: [
            "カルーセル",
        ])
    }
}
