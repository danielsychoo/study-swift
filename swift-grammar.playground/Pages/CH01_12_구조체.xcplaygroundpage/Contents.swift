import Foundation

/*
 CH01_12. 구조체
 */

/*
 Swift에는 구조체와 클래스가 공존하고 있다. 구조체와 클래스는 프로그래머가 데이터를 용도에 맞게 표현하고자 할 때 용이하다. 또한 구조체와 클래스는 property와 method를 사용해 구조화된 데이터와 기능을 가질 수 있기 때문에 하나의 새로운 사용자정의 데이터타입을 만들어준다고 볼 수 있다.
 
    - 구조체 : instance가 값 타입
    - 참조체 : instance가 참조 타입
 
 이 구조체와 클래스는 문법과 사용방식이 거의 같지만 다른 점이 있는데,구조체의 instance는 값 타입이고, 클래스의 instance는 참조 타입이라는 점이다.
 */

// ---------- //

// ⛺️ 구조체의 문법
/*
 struct [구조체 이름] {
    [property 와 method]
    // property와 method는 구조체의 member
    // member변수 -> property
    // member함수 -> method
 }
 */

// ⛺️ 구조체 정의
struct User {
    var nickname: String // property
    var age: Int // property
    
    func getInformation() { // method
        print("nickname: \(nickname), age: \(age)")
    }
}

// 구조체 instance 생성 (parameter는 구조체의 property)
var user = User(nickname: "Choo", age: 33)
print(user)

// ⛺️ property 접근
print(user.nickname)
print(user.age)

// property의 값 변경
user.nickname = "Yuna"
print(user.nickname)

// method 접근
user.getInformation()
