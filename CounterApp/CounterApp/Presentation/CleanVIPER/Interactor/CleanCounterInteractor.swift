//
//  CleanCounterInteractor.swift
//  CounterApp
//
//  Created by Jacob  on 23.01.2026.
//

import Foundation

class CleanCounterInteractor: CleanCounterPresenterToInteractorProtocol {
    var presenter: CleanCounterInteractorToPresenterProtocol?
    
    private let getCounterUseCase: GetCounterUseCaseProtocol
    private let incrementUseCase: IncrementCounterUseCaseProtocol
    private let decrementUseCase: DecrementCounterUseCaseProtocol
    private let resetUseCase: ResetCounterUseCaseProtocol
    
    init(
        getCounterUseCase: GetCounterUseCaseProtocol,
        incrementUseCase: IncrementCounterUseCaseProtocol,
        decrementUseCase: DecrementCounterUseCaseProtocol,
        resetUseCase: ResetCounterUseCaseProtocol
    ) {
        self.getCounterUseCase = getCounterUseCase
        self.incrementUseCase = incrementUseCase
        self.decrementUseCase = decrementUseCase
        self.resetUseCase = resetUseCase
    }
    
    func fetchCounter() {
        let counter = getCounterUseCase.execute()
        presenter?.didFetchCounter(value: counter.value)
    }
    
    func increment() {
        let counter = incrementUseCase.execute()
        presenter?.didUpdateCounter(value: counter.value)
    }
    
    func decrement() {
        let counter = decrementUseCase.execute()
        presenter?.didUpdateCounter(value: counter.value)
    }
    
    func reset() {
        let counter = resetUseCase.execute()
        presenter?.didUpdateCounter(value: counter.value)
    }
}
