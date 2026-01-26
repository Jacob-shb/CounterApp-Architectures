import Foundation

/*






 Задача 3.2 — Исправь Memory Leak
 swiftclass ViewController {
     var name: String = "MainVC"
     var onDataLoaded: (() -> Void)?
     
     func loadData() {
         NetworkManager.shared.fetchData { data in
             self.onDataLoaded?()
             print("\(self.name) loaded data")
         }
     }
 }

 class NetworkManager {
     static let shared = NetworkManager()
     var handlers: [() -> Void] = []
     
     func fetchData(completion: @escaping () -> Void) {
         handlers.append(completion)
     }
 }
 Проблема: Создаётся strong reference cycle.
 Задание: Исправь loadData() используя [weak self] или [unowned self]. Объясни выбор.

 БЛОК 4: Trailing Closures
 Задача 4.1 — Напиши функцию с multiple trailing closures
 swiftfunc processNumbers(_ numbers: [Int],
                     filter: (Int) -> Bool,
                     transform: (Int) -> Int) -> [Int] {
     // TODO: отфильтруй numbers используя filter,
     // затем преобразуй используя transform
 }

 // Вызов с trailing closures:
 let result = processNumbers([1, 2, 3, 4, 5, 6]) { number in
     // TODO: фильтр - только чётные
 } transform: { number in
     // TODO: трансформация - умножить на 2
 }

 print(result)  // [4, 8, 12]

 Задача 4.2 — Custom Map
 Реализуй свою версию map:
 swiftextension Array {
     func customMap<T>(_ transform: (Element) -> T) -> [T] {
         // TODO: примени transform к каждому элементу
     }
 }

 // Тест:
 let numbers = [1, 2, 3, 4]
 let squared = numbers.customMap { $0 * $0 }
 print(squared)  // [1, 4, 9, 16]

 БЛОК 5: Функции высшего порядка
 Задача 5.1 — Filter + Map + Reduce
 Дан массив чисел [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].
 Используя только closures и функции высшего порядка (filter, map, reduce):

 Оставь только чётные
 Возведи в квадрат
 Найди сумму

 swiftlet numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

 let result = numbers
     .filter { /* TODO */ }
     .map { /* TODO */ }
     .reduce(0) { /* TODO */ }

 print(result)  // 220 (2² + 4² + 6² + 8² + 10² = 4 + 16 + 36 + 64 + 100)

 Задача 5.2 — CompactMap
 Дан массив ["1", "2", "hello", "3", "world", "4"].
 Преобразуй в массив Int, отфильтровав не-числа:
 swiftlet strings = ["1", "2", "hello", "3", "world", "4"]

 let numbers = strings.compactMap { /* TODO: Int($0) */ }

 print(numbers)  // [1, 2, 3, 4]

 БЛОК 6: Autoclosures
 Задача 6.1 — Debug Logger
 Создай функцию логирования которая вычисляет сообщение только если logging enabled:
 swiftvar isLoggingEnabled = false

 func log(_ message: @autoclosure () -> String) {
     if isLoggingEnabled {
         print("[LOG] \(message())")
     }
 }

 // Использование:
 log("Expensive computation: \(someHeavyFunction())")
 // Если isLoggingEnabled = false, someHeavyFunction() НЕ вызовется!
 Реализуй: someHeavyFunction() -> String которая печатает "Computing..." и возвращает результат.
 Проверь: что при isLoggingEnabled = false функция НЕ вызывается.

 БЛОК 7: Комплексная задача
 Задача 7.1 — Task Queue
 Создай систему очереди задач:
 swiftclass TaskQueue {
     private var tasks: [() -> Void] = []
     
     func addTask(_ task: @escaping () -> Void) {
         // TODO: добавь task в очередь
     }
     
     func executeTasks() {
         // TODO: выполни все tasks по порядку
         // TODO: очисти массив после выполнения
     }
 }

 // Тест:
 let queue = TaskQueue()

 queue.addTask {
     print("Task 1")
 }

 queue.addTask {
     print("Task 2")
 }

 queue.addTask {
     print("Task 3")
 }

 queue.executeTasks()
 // Должно вывести:
 // Task 1
 // Task 2
 // Task 3
 */


/*
 📋 ПРАКТИЧЕСКИЕ ЗАДАЧИ
 БЛОК 1: Синтаксис Closures
 Задача 1.1 — Эволюция синтаксиса
 Дан массив чисел. Отсортируй его по возрастанию, используя 5 разных способов:
 swiftlet numbers = [5, 2, 8, 1, 9, 3]

 // Способ 1: Обычная функция
 func ascending(_ a: Int, _ b: Int) -> Bool {
     // TODO
 }
 var sorted1 = numbers.sorted(by: ascending)

 // Способ 2: Полный closure expression
 var sorted2 = numbers.sorted(by: { (a: Int, b: Int) -> Bool in
     // TODO
 })

 // Способ 3: Type inference
 var sorted3 = numbers.sorted(by: { a, b in
     // TODO
 })

 // Способ 4: Implicit return
 var sorted4 = numbers.sorted(by: { a, b in /* TODO одно выражение */ })

 // Способ 5: Shorthand argument names
 var sorted5 = numbers.sorted(by: { /* TODO с $0 и $1 */ })
 */

//1
let numbers = [5, 2, 8, 1, 9, 3]

func ascending(_ a: Int, _ b: Int) -> Bool {
    return a < b
}
var sorted1 = numbers.sorted(by: ascending)
print(sorted1)

//2
var sorted2 = numbers.sorted(by: { (a: Int, b: Int) -> Bool in
    return a < b
})
print(sorted2)

//3
var sorted3 = numbers.sorted(by: { a, b in
    return a < b
})
print(sorted3)

//4
var sorted4 = numbers.sorted(by: { a, b in a < b })
print(sorted4)

//5
var sorted5 = numbers.sorted(by: { $0 < $1 })
print(sorted5)


/*
 Задача 1.2 — Map с разными синтаксисами
 Дан массив [1, 2, 3, 4, 5]. Преобразуй в массив квадратов [1, 4, 9, 16, 25].
 Сделай 3 способами:

 Полный closure
 Shorthand names
 Trailing closure
 */

// фулл кложур
let numbers1 = [1, 2, 3, 4, 5]
var squared = numbers1.map({ (a: Int) -> Int in
    return a * a
})
print(squared)

// шортхэнд нэймс
var squared1 = numbers1.map({ $0 * $0 })
print(squared1)

// трэйлинг кложур
var squared2 = numbers1.map() { $0 * $0 }
print(squared2)

/*
 // Способ 2: Полный closure expression
 var sorted2 = numbers.sorted(by: { (a: Int, b: Int) -> Bool in
     // TODO
 })
 */


/*
 БЛОК 2: Capturing Values
 Задача 2.1 — Создай Counter
 Напиши функцию makeCounter() -> () -> Int, которая:

 Возвращает closure
 Каждый вызов closure увеличивает счётчик на 1
 Каждый вызов возвращает текущее значение

 swiftfunc makeCounter() -> () -> Int {
     // TODO
 }

 let counter1 = makeCounter()
 print(counter1())  // 1
 print(counter1())  // 2
 print(counter1())  // 3

 let counter2 = makeCounter()
 print(counter2())  // 1 (независимый счётчик!)
 print(counter1())  // 4 (продолжает свой)
 */

func makeCounter() -> () -> Int {
    var counter = 0
    var step = 1
    
    func incrementCounter() -> Int {
        counter += step
        return counter
    }

    return incrementCounter
}

let counter1 = makeCounter()
print(counter1())
print(counter1())
print(counter1())

let counter2 = makeCounter()
print(counter2())
print(counter1())

/*
 Задача 2.2 — Multiplier
 Создай функцию makeMultiplier(factor: Int) -> (Int) -> Int:

 Возвращает closure
 Closure принимает Int
 Возвращает число, умноженное на factor

 swiftfunc makeMultiplier(factor: Int) -> (Int) -> Int {
     // TODO
 }

 let multiplyByThree = makeMultiplier(factor: 3)
 print(multiplyByThree(5))   // 15
 print(multiplyByThree(10))  // 30

 let multiplyByFive = makeMultiplier(factor: 5)
 print(multiplyByFive(4))    // 20
 */


func makeMultiplier(factor: Int) -> (Int) -> Int {
    var resultTotal = 1
    
    func multiplier(factor1: Int) -> Int {
        resultTotal = factor * factor1
        return resultTotal
    }
    
    return multiplier
}

let multiplyByThree = makeMultiplier(factor: 3)
print(multiplyByThree(5))
print(multiplyByThree(10))

let multipleByFive = makeMultiplier(factor: 5)
print(multipleByFive(4))


/*
 БЛОК 3: Escaping Closures
 Задача 3.1 — Completion Handler
 swiftvar completionHandlers: [(String) -> Void] = []

 func performAsyncTask(completion: @escaping (String) -> Void) {
     // TODO: добавь completion в массив
 }

 class TaskManager {
     var name: String
     
     init(name: String) {
         self.name = name
     }
     
     func startTask() {
         performAsyncTask { result in
             // TODO: выведи "\(self.name): \(result)"
             // ВАЖНО: используй правильный capture для self!
         }
     }
 }

 let manager = TaskManager(name: "MyManager")
 manager.startTask()

 completionHandlers.first?("Task completed")
 // Должно вывести: "MyManager: Task completed"
 Вопрос: Почему нужен @escaping? Что произойдёт без него?
 */


