//
//  CleanCounterProtocols.swift
//  CounterApp
//
//  Created by Jacob  on 23.01.2026.
//

import Foundation

// MARK: - View -> Presenter
protocol CleanCounterViewToPresenterProtocol: AnyObject {
    var view: CleanCounterPresenterToViewProtocol? { get set }
    var interactor: CleanCounterPresenterToInteractorProtocol? { get set }
    
    func viewDidLoad()
    func incrementButtonTapped()
    func decrementButtonTapped()
    func resetButtonTapped()
}

// MARK: - Presenter -> View
protocol CleanCounterPresenterToViewProtocol {
    func updateCounter(value: Int)
}

// MARK: - Presenter -> Interactor
protocol CleanCounterPresenterToInteractorProtocol: AnyObject {
    var presenter: CleanCounterInteractorToPresenterProtocol? { get set }
    
    func fetchCounter()
    func increment()
    func decrement()
    func reset()
}

// MARK: - Interactor -> Presenter

protocol CleanCounterInteractorToPresenterProtocol: AnyObject {
    func didFetchCounter(value: Int)
    func didUpdateCounter(value:Int)
}

