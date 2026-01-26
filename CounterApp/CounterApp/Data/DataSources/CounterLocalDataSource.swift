//
//  CounterLocalDataSource.swift
//  CounterApp
//
//  Created by Jacob  on 21.01.2026.
//

import Foundation

protocol CounterLocalDataSourceProtocol {
    func getCounter() -> Int
    func saveCounter(value: Int)
}

class CounterLocalDataSource: CounterLocalDataSourceProtocol {
    private var currentValue: Int = 0
    
    func getCounter() -> Int {
        return currentValue
    }
    
    func saveCounter(value: Int) {
        currentValue = value
    }
}
