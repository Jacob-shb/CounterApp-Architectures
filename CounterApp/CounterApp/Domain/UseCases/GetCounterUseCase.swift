//
//  GetCounterUseCase.swift
//  CounterApp
//
//  Created by Jacob  on 21.01.2026.
//

import Foundation

protocol GetCounterUseCaseProtocol {
    func execute() -> Counter
}

class GetCounterUseCase: GetCounterUseCaseProtocol {
    private let repository: CounterRepositoryProtocol
    
    init(repository: CounterRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() -> Counter {
        return repository.getCounter()
    }
}
