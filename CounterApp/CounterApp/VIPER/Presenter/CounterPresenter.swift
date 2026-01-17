//
//  CounterPresenter.swift
//  CounterApp
//
//  Created by Jacob  on 17.01.2026.
//

import Foundation

class CounterPresenter: CounterViewToPresenterProtocol {
    var view: CounterPresenterToViewProtocol?
    var interactor: CounterPresenterToInteractorProtocol?
    
    // MARK: - View -> Presenter
    
    func viewDidLoad() {
        interactor?.fetchCounter()
    }
    
    func incrementButtonTapped() {
        interactor?.increment()
    }
    
    func decrementButtonTapped() {
        interactor?.decrement()
    }
    
    func resetButtonTapped() {
        interactor?.reset()
    }
}

// MARK: - Interactor -> Presenter

extension CounterPresenter: CounterInteractorToPresenterProtocol {
    func didFetchCounter(value: Int) {
        view?.updateCounter(value: value)
    }
    
    func didUpdateCounter(value: Int) {
        view?.updateCounter(value: value)
    }
}
