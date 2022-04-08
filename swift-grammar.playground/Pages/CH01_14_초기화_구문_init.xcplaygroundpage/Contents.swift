import Foundation

/*
 CH01_14. 초기화 구문 init
 */

/*
 초기화(Initialization)란, 클래스 또는 열거형의 instance를 사용하기 위한 준비과정을 말한다. instance의 초기화를 담당하는 것은 initializer인데 우리말로 생성자라고 표현한다.
 초기화를 하는 이유는 instance의 property마다 초기값을 설정해주고, 새 instance를 사용하기 전에 필요한 설정들을 하기 위함이다.
 */

// ---------- //

// ⛺️ init 문법
/*
 init([매개변수]: [타입], ...) {
    [property 초기화]
    [초기설정 로직]
 }
 */

/*
 class [클래스 이름] {
     [property 와 method]
     
     init() { }
 }
 */

// ---------- //

// ⛺️ init 사용 예시
class User1 {
    var nickname: String
    var age: Int
    
    init(nickname: String, age: Int){
        self.nickname = nickname
        self.age = age
    }
}

// 이전 클래스 공부시 parameter를 넘겨주지 않았던 것과 달리 nickname과 age를 parameter로 받아 initialize 해주어야 하므로 parameter를 받게 된다.
var user1 = User1(nickname: "Choo", age: 33)
print(user1.nickname)
print(user1.age)

// 클래스 내 property를 모두 parameter로 받아 초기화해주는 것이 아닌, 고정된 값으로의 초기화도 가능하다.
class User2 {
    var nickname: String
    var age: Int
    
    init(age: Int){
        self.nickname = "Choo"
        self.age = age
    }
}

var user2 = User2(age: 33)
print(user2.nickname)
print(user2.age)

// ---------- //

// ⛺️ deinit
/*
 클래스에는 initialize의 반대 역할인 deinit을 사용할 수도 있다.
 deinit은 instance가 더 이상 필요하지 않아 메모리에서 소멸될 때 실행된다.
 즉, React의 lifecycle에서 componentWillUnmount에 대응된다.
*/
class User3 {
    var nickname: String
    var age: Int
    
    init(age: Int){
        self.nickname = "Choo"
        self.age = age
    }
    
    deinit {
        print("deinit이 실행됨")
    }
}

var user3: User3? = User3(age: 33)
user3 = nil // nil이 될 때 deinit 실행
