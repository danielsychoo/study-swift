import Foundation

/*
 CH01_21. 익스텐션 (extension)
 */
 
/*
 extension은 Swift의 강력한 기능중 하나로 기존의 class, structure, 열거형, protocol 타입에 새로운 기능을 추가하는 기능이다.
 
 extension SomeType {
    [추가 기능]
 }
 
 extension은 키워드를 이용해 위와 같은 방식으로 사용하며, 타입에 추가할 수 있는 기능은 다음과 같다.
 - computed type property, computed instance property
 - type method, instance method
 - initializer
 - sub script
 - 중첩 타입
 - 특정 protocol을 준수할 수 있도록 기능 추가
 
 extension은 새로운 기능을 추가할 수는 있으나, 기존의 기능을 override 할 수는 없다.
 */

// ---------- //

// ⛺️ 자주 사용되는 extension 방식
// 1. computed property 추가
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
    
    var isOdd: Bool {
        return self % 2 != 0
    }
}
/*
 위 코드는 extension을 이용해 Int 타입에 짝수(isEven) 혹은 홀수(isOdd)를 확인할 수 있는 기능을 추가하는 코드이다. extension을 추가하면 Int타입의 어떠한 instance에서도 사용가능하다.
 */
var number = 3
print("짝수인가요?? \(number.isEven)")
print("홀수인가요?? \(number.isOdd)")
/*
 따라서 Int형 variable에서 isEven과 isOdd를 사용할 수 있다.
 
 extension은 이처럼 computed property는 추가할 수 있지만, stored property는 추가할 수 없다. 또한 타입에 정의되어있는 기존의 property에 property observer를 추가하는 것도 불가능하다.
 */

// 2. method 추가
extension String {
    func convertToInt() -> Int? {
        return Int(self)
    }
}
/*
 위 코드는 extension을 이용해 String 타입을 Int 타입으로 변환하는 method인 convertToInt를 추가한 코드이다.
 */
var string = "0"
if let result = string.convertToInt() {
    print("해당 문자열을 Int로 변환하면 \(result) 입니다.")
}
/*
 이때, 위 예시는 Optional 값을 반환하므로 if let을 이용해 optional binding을 사용해야 한다.
 */
