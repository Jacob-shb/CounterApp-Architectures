//
//  CounterRepository.swift
//  CounterApp
//
//  Created by Jacob  on 21.01.2026.
//

import Foundation

class CounterRepository: CounterRepositoryProtocol {
    private let dataSource: CounterLocalDataSourceProtocol
    
    init(dataSource: CounterLocalDataSourceProtocol) {
        self.dataSource = dataSource
    }
    
    func getCounter() -> Counter {
        let value = dataSource.getCounter()
        return Counter(value: value)
    }
    
    func saveCounter(_ counter: Counter) {
        dataSource.saveCounter(value: counter.value)
    }
}
