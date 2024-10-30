// 각 연산을 담당하는 클래스 정의
class AddOperation {
    func calculate(_ a: Double, _ b: Double) -> Double {
        return a + b
    }
}

class SubtractOperation {
    func calculate(_ a: Double, _ b: Double) -> Double {
        return a - b
    }
}

class MultiplyOperation {
    func calculate(_ a: Double, _ b: Double) -> Double {
        return a * b
    }
}

class DivideOperation {
    func calculate(_ a: Double, _ b: Double) -> (result: Double, remainder: Double)? {
        guard b != 0 else {
            print("나누려는 수가 0 입니다")
            return nil
        }
        let result = a / b
        let remainder = a.truncatingRemainder(dividingBy: b)
        return (result, remainder)
    }
}

// Calculator 클래스
class Calculator {
    private let addOperation = AddOperation()
    private let subtractOperation = SubtractOperation()
    private let multiplyOperation = MultiplyOperation()
    private let divideOperation = DivideOperation()

    func add(_ a: Double, _ b: Double) -> Double {
        return addOperation.calculate(a, b)
    }

    func subtract(_ a: Double, _ b: Double) -> Double {
        return subtractOperation.calculate(a, b)
    }

    func multiply(_ a: Double, _ b: Double) -> Double {
        return multiplyOperation.calculate(a, b)
    }

    func divide(_ a: Double, _ b: Double) -> (result: Double, remainder: Double)? {
        return divideOperation.calculate(a, b)
    }
}

// 테스트
let calculator = Calculator()

print("10 + 5 = \(calculator.add(10, 5))")

print("10 - 5 = \(calculator.subtract(10, 5))")

print("10 * 5 = \(calculator.multiply(10, 5))")

if let resultDiv = calculator.divide(10, 0) {
    print("10 / 3 = \(resultDiv.result), 나머지는 : \(resultDiv.remainder)")
} else {
    print("나누기 Error.")
}
