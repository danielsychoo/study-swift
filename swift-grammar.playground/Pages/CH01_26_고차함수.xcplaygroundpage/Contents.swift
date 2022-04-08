import Foundation

/*
 CH01_26. 고차함수 (Higher order function)
 */

/*
 고차함수는 다른 함수를 parameter로 받거나 함수 실행의 결과를 함수로 반환하는 함수를 뜻한다. Swift의 함수는 1급 객체이기 때문에 함수의 parameter로 전달할 수 있고, 힘수를 함수의 결과값으로 반환할 수도 있다.
 
 Swift에서 제공하는 고차함수는 'map', 'filter', 'reduce' 세가지 이며, 모두 collection type에 구현되어 있다.
 */

// ⛺️ map
/*
 컨테이너 내부의 기존 데이터를 변형하여 새로운 컨테이너를 생성한다.
 */
let numbers = [0, 1, 2, 3]
let mappedArray = numbers.map { (number) -> Int in
    return number * 2
}
print(mappedArray) // "[0, 2, 4, 6]"

// ⛺️ filter
/*
 컨테이너 내부의 데이터를 걸러내어 새로운 컨테이너를 추출한다.
 */
let intArray = [10, 5, 20, 13, 4]
let filteredArray = intArray.filter { $0 > 5 }
print(filteredArray) // "[10, 20, 13]"

// ⛺️ reduce
/*
 컨테이너 내부의 요소를 하나로 통합시켜주는 고차함수
 */
let someArray = [1, 2, 3, 4, 5]
let reducedResult = someArray.reduce(0) { (acc: Int, cur: Int) -> Int in
    print("\(acc) + \(cur)")
    return acc + cur
}
print(reducedResult) // "15"
