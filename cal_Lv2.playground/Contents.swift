class Calculator{
       // 더하기
       func add(_ a: Double, _ b: Double) -> Double {
           return a + b
       }
       
       // 빼기
       func subtract(_ a: Double, _ b: Double) -> Double {
           return a - b
       }
       
       // 곱하기
       func multiply(_ a: Double, _ b: Double) -> Double {
           return a * b
       }
       
       // 나누기
        func divide(_ a: Double, _ b: Double) -> (result: Int, remainder: Double)? {
        guard b != 0 else {
            print("나누려는 수가 0 입니다")
            return nil
        }
        let result = Int(a / b)
        let remainder = a.truncatingRemainder(dividingBy: b)
        return (result, remainder)
    }
}

let calculator = Calculator()

var num1: Double = 10
var num2: Double = 3

print("Lv2")
print("\(num1) + \(num2) = \(calculator.add(num1, num2))")
print("\(num1) - \(num2) = \(calculator.subtract(num1, num2))")
print("\(num1) * \(num2) = \(calculator.multiply(num1, num2))")

if let resultDiv = calculator.divide(num1, num2) {
    print("\(num1) / \(num2) = \(resultDiv.result), 나머지는 : \(resultDiv.remainder)")
} else {
    print("나누기 Error.")
}
