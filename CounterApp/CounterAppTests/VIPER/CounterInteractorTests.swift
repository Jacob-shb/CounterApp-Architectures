//
//  CounterInteractorTests.swift
//  CounterAppTests
//
//  Created by Jacob  on 20.01.2026.
//

import XCTest
@testable import CounterApp

final class CounterInteractorTests: XCTestCase {
    
    var sut: CounterInteractor!
    var mockPresenter: MockCounterPresenter!
    
    override func setUp() {
        super.setUp()
        sut = CounterInteractor()
        mockPresenter = MockCounterPresenter()
        sut.presenter = mockPresenter
    }
    
    override func tearDown() {
        sut = nil
        mockPresenter = nil
        super.tearDown()
    }
    
    // MARK: - Fetch Counter Tests
    
    func testFetchCounter_shouldCallPresenterWithInitialValue() {
        // given
        
        // when
        sut.fetchCounter()
        
        XCTAssertTrue(mockPresenter.didFetchCounterCalled, "Presenter should be called")
        XCTAssertEqual(mockPresenter.didFetchCounterValue, 0, "Should return initial value")
    }
    
    func testFetchCounter_withCustomValue_shouldReturnThatValue() {
        // given
        sut.counter.value = 42
        
        // when
        sut.fetchCounter()
        
        // then
        XCTAssertEqual(mockPresenter.didFetchCounterValue, 42)
    }
    
    // MARK: - Increment Tests
    
    func testIncrement_shouldIncreaseValueAndNotifyPresenter() {
        // given
        let initialValue = sut.counter.value
        
        // when
        sut.increment()
        
        // then
        XCTAssertEqual(sut.counter.value, initialValue + 1, "Counter should increase")
        XCTAssertTrue(mockPresenter.didUpdateCounterCalled, "Presenter should be notified")
        XCTAssertEqual(mockPresenter.didUpdateCounterValue, initialValue + 1)
    }
    
    func testMultipleIncrements_shouldNotifyPresenterEachTime() {
        // given
        let incrementCount = 3
        
        // when
        for _ in 0..<incrementCount {
            sut.increment()
        }
        
        XCTAssertEqual(sut.counter.value, incrementCount)
        XCTAssertEqual(mockPresenter.didUpdateCounterCallCount, incrementCount, "Presenter should be called for each increment")
    }
    
    // MARK: - Decrement Tests
    
    func testDecrement_shouldDecreaseValueAndNotifyPresenter() {
        // given
        sut.counter.value = 5
        let initialValue = sut.counter.value
        
        // when
        sut.decrement()
        
        // then
        XCTAssertEqual(sut.counter.value, initialValue - 1)
        XCTAssertTrue(mockPresenter.didUpdateCounterCalled)
        XCTAssertEqual(mockPresenter.didUpdateCounterValue, initialValue - 1)
    }
    
    func testDecrement_whenZero_shouldNotChangeValueAndNotNotifyPresenter() {
        // given
        sut.counter.value = 0
        
        // when
        sut.decrement()
        
        // then
        XCTAssertEqual(sut.counter.value, 0, "Should stay at zero")
        XCTAssertFalse(mockPresenter.didUpdateCounterCalled, "Presenter should NOT be called when no change")
    }
    
    func testDecrement_fromOne_shouldReachZeroAndNotifyPresenter() {
        // given
        sut.counter.value = 1
        
        // when
        sut.decrement()
        
        // then
        XCTAssertEqual(sut.counter.value, 0)
        XCTAssertTrue(mockPresenter.didUpdateCounterCalled)
        XCTAssertEqual(mockPresenter.didUpdateCounterValue, 0)
    }
    
    // MARK: - Reset Tests
    
    func testReset_shouldSetToZeroAndNotifyPresenter() {
        // given
        sut.counter.value = 99
        
        // when
        sut.reset()
        
        // then
        XCTAssertEqual(sut.counter.value, 0)
        XCTAssertTrue(mockPresenter.didUpdateCounterCalled)
        XCTAssertEqual(mockPresenter.didUpdateCounterValue, 0)
    }
    
    func testReset_whenAlreadyZero_shouldStillNotifyPresenter() {
        // given
        sut.counter.value = 0
        
        // when
        sut.reset()
        
        // then
        XCTAssertEqual(sut.counter.value, 0)
        XCTAssertTrue(mockPresenter.didUpdateCounterCalled, "Presenter should be notified even when already zero")
    }
    
    // MARK: - Integration Tests
    
    func testComplexScenario_shouldWorkCorrectly() {
        // given
        mockPresenter.reset()
        
        // when
        sut.increment()
        sut.increment()
        sut.decrement()
        sut.reset()
        
        // then
        XCTAssertEqual(sut.counter.value, 0)
        XCTAssertEqual(mockPresenter.didUpdateCounterCallCount, 4, "Presenter should be called 4 times")
    }
}
