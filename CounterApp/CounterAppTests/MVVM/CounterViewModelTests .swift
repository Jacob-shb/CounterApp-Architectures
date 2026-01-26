//
//  CounterViewModelTests .swift
//  CounterAppTests
//
//  Created by Jacob  on 19.01.2026.
//

import XCTest
@testable import CounterApp

final class CounterViewModelTests: XCTestCase {
    
    var sut: CounterViewModel!
    
    override func setUp() {
        super.setUp()
        sut = CounterViewModel()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Initial State Tests
    
    func testInitialValue_shouldBeZero() {
        // Given - начальное состояние (уже создали в setUp)
        // When - ничего не делаем
        // Then - проверяем
        XCTAssertEqual(sut.counter.value, 0, "Initial counter value should be 0")
    }
    
    // MARK: - Increment Tests
    
    func testIncrement_shouldIncreaseValueByOne() {
        let initialValue = sut.counter.value // given
        
        sut.increment() // when
        
        XCTAssertEqual(sut.counter.value, initialValue + 1) // then
    }
    
    func testMultipleIncrements_shouldIncreaseCorrectly() {
        let incrementCount = 5 // given
        
        for _ in 0..<incrementCount {
            sut.increment()
        }
        
        XCTAssertEqual(sut.counter.value, incrementCount)
    }
    
    // MARK: - Decrement Tests
    
    func testDecrement_shouldDecreaseValueByOne() {
        sut.counter.value = 5
        let initialValue = sut.counter.value // given
        
        sut.decrement() // when
        
        XCTAssertEqual(sut.counter.value, initialValue - 1) // then
    }
    
    func testDecrement_whenZero_shouldStayAtZero() {
        sut.counter.value = 0
        
        sut.decrement()
        
        XCTAssertEqual(sut.counter.value, 0, "Counter should not go below zero")
    }
    
    func testMultipleDecrements_shouldNotGoBelowZero() {
        sut.counter.value = 2
        
        for _ in 0..<5 {
            sut.decrement()
        }
        
        XCTAssertEqual(sut.counter.value, 0, "Counter should stop at zero")
    }
    
    func testReset_shouldSetValueToZero() {
        sut.counter.value = 42
        
        sut.reset()
        
        XCTAssertEqual(sut.counter.value, 0)
    }
    
    // MARK: - Integrations Tests
    
    func testIncrementThenDecrement_shouldReturnToOriginal() {
        let initialValue = 5
        sut.counter.value = initialValue // given
        
        sut.increment() // when
        sut.decrement()
        
        XCTAssertEqual(sut.counter.value, initialValue) // then
    }
    
    func testComplexScenario_shouldWorkCorrectly() {
        
        sut.increment()
        sut.increment()
        sut.increment()
        sut.decrement() // when
        sut.increment()
        sut.reset()
        sut.increment()
        
        XCTAssertEqual(sut.counter.value, 1) // then
    }
}

