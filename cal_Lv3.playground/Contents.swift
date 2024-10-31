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
    func calculate(_ a: Double, _ b: Double) -> (result: Int, remainder: Double)? {
        guard b != 0 else {
            print("나누려는 수가 0 입니다")
            return nil
        }
        let result = Int(a / b)  // 정수 부분만 반환
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

    func divide(_ a: Double, _ b: Double) -> (result: Int, remainder: Double)? {
        return divideOperation.calculate(a, b)
    }
}

// 테스트
let calculator = Calculator()

var num1: Double = 10
var num2: Double = 3

print("Lv3")
print("\(num1) + \(num2) = \(calculator.add(num1, num2))")
print("\(num1) - \(num2) = \(calculator.subtract(num1, num2))")
print("\(num1) * \(num2) = \(calculator.multiply(num1, num2))")

if let resultDiv = calculator.divide(num1, num2) {
    print("\(num1) / \(num2) = \(resultDiv.result), 나머지는 : \(resultDiv.remainder)")
} else {
    print("나누기 Error.")
}
