//
//  CounterRepositoryProtocol.swift
//  CounterApp
//
//  Created by Jacob  on 21.01.2026.
//

import Foundation

protocol CounterRepositoryProtocol {
    func getCounter() -> Counter
    func saveCounter(_ counter: Counter)
}
