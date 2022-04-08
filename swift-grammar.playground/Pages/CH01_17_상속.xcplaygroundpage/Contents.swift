import Foundation
import os

/*
 CH01_17. 상속
 */
 
/*
 상속이란 class가 다른 class로 부터 method, property 및 다른 특성들을 상속받는 것을 말한다. 한 class가 다른 class를 상속할 때 상속 받는 class를 '자식 class', 'sub class'라고 지칭하고, 상속하는 class를 '부모 class', 'super class'라고 지칭한다.
 
 상속은 Swift에서 다른 타입들과 class를 구분하는 class만의 특징이다. Swift의 class는 부모 class로 부터 물려받은 method, property, subscript를 접근하거나 호출할 수 있다.

 자식 class는 overriding을 통해 물려받은 method 등을 자신만의 내용을 담아 재정의 할 수 있고, property의 값이 변경되었을 때 알려주는 property 감시자도 구현할 수 있다. 이때, 부모 class의 property가 storedType property이든 computedType property이든 자식 class에서 property 감시자로 구현이 가능하다.
 */

// ---------- //

/*
 1. ⛺️ 상속의 방식
 class [클래스 이름]: [부모클래스 이름] {
    [자식클래스 정의]
 }
 상속된 class를 정의할 때에는 위와 같은 문법을 이용한다. 상속받을 [부모클래스] 를 정하지 않은 class는 base class라고 부르며 우리가 일반적으로 정의했던 class들은 모두 base class라고 생각할 수 있다.
 */

// base class (상속 시 super class)
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "\(currentSpeed)mile/h 로 여행중 ⛰"
    }
    
    func makeNoise() {
        print("이동수단의 스피커 전원 켜기")
    }
}

// sub class
class Bicycle: Vehicle {
    var hasBasket = false
}

var bicycle = Bicycle()
bicycle.currentSpeed = 10.0 // Vehicle에서 정의된 property에 접근

print(bicycle.currentSpeed)
print(bicycle.description)
print(bicycle.hasBasket)

// ---------- //

/*
 2. ⛺️ method overriding
 sub class는 super class에서 정의된 property, method, subscript등을 그대로 사용할 수도 있지만, 자신만의 기능으로 override해서도 사용할 수 있다.
 
 overriding은 override 키워드를 통해 할 수 있는데, super class에 없는 method 등을 override하려 할 경우 컴파일러 오류가 나타난다. 반대로 super class에 있는 method 등을 override 키워드 없이 정의하려 해도 오류가 발생된다.
 */
class Train1: Vehicle {
    override func makeNoise() {
        print("뿌~~ 🚂")
    }
}

let train1 = Train1();
train1.makeNoise()

// 만일 super class에서 method 내에 정의된 부분까지 사용하기를 원한다면 super 키워드를 사용한다.
class Train2: Vehicle {
    override func makeNoise() {
        super.makeNoise() // super class 정의내용 사용
        print("뿌~~ 🚂")
    }
}

let train2 = Train2();
train2.makeNoise()

// ---------- //

/*
 3. ⛺️ property overriding
 property를 overriding한다는 것은 property 자체가 아닌 property의 getter, setter, property observer 등을 재정의하는 것을 의미한다.
 */
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return "기어 \(gear)단 " + super.description
    }
}

let car = Car();
car.currentSpeed = 30.0
car.gear = 2

print(car.description)

/*
 property overriding의 추가적인 내용
    - computedType property를 override한 property는 getter와 setter를 가질 수 있디.
    - sub class에서 override하려는 property는 super class의 property의 이름과 타입이 일치해야 한다.
    - super class에서 read/write으로 정의된 property를 sub class에서 read only로 override할 수는 없지만, super class에서 read only로 정의된 property를 sub class에서 read/write으로 override하는 것은 가능하다.
    - super class에 property observer가 없어도 sub class에서 property observer를 override할 수 있다.
 */

// property observer를 override하는 예시
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10) + 1
        }
    }
}

let automaticCar = AutomaticCar();
automaticCar.currentSpeed = 80.0

print(automaticCar.description)

// ---------- //

/*
 4. ⛺️ overriding 방지
 base class에서 property의 키워드 앞에 final을 작성함으로서 override를 방지할 수 있다. 만일 class 앞에 final을 작성한다면 해당 class를 super class로 사용할 수 없다.
 */
