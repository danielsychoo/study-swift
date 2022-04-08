import Foundation

/*
 CH01_20. 프로토콜 (protocol)
 */
 
/*
 프로토콜은 특정 역할을 하기 위한 method, property, 기타 요구사항 등의 청사진을 정의한다. structure, class, 열거형은 프로토콜을 채택해서 특정 기능을 실행하기 위한 프로토콜의 요구사항을 실제로 구현할 수 있다.
 
 protocol [이름] {
 
 }
 
 프로토콜을 정의하는 방법은 protocol 키워드와 이름을 적고, block 내부에 프로토콜의 요구사항을 정의하는 방식이다. 이때, 프로토콜이 요구하는 사항을 모두 충족하면 해당 타입이 채택한 프로토콜을 준수한다고 표현할 수 있다.
 */

// ---------- //

// ⛺️ 프로토콜 채택 방식
// 1. structure에 프로토콜 채택
// SomeProtocol1 정의
protocol SomeProtocol1 {
    
}

// SomeProtocol2 정의
protocol SomeProtocol2 {
    
}

// SomeStructure에 SomeProtocol 채택
struct SomeStructure1: SomeProtocol1 {
    
}

// 필요에 따라 ','를 이용해 두 개의 프로토콜도 채택 가능
struct SomeStructure2: SomeProtocol1, SomeProtocol2 {
    
}

// 2. class에 protocol 채택
/*
 class SomeClass: [Super class], [protocol1], [protocol2], ... {
 
 }
 
 class의 경우 super class가 존재한다면, super class를 먼저 넣고 이후에 protocol을 나열하는 방식으로 채택할 수 있다.
 */

// ---------- //

// ⛺️ 프로토콜 청사진 정의 및 준수 요구 방식
/*
 1. property 요구사항
 
 프로토콜은 자신을 채택한 타입이 어떤 property를 구현해야 하는지 요구할 수 있다.

 프로토콜이 property를 준수하도록 요구할 때에는 해당 property가 stored property인지, computed property인지를 지정하지 않고, property의 이름과 타입만 지정하면 된다.
 */
protocol SomeProtocolWithProperty {
    var name: Int { get set }
    var age: Int { get }
}
/*
 이때 해당 property가 읽기 전용인지 (위 코드에서 age), 읽기와 쓰기가 가능한지 (위 코드에서 name)를 'get'과 'set'을 이용해 지정할 수 있다.
 
 또한 프로토콜에서 property를 요구할 때에는 항상 'var' 키워드를 이용해 변수로 정의해 주어야 한다.
 */
protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}
/*
 프로토콜에서 type property를 요구하려면, 항상 'static' 키워드를 이용해 선언해야 한다.
 */

/*
 2. method 요구사항
 
 프로토콜은 자신을 채택한 타입에 method를 요구할 수 있는데, 이때 요구하는 method는 instance method와 type method 모두 가능하다.
 */
protocol SomeProtocolWithMethod {
    func someTypeMethod()
}
/*
 프로토콜에서 method를 정의할 때에는 중괄호나 method내의 로직은 필요없고, method에 필요한 parameter는 정의해야 한다. 이때, default parameter는 지정할 수 없다.
 */

/*
 3. initializer 요구사항
 
 프로토콜은 자신을 채택한 타입의 initializer도 요구할 수 있다.
 */
protocol SomeProtocolWithInit {
    init(someParameter: Int)
}
/*
 프로토콜에서 initializer를 정의할 때에는 method와 마찬가지로 중괄호나 initializer내의 로직은 필요없고, 생성자 키워드와 parameter만 지정해주면 된다.
 */
class SomeClass: SomeProtocolWithInit {
    required init(someParameter: Int) {
        
    }
}
/*
 예로 위 코드와 같이 SomeClass를 정의해주고 SomeProtocolWithInit을 채택한다면 'required' 키워드를 이용하여 initializer를 정의해주어야 한다.
 
 structure와 달리 class는 protocol의 요구를 준수할 때 'required' 키워드를 붙여주어야 하며, 만일 해당 class가 super class가 없는 class라면, 아래와 같이 final 키워드를 이용해 class를 정의하고 'required' 키워드는 생략할 수 있다.
 */
final class SomeFinalClass: SomeProtocolWithInit {
    init(someParameter: Int) {

    }
}

protocol FullyNames {
    var fullName: String { get set } // property 요구
    func printFullName() // method 요구
}

struct Person: FullyNames {
    var fullName: String

    func printFullName() {
        print(fullName)
    }
}
