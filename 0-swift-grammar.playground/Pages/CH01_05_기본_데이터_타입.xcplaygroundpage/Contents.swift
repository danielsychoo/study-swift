import Foundation

/**
 *  CH01_05. 기본 데이터 타입
 */

/**
 *  Int -- 64bit 정수형
 *  UInt -- 부호가 없는 64bit 정수형
 *  Float -- 32bit 부동 소수점
 *  Double -- 64bit 부동 소수점
 *  Bool -- true, false 값
 *  Character -- 문자
 *  String -- 문자열
 *  Any -- 모든 타입을 지칭하는 키워드
 */

// ---------- //

// Int -- 64bit 정수형
var someInt: Int = -100
someInt = 100

// UInt -- 부호가 없는 64bit 정수형
var someUInt: UInt = 200

// Float -- 32bit 부동 소수점
var someFloat: Float = 1.1
someFloat = 1
print(someFloat)

// Double -- 64bit 부동 소수점
var someDouble: Double = 1.1
someDouble = 1

// Bool -- true, false 값
var someBool: Bool = true
someBool = false

// Character -- 문자
var someCharacter: Character = "가"
someCharacter = "A"
someCharacter = "👏🏻"

// String -- 문자열
var someString: String = "안녕하세요 👏🏻"

// 타입 추론
var number = 10
