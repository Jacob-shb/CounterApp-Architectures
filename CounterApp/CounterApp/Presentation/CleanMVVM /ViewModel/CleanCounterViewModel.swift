//
//  CleanCounterViewModel.swift
//  CounterApp
//
//  Created by Jacob  on 21.01.2026.
//

import Foundation
import Combine

class CleanCounterViewModel: ObservableObject {
    @Published var counter: Counter
    
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
        
        self.counter = getCounterUseCase.execute()
    }
    
    // MARK: - Actions
    
    func increment() {
        counter = incrementUseCase.execute()
    }
    
    func decrement() {
        counter = incrementUseCase.execute()
    }
    
    func reset() {
        counter = resetUseCase.execute()
    }
}
