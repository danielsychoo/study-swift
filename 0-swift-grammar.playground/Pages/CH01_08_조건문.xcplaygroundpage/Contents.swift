import Foundation

/*
 CH01_08. 조건문
 */

/*
 조건문은 주어진 조건에 따라서 앱을 다르게 동작시키는 문법이다.
 */

// ---------- //

// ⛺️ if else 조건문
/*
 if [조건식] {
    [조건 만족시 로직]
 } else {
    [조건 불만족시 처리 로직]
 }
 */
let age = 20;

if age < 19 {
    print("미성년자 입니다.")
} else {
    print("성인 입니다.")
}

/*
 if [조건식1] {
    [조건1 만족시 로직]
 } else if [조건식2] {
    [조건2 만족시 로직]
 } else {
    [조건 불만족시 처리 로직]
 }
 */
let animal = "mouse"

if animal == "dog" {
    print("강아지 사료 주기")
} else if animal == "cat" {
    print("고양이 놀아 주기")
} else {
    print("넌 무슨 동물이니..?")
}

// ---------- //

// ⛺️ switch 조건문
/*
 switch [비교대상] {
    case [패턴1]:
        // [비교대상]이 [패턴1]과 일치할 경우 로직
    case [패턴2], [패턴3]:
        // [비교대상]이 [패턴2], [패턴3]과 일치할 경우 로직
    default:
        // [비교대상]이 일치하는 패턴이 없는 경우 로직
 }
 */
let color = "green"

switch color {
case "blue":
    print("파랑색 입니다.")
    
case "green":
    print("녹색 입니다.")
    
case "yellow":
    print("노란색 입니다.")
    
default:
    print("찾는 색상이 없습니다.")
}

let temperature = 30;

switch temperature {
case -20...9:
    print("추워요...")
    
case 10...14:
    print("선선하네요!")
    
case 15...25:
    print("따듯합니다ㅎ")
    
case 26...35:
    print("더워요!!!!")
    
default:
    print("무슨날씨죠 이게?")
    
}
