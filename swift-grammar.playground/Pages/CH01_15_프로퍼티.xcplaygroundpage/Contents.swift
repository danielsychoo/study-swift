import Foundation

/*
 CH01_15. 프로퍼티
 */

/*
 프로퍼티는 클래스, 구조체, 열거형 등에 관련된 값으로서 instance에 소속된 변수 및 속성으로 생각할 수 있다.
 - 저장 프로퍼티 : instance의 변수 또는 상수
 - 연산 프로퍼티 : 특정 연산을 실행한 결과 값
 - 타입 프로퍼티 : 특정 instance에서 사용 되는 것이 아닌 특정 타입에서 사용되는 프로퍼티
 */

// ---------- //

// ⛺️ 저장 프로퍼티
/*
 1. 구조체의 저장 프로퍼티
 저장 프로퍼티는 클래스와 구조체에서 사용 가능하다.
 구조체 내의 name, gender값이 "탱이", "Male"로 저장된 것을 저장 프로퍼티라고 한다.
 */
struct Dog {
    var name: String
    let gender: String
}

var dog1 = Dog(name: "탱이", gender: "Male")
print(dog1)

dog1.name = "댕댕이"
//dog1.gender = "Female" // 상수이기 때문에 error

// 만일 구조체 instance를 상수로 선언한다면 해당 instance내의 저장 프로퍼티들 역시 함께 상수가 되므로 변경이 불가능하다.
let dog2 = Dog(name: "탱이", gender: "Male")
//dog2.name = "댕댕이" // 구조체 instance가 상수이므로 error

/*
 2. 클래스의 저장 프로퍼티
 구조체와 달리 클래스의 instance는 상수로 선언해도 내부의 저장프로퍼티가 변수로 정의되었다면 해당 프로퍼티를 수정할 수 있다. (구조체는 프로퍼티가 value 타입이기 때문에 수정이 불가능하지만, 클래스는 reference 타입이므로 수정이 가능하다.)
 */
class Cat {
    var name: String
    let gender: String
    
    init(name: String, gender: String) {
        self.name = name
        self.gender = gender
    }
}

let cat = Cat(name: "Yuna", gender: "Male")
cat.name = "Choo"
print(cat.name)

// ---------- //

// ⛺️ 연산 프로퍼티
/*
 1. 연산 프로퍼티
 연산 프로퍼티는 클래스, 구조체, 열거형에서 사용 가능하다.
 연산 프로퍼티는 값을 직접적으로 저장하지 않는 대신 getter와 setter를 사용해서 다른 프로퍼티와 값들을 사용할 수 있다.
 */
struct Stock {
    var averagePrice: Int
    var quantity: Int
    
    var purchasePrice: Int {
        get {
            return averagePrice * quantity
        }
        set(newPrice) {
            averagePrice = newPrice / quantity
        }
    }
}

var stock = Stock(averagePrice: 2300, quantity: 3)
print(stock)

stock.purchasePrice // get의 반환 값
stock.purchasePrice = 3000; // newPrice로 들어가 set 실행됨
stock // set으로 인해 averagePrice 변경 됨

/*
 만일 set없이 get만 설정하면 읽기전용으로 사용이 가능하다.
 또한 set의 paramete의 이름을 설정하지 않으면 default로 newValue가 된다.
 set {
    averagePrice = newValue / quantity
 }
 */

/*
 2. 프로퍼티 옵저버
 프로퍼티 옵저버는 프로퍼티의 값의 변화를 관찰하고 반응한다.
 만일 새로운 값이 기존의 값과 같더라도 프로퍼티 옵저버는 호출된다.
 즉 값이 무엇인지에 상관없이 set이 될 때마다 호출된다고 생각할 수 있다.
 프로퍼티 옵저버는 저장 프로퍼티, overriding이 된 저장 연산 프로퍼티에서만 사용이 가능하다.
 */
class Account {
    var credit: Int = 0 {
        willSet { // 값이 저장되기 직전 호출 default이름은 newValue
            print("잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정입니다.")
        }
        
        didSet { // 값이 저장된 직후 호출 default이름은 oldValue
            print("잔액이 \(oldValue)원에서 \(credit)원으로 변경되었습니다.")
        }
    }
}

var account = Account()
account.credit = 1000
account.credit = 500

// ---------- //

// ⛺️ 타입 프로퍼티
/*
 타입 프로퍼티는 instance 생성 없이 객체 내 프로퍼티에 접근을 가능하도록 하는 것으로 프로퍼티 타입 자체와 연결하는 것을 의미한다.
 타입 프로퍼티는 저장 프로퍼티와 연산 프로퍼티에서만 사용이 가능하며, static 키워드를 통해 선언한다.
 */
struct SomeStructure {
    static var storedTypeProperty = "Some value" // 스토어
    
    static var computedTypeProperty: Int { // 컴퓨디드
        return 1
    }
}

// instance 생성 전에도 접근할 수 있다.
SomeStructure.storedTypeProperty
SomeStructure.computedTypeProperty

// instance 생성 전에 값 변경도 가능하다.
SomeStructure.storedTypeProperty = "Hello"
SomeStructure.storedTypeProperty
