//
//  ResetCounterUseCase.swift
//  CounterApp
//
//  Created by Jacob  on 21.01.2026.
//

import Foundation

protocol ResetCounterUseCaseProtocol {
    func execute() -> Counter
}

class ResetCounterUseCase: ResetCounterUseCaseProtocol {
    private let repository: CounterRepositoryProtocol
    
    init(repository: CounterRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() -> Counter {
        let counter = Counter(value: 0)
        repository.saveCounter(counter)
        return counter
    }
}
