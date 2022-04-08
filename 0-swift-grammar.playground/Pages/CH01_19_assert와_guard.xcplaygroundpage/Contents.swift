import Foundation

/*
 CH01_19. assert와 guard
 */
 
/*
 - assert
    - 특정 조건을 체크하고, 조건이 성립되지 않으면 메세지를 출력하게 할 수 있는 함수
    - assert 함수는 디버깅 모드에서만 동작하고, 주로 디버깅 중 조건의 검증을 위하여 사용한다.
 - guard
    - 뭔가를 검사하여 그 다음에 오는 코드를 실행할지 말지 결정하는 함수
    - guard 문에 주어진 코드문이 거짓일 때 구문이 실행된다.
 */

// ---------- //

// ⛺️ assert
/*
 assert([조건], [조건 미성립시 출력할 메세지])
 */
var value = 0
assert(value == 0, "첫번째 assert 0이 아닙니다.") // 조건 성립되어 통과

//value = 2
//assert(value == 0, "두번째 assert 0이 아닙니다.") // 조건 미성립되어 출력

// ---------- //

// ⛺️ guard
/*
 guard [조건] else {
    [조건 미성립시 else구문 실행]
    // 이때, return 또는 throw 또는 break을 통해 이후 코드가 실행되지 않도록 방어한다.
 }
 */

// 1. 기본적인 guard 방식
func guardTest(value: Int) {
    guard value == 0 else { return }
    print("guard문을 통과했습니다.")
}

guardTest(value: 0) // 조건 성립 guard문 통과
guardTest(value: 2) // 조건 미성립 guard문에서 함수종료

// 2. guard를 이용한 optional binding
func guardOptionalBindingTest (value: Int?) {
    guard let value = value else { return }
    print("통과한 value는 \(value) 입니다.")
}

guardOptionalBindingTest(value: 1) // 조건 성립 guard문 통과
guardOptionalBindingTest(value: nil) // 조건 미성립 guard문에서 함수종료
