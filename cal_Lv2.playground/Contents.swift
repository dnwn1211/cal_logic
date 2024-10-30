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
        func divide(_ a: Int, _ b: Int) -> (result: Int, remainder: Int)? {
        guard b != 0 else {
            print("나누려는 수가 0 입니다")
            return nil
        }
        let result = a / b
        let remainder = a % b
        return (result, remainder)
    }
}

let calculator = Calculator()

let sum = calculator.add(10,5)
print("10+5 = \(sum)")

let sub = calculator.subtract(10, 5)
print("10 - 5 = \(sub)")

let mul = calculator.multiply(10, 5)
print("10 * 5 = \(mul)")

if let div = calculator.divide(10, 3) {
    print("10 / 3= \(div)")
} else {
    print("error")
}
