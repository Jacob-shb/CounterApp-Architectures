//
//  CounterProtocols.swift
//  CounterApp
//
//  Created by Jacob  on 17.01.2026.
//

import Foundation

protocol CounterViewToPresenterProtocol: AnyObject {
    var view: CounterPresenterToViewProtocol? { get set }
    var interactor: CounterPresenterToInteractorProtocol? { get set }
    
    func viewDidLoad()
    func incrementButtonTapped()
    func decrementButtonTapped()
    func resetButtonTapped()
}

protocol CounterPresenterToViewProtocol {
    func updateCounter(value: Int)
}

protocol CounterPresenterToInteractorProtocol: AnyObject {
    var presenter: CounterInteractorToPresenterProtocol? { get set }
    var counter: CounterEntity { get set }
    
    func fetchCounter()
    func increment()
    func decrement()
    func reset()
}

protocol CounterInteractorToPresenterProtocol: AnyObject {
    func didFetchCounter(value: Int)
    func didUpdateCounter(value: Int)
}
