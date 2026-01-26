//
//  CleanCounterPresenter.swift
//  CounterApp
//
//  Created by Jacob  on 23.01.2026.
//

import Foundation

class CleanCounterPresenter: CleanCounterViewToPresenterProtocol {
    var view: CleanCounterPresenterToViewProtocol?
    var interactor: CleanCounterPresenterToInteractorProtocol?
    
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

extension CleanCounterPresenter: CleanCounterInteractorToPresenterProtocol {
    func didFetchCounter(value: Int) {
        view?.updateCounter(value: value)
    }
    
    func didUpdateCounter(value: Int) {
        view?.updateCounter(value: value)
    }
}
