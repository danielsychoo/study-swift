import Foundation

/*
 CH01_09. 반복문
 */

/*
 반복문은 반복적으로 코드가 실행되게 만드는 구문을 말한다.
 - for-in: 일정 횟수만큼 반복시킬 때
 - while: 조건을 만족할때까지 반복시킬 때
 - repeat-while: while과 동일하나 최소 1번은 무조건 실행되기를 원할 때
 */

// ---------- //

// ⛺️ for-in 반복문
/*
 for [루프상수] in [순회대상] {
    [실행 로직]
 }
 */
for i in 1...5 {
    print(i)
}

let nums = [1,2,3,4,5]
for num in nums {
    print(num)
}

// ---------- //

// ⛺️ while 반복문
/*
 while [조건식] {
    [실행 로직]
 }
 */
var number = 5

while(number < 10) {
    print(number)
    number += 1
}

// ---------- //

// ⛺️ repeat-while 반복문
/*
 repeat {
    [실행 로직]
 } while [조건식]
 */
var x = 6

repeat {
    x += 2
} while x < 5

print(x) // 조건이 false여도 최소 1번은 실행되었기 때문
