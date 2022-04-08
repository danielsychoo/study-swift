import Foundation

/**
 *  CH01_07. 함수 사용법
 */

/**
 * 함수는 작업의 가장 작은 단위이자 코드의 집합이다.
 * 하나의 함수는 하나의 작업만을 하는 것이 이상적이다.
 * 반복되는 작업을 함수로 정의하고 필요할때마다 호출함으로서
 * 코드의 중복을 피할 수 있다.
 *
 * func [함수명]([파라미터 이름]: [데이터타입]) -> [반환 타입] {
 *  return [반환 값]
 * }
 */

// ---------- //

// ⛺️ 기본적인 함수
// parameter가 없는 경우
func hello() -> String {
    return "Hello 🙌🏻"
}
hello()

// parameter가 있는 경우
func sum(a: Int, b: Int) -> Int {
    return a + b
}
sum(a: 5, b: 3)

// 반환값이 없으면 Void 또는 명시하지 않아도 된다.
func printName() {}

// 함수 정의시 parameter의 defaultValue를 설정할 수 있다.
func greeting(friend: String, me: String = "Choo") {
    print("Hello, \(friend)! I'm \(me)")
}
greeting(friend: "Yuna")

// ---------- //

// ⛺️ 전달인자 레이블 사용
/**
 * func [함수이름](
 *    [전달인자 레이블] [매개변수 이름]: [매개변수 타입],
 *    [전달인자 레이블] [매개변수 이름]: [매개변수 타입],
 *    ...
 *  ) -> [반환 타입] {
 *      return [반환 값]
 * }
 */

func sendMessage(from myName: String, to name: String) -> String {
    return "Hello \(name)! I'm \(myName)"
}
sendMessage(from: "Choo", to: "Yuna")

// ---------- //

// ⛺️ 언더스코어 사용 (와일드카드 식별자)
func sendMessage(_ name: String) -> String {
    return "Hello \(name)"
}
sendMessage("Yuna")

// ---------- //

// ⛺️ 가변 매개변수 사용 (...)
/**
 * 몇 개의 parameter가 들어올지 모를 때 사용한다.
 *
 * 이때, 한 개의 함수는 한 개의 가변 매개변수만 사용할 수 있으며,
 * 가변매개변수로 들어온 값은 배열로 처리된다.
 */

func sendMessage(me: String, friends: String...) -> String {
    return "Hello \(friends)! I'm \(me)"
}
sendMessage(me: "Choo", friends: "Dog", "Cat", "Mouse")
