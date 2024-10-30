// 추상화 프로토콜인 AbstractOperation 프로토콜 정의
protocol AbstractOperation {
    func calculate(_ a: Double, _ b: Double) -> Double
}

// 각 연산을 담당하는 클래스 정의
//+
class AddOperation: AbstractOperation {
    func calculate(_ a: Double, _ b: Double) -> Double {
        return a + b
    }
}

//-
class SubtractOperation: AbstractOperation {
    func calculate(_ a: Double, _ b: Double) -> Double {
        return a - b
    }
}

//*
class MultiplyOperation: AbstractOperation {
    func calculate(_ a: Double, _ b: Double) -> Double {
        return a * b
    }
}

// (/),(%)
class DivideOperation: AbstractOperation {
    func calculate(_ a: Double, _ b: Double) -> Double {
        guard b != 0 else {
            print("나누려는 수가 0 입니다")
            return 0.0
        }
        return Double(Int(a / b))
    }
    
    func calculateWithRemainder(_ a: Double, _ b: Double) -> (result: Double, remainder: Double)? {
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
    private var addOperation: AbstractOperation
    private var subtractOperation: AbstractOperation
    private var multiplyOperation: AbstractOperation
    private var divideOperation: DivideOperation // 타입을 DivideOperation으로 지정하여 나머지 연산 가능

    init(addOperation: AbstractOperation, subtractOperation: AbstractOperation, multiplyOperation: AbstractOperation, divideOperation: DivideOperation) {
        self.addOperation = addOperation
        self.subtractOperation = subtractOperation
        self.multiplyOperation = multiplyOperation
        self.divideOperation = divideOperation
    }

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
        return divideOperation.calculateWithRemainder(a, b)
    }
}

// 테스트
let calculator = Calculator(
    addOperation: AddOperation(),
    subtractOperation: SubtractOperation(),
    multiplyOperation: MultiplyOperation(),
    divideOperation: DivideOperation()
)

print("10 + 5 = \(calculator.add(10, 5))")
print("10 - 5 = \(calculator.subtract(10, 5))")
print("10 * 5 = \(calculator.multiply(10, 5))")

if let resultDiv = calculator.divide(10, 0) {
    print("10 / 3 = \(resultDiv.result), 나머지는 : \(resultDiv.remainder)")
} else {
    print("나누기 Error.")
}
