//
//  DecrementCounterUseCase.swift
//  CounterApp
//
//  Created by Jacob  on 21.01.2026.
//

import Foundation

protocol DecrementCounterUseCaseProtocol {
    func execute() -> Counter
}

class DecrementCounterUseCase: DecrementCounterUseCaseProtocol {
    private let repository: CounterRepositoryProtocol
    
    init(repository: CounterRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() -> Counter {
        var counter = repository.getCounter()
        
        guard counter.canDecrement() else {
            return counter
        }
        
        counter.value -= 1
        repository.saveCounter(counter)
        return counter
    }
}
