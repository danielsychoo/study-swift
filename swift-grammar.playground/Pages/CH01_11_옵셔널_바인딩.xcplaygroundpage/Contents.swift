import Foundation

/*
 CH01_11. 옵셔널 바인딩
 */

/*
 Optional을 해제하는 두 가지 방법
 1. 명시적 해제
    1-1. 강제 해제
    1-2. 비 강제 해제 (Optional binding)
 2. 묵시적 해제
    2-1. 컴파일러에 의한 자동 해제
    2-2. Optional의 묵시적 해제
 */

// ---------- //

// ⛺️ 명시적 해제
// 1. 강제 해제
/*
 Optional을 강제로 해제하는 방법은 변수의 뒤에 '!'를 붙여주는 방법이다.
 하지만 해제의 결과가 nil일 경우 crash가 발생되므로 위험한 방법이다.
 */
var number: Int? = 5
print(number)
print(number!)

// 2. 비 강제 해제 (Optional binding)
/*
 if문을 이용해 Optional binding을 하게 되면
 if block 내에서만 추출 값을 사용할 수 있는 것과 달리
 guard문을 이용해 Optional binding을 하게 되면
 추출 값을 해당 함수 내 guard문 이후에서 계속 사용이 가능하다.
 */

// 2-1. if문을  이용한 Optional binding
if let result = number {
    print(result)
} else {
    print("🙄nil")
}

// 2-2. guard문을 이용한 Optional binding
// guard문은 true이면 guard문 실행, false이면 else구문 실행 후 흐름을 종료시키는 문법
func test() {
    let number: Int? = 2
    guard let result = number else { return }
    
    print(result)
}

test()

// ---------- //

// ⛺️ 묵시적 해제
// 1. 컴파일러에 의한 자동 해제
// 비교연산시 컴파일러가 Optional을 자동으로 해제시킴
let value: Int? = 10;

if value == 10 {
    print("value는 10")
} else {
    print("value는 10이 아님")
}

// 2. Optional의 묵시적 해제
// Int 타입을 확신한다고 '!'를 붙여줌으로서 Optional이 묵시적으로 해제됨
let string = "100"
var stringToInt: Int! = Int(string)
print(stringToInt + 1)
