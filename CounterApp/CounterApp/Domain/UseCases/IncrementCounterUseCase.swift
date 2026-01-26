//
//  IncrementCounterUseCase.swift
//  CounterApp
//
//  Created by Jacob  on 21.01.2026.
//

import Foundation

protocol IncrementCounterUseCaseProtocol {
    func execute() -> Counter
}

class IncrementCounterUseCase: IncrementCounterUseCaseProtocol {
    private let repository: CounterRepositoryProtocol
    
    init(repository: CounterRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() -> Counter {
        var counter = repository.getCounter()
        counter.value += 1
        repository.saveCounter(counter)
        return counter
    }
}
