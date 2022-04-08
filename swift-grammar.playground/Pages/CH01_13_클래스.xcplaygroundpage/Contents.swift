import Foundation

/*
 CH01_13. 클래스
 */

/*
 클래스의 방식은 구조체와 큰 차이가 없다. 다만, 구조체에 비해 instance가 참조 타입이라는 점만 차이가 있다.
 */

// ---------- //

// ⛺️ 클래스의 문법
/*
 class [클래스 이름] {
    [property 와 method]
    // property와 method는 구조체의 member
    // member변수 -> property
    // member함수 -> method
 }
 */

// ⛺️ 클래스 정의
class Dog {
    var name: String = ""
    var age: Int = 0

    func getInformation() {
        print("name: \(name), age: \(age)")
    }
}

// ⛺️ 클래스 instance 생성
var dog = Dog()

dog.name = "탱이"
dog.age = 4

print(dog.name)
print(dog.age)

dog.getInformation()
