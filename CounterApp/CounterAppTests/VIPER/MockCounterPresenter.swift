//
//  MockCounterPresenter.swift
//  CounterAppTests
//
//  Created by Jacob  on 20.01.2026.
//

import Foundation
@testable import CounterApp

class MockCounterPresenter: CounterInteractorToPresenterProtocol {
    
    
    var didFetchCounterCalled = false
    var didFetchCounterValue: Int?
    
    var didUpdateCounterCalled = false
    var didUpdateCounterValue: Int?
    var didUpdateCounterCallCount = 0
    
    func didFetchCounter(value: Int) {
        didFetchCounterCalled = true
        didFetchCounterValue = value
    }
    
    func didUpdateCounter(value: Int) {
        didUpdateCounterCalled = true
        didUpdateCounterValue = value
        didUpdateCounterCallCount += 1
    }
    
    func reset() {
        didFetchCounterCalled = false
        didFetchCounterValue = nil
        didUpdateCounterCalled = false
        didUpdateCounterValue = nil
        didUpdateCounterCallCount = 0
    }
}
