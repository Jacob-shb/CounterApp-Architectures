//
//  CounterInteractor.swift
//  CounterApp
//
//  Created by Jacob  on 17.01.2026.
//

import Foundation

class CounterInteractor: CounterPresenterToInteractorProtocol {
    var presenter: CounterInteractorToPresenterProtocol?
    var counter: CounterEntity = CounterEntity()
    
    func fetchCounter() {
        presenter?.didFetchCounter(value: counter.value)
    }
    
    func increment() {
        counter.value += 1
        presenter?.didUpdateCounter(value: counter.value)
    }
    
    func decrement() {
        guard counter.value > 0 else { return }
        counter.value -= 1
        presenter?.didUpdateCounter(value: counter.value)
    }
    
    func reset() {
        counter.value = 0
        presenter?.didUpdateCounter(value: counter.value)
    }
}
