import Foundation

/*
 CH01_25. 클로저 (Closure)
 */

// ⛺️ Swift에서 Closure란 ?
/*
 Closure는 참조타입이고, 코드에서 전달 및 사용할 수 있는 독립 기능 블록이며, 일급 객체의 역할을 할 수 있는 함수를 말한다.
 
 여기서 일급 객체란 전달 인자로 보낼 수 있고, 변수 또는 상수 등으로 저장하거나 전달할 수 있으며, 함수의 반환 값이 될 수도 있는 객체를 의미한다.

 // Named Closure
 func hello1() {
    print("안녕하세요")
 }

 // Unnamed Closure
 let hello2 = { print("안녕하세요") }
 
 Closure는 Named Closure와 Unnamed Closure로 구분되는데, 그 중 Unnamed Closure (익명함수)를 일반적으로 Closure라고 표현한다.
 
 { ([매개 변수]) -> [리턴 타입] in [실행 구문] }
 
 Closure는 Unnamed Closure이기 때문에 func 키워드를 사용하지 않으며, 위와 같은 문법을 사용한다.
 
    - ([매개 변수]) -> 리턴 타입 -- Closure head
    - [실행 구문] -- Closure body
 
 Closure는 'in' 키워드를 기준으로 Closure head와 Closure body로 구분된다.
 */

// ---------- //

// ⛺️ Closure의 선언 및 사용
// 1. parameter와 return type이 없는 Closure
let hello1 = { () -> () in
    print("hello")
}
hello1() // "hello"

// 2. parameter와 return type이 있는 Closure
let hello2 = { (name: String) -> String in
    return "Hello, \(name)"
}
//hello2(name: "Yuna") // error
hello2("Yuna") // "Hello, Yuna"
/*
 이때, 주의할 점은 일반적인 함수와 달리 Closure는 parameter label을 사용하지 않고, parameter name만 사용한다. 따라서 Closure에서 parameter를 넘겨줄 때에는 parameter의 값만 넘겨준다.
 */

// 3. Closure를 parameter로 전달하는 함수
let closure1 = { () -> () in
    print("클로저 실행")
}

func doSomething(_ closure: () -> ()) {
    closure()
}

doSomething(closure1) // "클로저 실행"

// 4. 함수의 반환타입으로 Closure 사용
let closure2 = { () -> () in
    print("클로저 실행2")
}
func handleReturnClosure() -> () -> () {
    return { closure2() }
}
handleReturnClosure()() // "클로저 실행2"

// ---------- //

// ⛺️ Trailing closure (후행 클로저)
/*
 Closure가 조금 길어지거나, 가독성이 떨어진다고 생각될 때는 Trailing closure를 고려해볼 수 있다.
 
 함수의 parameter로 여러개의 Closure를 전달하는 경우, Trailing closure는 가장 마지막 parameter로 전달되는 closure에만 가능하다.
 */
// 1. parameter와 return이 없는 경우
/*
 func doSomething(_ closure: () -> ()) {
     closure()
 }
 */
doSomething() {
    print("hello trailing closure1")
}

doSomething {
    print("hello trailing closure2")
}
/*
 parameter와 return이 없는 경우 parameter와 return, in이 모두 생략 가능하다. 더 나아가 doSomething과 같이 단 하나의 Closure만 parameter로 전달하는 경우 '()' 까지도 생략할 수 있다.
 */

// ---------- //

// ⛺️ Closure 간소화
// 기본 함수 방식
func doSomething2(closure: (Int, Int, Int) -> Int) {
    closure(1,2,3)
}

// 기본 Closure 방식
doSomething2(closure: { (a, b, c) in
    return a+b+c
})

// 약식 인수를 이용해 in 키워드와 매개변수 생략
doSomething2(closure: {
    return $0+$1+$2
})

// return 만 있으므로 return 생략
doSomething2(closure: {
    $0+$1+$2
})

// tariling closure 방식으로 변환
doSomething2() {
    $0+$1+$2
}

// 하나의 parameter이므로 () 생략
doSomething2 {
    $0+$1+$2
}

