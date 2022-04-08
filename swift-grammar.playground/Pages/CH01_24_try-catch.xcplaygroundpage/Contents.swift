import Foundation

/*
 CH01_24. 에러처리 (Error handling)
 */
 
/*
 에러 처리란, 프로그램 내에서 에러가 발생한 상황에 대해 대응하고 이를 복구하는 과정을 뜻한다.
 
 Swift에서는 runtime error가 발생한 경우 이를 처리하기 위한 발생(throwing), 감지(catching), 전파(propagating), 조작(manipulating) 을 지원하는 1급 클래스를 지원한다.
 */

// ---------- //

// ⛺️ 기본적인 error 모델 정의 및 발생 방식
/*
 Swift에서 error는 error protocol을 따르는 타입의 값으로 표현된다. error protocol은 요구사항이 없는 빈 protocol이지만, error를 표현하기 위해서는 이 protocol을 채택해야 한다.
 
 Swift의 enum type은 오류 원인을 나누고 해당 오류의 특성에 대한 추가정보를 전달하는 모델을 만드는데 적합하다.
 */

enum PhoneError: Error {
    case unknown
    case lowBattery(batteryLevel: Int)
}
/*
 예를들어 스마트폰에서 나타낼 에러를 정의한다면 이렇게 enum type을 통해 error의 종류를 정의하는 것이 가장 일반적인 방법이다.
 */

//throw PhoneError.lowBattery(batteryLevel: 20)

/*
 그리고 error가 발생되었다는 것은 정상적인 실행이 불가능하다는 의미이므로, throw를 통해 error를 발생시킨다.
 */

// ---------- //

// ⛺️ error handling을 위한 4가지
// 1. 함수에서 guard문을 통한 error throw
/*
 func [함수명]([매개변수]: [매개변수타입]) throws -> [반환타입] {
 
 }
 
 함수를 정의할 때 throws 키워드를 붙임으로서 함수 내에서 throw를 처리할 수 있고, 이렇게 throws를 붙인 함수를 쓰로잉 함수(throwing function) 라고 부른다.
 */
func checkPhoneBatteryStatus(batteryLevel: Int) throws -> String {
    guard batteryLevel != -1 else { throw PhoneError.unknown }
    guard batteryLevel > 20 else { throw PhoneError.lowBattery(batteryLevel: 20)}
    
    return "배터리 상태가 정상입니다."
}
/*
 위 함수 checkPhoneBatteryStatus는 batteryLevel을 parameter로 받고, 그 값을 비교하여 20 이하인 경우 PhoneError.lowBattery 에러를 throw하고, -1일 경우 PhoneError.unknown 에러를 throw하는 함수이다.
 
 guard 문은 조건이 불만족일 경우 else로 빠지므로, 이를 이용해 error를 발생시키는 방식이다. 만일 모든 조건이 만족되었다면 guard문을 모두 통과하여 return 문에 도착할 것이다.
 */

// 2. do-catch 문을 통한 error handling
/*
 do {
    try [오류 발생 가능성이 있는 코드]
 } catch [오류 패턴] {
    [처리 코드]
 }
 
 Swift의 do-catch문은 다른 언어에서 사용하는 try-catch와 동일한 역할을 담당한다. 다만 차이점은 아래 두 가지와 같다.
 - do block 내부에서 try 키워드를 작성하고 그 이후에 로직을 작성한다는 점
 - catch 뒤에 각 [오류 패턴]을 작성한다는 점
 */
do {
    try checkPhoneBatteryStatus(batteryLevel: -1)
} catch PhoneError.unknown {
    print("알 수 없는 에러입니다.")
} catch PhoneError.lowBattery(let batteryLevel) {
    print("\(batteryLevel)%. 배터리가 부족합니다.")
} catch {
    print("그 외 오류 발생 : \(error)") // 다른 catch가 아닐 경우
}

// 3. try? 를 통한 오류의 optional 처리
/*
 'try?'를 이용하면 오류를 optional 값으로 변환해서 처리할 수 있다. try? 표현을 통해 동작하던 코드가 오류를 던지면 그 코드의 반환값은 nil이 된다.
 
 반대로 오류를 던지지 않으면 결과값은 optional 값으로 반환된다.
 */
let status1 = try? checkPhoneBatteryStatus(batteryLevel: -1)
print(status1) // nil

let status2 = try? checkPhoneBatteryStatus(batteryLevel: 30)
print(status2) // Optional("배터리 상태가 정상입니다.")

// 4. try! 를 통한 오류의 forced unwrapping
/*
 'try!'는 오류가 발생하지 않을 것이라고 확신할 수 있을 때 사용하며, 만일 에러가 발생된다면 runtime error가 발생된다.
 */
let status3 = try! checkPhoneBatteryStatus(batteryLevel: -1)
print(status3) // runtime error

let status4 = try! checkPhoneBatteryStatus(batteryLevel: 30)
print(status4) // "배터리 상태가 정상입니다."
