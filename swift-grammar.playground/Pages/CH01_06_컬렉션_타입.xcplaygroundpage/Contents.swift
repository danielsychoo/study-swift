import Foundation

/**
 *  CH01_06. 컬렉션 타입
 */

/**
 *  컬렉션 타입은 데이터들의 집합 묶음을 의미한다.
 *  - Array : 데이터 타입의 값들을 순서대로 지정하는 리스트
 *  - Dictionary : 순서없이 키(Key)와 값(Value) 한 쌍으로 데이터를 저장하는 컬렉션 타입
 *  - Set : 같은 데이터 타입의 값을 순서없이 저장하는 리스트
 *  (❗️Set은 Array와 달리 순서가 없고, 중복된 값을 허용하지 않는다.)
 */

// ---------- //

// ⛺️ Array
// 1. 기본적인 Array 선언방식
var numbers: Array<Int> = Array<Int>()

// 2. 축약된 Array 선언방식 두 가지 (실무에서는 이 방식을 더 많이 사용)
var alphabets = [String]()
var names: [String] = []

// Array끝에 요소를 추가할때에는 Array.append([value])
numbers.append(1)
numbers.append(2)
numbers.append(3)

// Array내 요소 접근은 Array[index]
numbers[0]
numbers[1]

// Array 중간 요소 삽입은 Array.insert([value], at: [index])
numbers.insert(4, at: 2)

// Array 요소 제거는 Array.remove(at: [index])
numbers.remove(at: 0)
numbers

// ---------- //

// ⛺️ Dictionary
// 1. 기본적인 Dictionary 선언방식
var dic1: Dictionary<String, Int> = Dictionary<String, Int>()

// 2. 축약된 Dictionary 선언방식 (실무에서는 이 방식을 더 많이 사용)
var dic2: [String: Int] = [:]
var dic: [String: Int] = ["Dog": 1]

// Dictionary에 요소를 추가할 때에는 Dictionary[key] = value
dic["Cat"] = 3
dic["Mouse"] = 5
dic

// Dictionary내 요소의 값을 수정할 때에는 Dictionary[targetKey] = value
dic["Mouse"] = 6
dic

// Dictionary내 요소 제거는 Dictionary.removeValue(forkey: [targetKey])
dic.removeValue(forKey: "Mouse")
dic

// ---------- //

// ⛺️ Set
// 1. Set 선언방식 (Set은 축약된 선언방식이 없다.)
var set: Set = Set<Int>()

// Set에 요소를 추가할 때에는 Set.insert([value])
set.insert(10)
set.insert(20)
set.insert(30)
set.insert(30)
set.insert(30)
set // 순서보장되지 않으며, 중복(30) 비허용

// Set의 요소 제거는 Set.remove([value])
set.remove(20)
set
