import Foundation

/*
 CH01_22. 열거형 (enum type)
 */
 
/*
 열거형은 연관성이 있는 값을 모아놓은 것을 말한다. 예를들어 봄, 여름, 가을, 겨울을 계절이라는 연관된 카테고리로 묶을 수 있는 것처럼 프로그래밍에서도 연관된 것들을 묶을 때 열거형을 사용한다.
 
 enum [열거형 이름] {
    case [묶을 것]
    case [묶을 것]
    ...
 }
 
 열거형은 'enum' 키워드를 사용해 정의하고, block 내에 case 키워드를 이용해 각각의 묶을 것들을 선언해준다.
 */

// ---------- //

// ⛺️ 열거형 선언 및 사용방식
// 1. 기본적인 사용방식
enum CompassPoint {
    case north
    case south
    case east
    case west
}
/*
 예로 위와같은 CompassPoint 열거형을 정의하면, 내부에 방향에 해당하는 north, south, east, west를 case키워드를 이용해 연관된 항목으로 선언할 수 있다.
 
 enum CompassPoint {
    case north, south, east, west
 }
 
 각 항목은 그 자체로 고유값이 되며 ',' 를 이용해 항목을 한 줄로도 나열할 수 있다.
 
 열거형을 정의하게 되면 열거형을 하나의 타입처럼 사용할 수 있다. 따라서 열거형의 이름은 PascalCase를 사용한다.
 */
var direction = CompassPoint.east
print(direction)

direction = .north
print(direction)
/*
 정의된 열거형을 사용할 때에는 변수를 선언하면서 열거형 내부의 항목을 Dot Notation을 이용하여 초기화해준다.
 
 한번 열거형으로 초기화된 변수는 이후 열거형 내 항목으로 값을 변경할 때에 다시 열거형을 적어줄 필요 없이 바로 '.[항목]' 의 방식으로 항목에 접근할 수 있는데, 이유는 컴파일러가 이제 해당 변수를 해당 열거형 타입으로 타입추론하기 때문이다.
 */

// 2. swich 구문을 이용한 사용방식
direction = CompassPoint.east

switch direction {
case .north:
    print("현재 방향은 북쪽 입니다.")
    
case .south:
    print("현재 방향은 남쪽 입니다.")
    
case .east:
    print("현재 방향은 동쪽 입니다.")
    
case .west:
    print("현재 방향은 서쪽 입니다.")
}
/*
 이렇게 열거형을 switch 구문과 함께 사용하면 변수에 들어있는 열거형 항목이 어떤 것인지 비교할 수 있다.
 */

// ---------- //

// ⛺️ primitive 값 사용 열거형 선언 및 사용방식
// 1. 기본적인 사용방식
/*
 열거형의 각 항목은 그 자체로도 하나의 값이지만, 항목에 원시 값을 가지게 할 수도 있다.
 */
enum CompassPointWithPrimitive: String {
    case north = "북"
    case south = "남"
    case east = "동"
    case west = "서"
}
/*
 보통 다른 프로그래밍 언어들은 Int 타입만 원시 값을 가질 수 있는 경우가 많은데, Swift는 Int 뿐만 아니라 String 등 다양한 타입을 원시 값으로 가질 수 있다.
 */
var directionWithPrimitive = CompassPointWithPrimitive.east

switch directionWithPrimitive {
case .north:
    print("방향: \(directionWithPrimitive.rawValue)")
    
case .south:
    print("방향: \(directionWithPrimitive.rawValue)")
    
case .east:
    print("방향: \(directionWithPrimitive.rawValue)")
    
case .west:
    print("방향: \(directionWithPrimitive.rawValue)")
}
/*
 초기화된 원시 값을 사용하고자 한다면 'rowValue' 라는 property를 통해 원시 값을 가져올 수 있다.
 */

// 2. primitive를 통해 열거형 항목 반환
if let direction2 = CompassPointWithPrimitive(rawValue: "남") {
    print(direction2)
}
/*
 열거형 instance를 생성할때 parameter로 [rawValue: 원시 값]을 넘겨주는 방식을 통해 열거형 항목을 가지고 올 수도 있다.
 */

// ---------- //

// ⛺️ 연관 값을 가지는 열거형
/*
 열거형은 연관 된 값도 가질 수 있다.
 
 enum [열거형 이름] {
    case [항목이름]([타입])
 }
 
 이는 열거형 내의 항목이 자신과 연관된 값을 가질 수 있다는 뜻으로, 연관 값은 각 항목 옆에 소괄호를 묶어 표현할 수 있고 다른 항목이 연관 값을 갖는다고 해서 모든 항목이 연관값을 가질 필요는 없다.
 */
enum PhoneError {
    case unKnown
    case lowBattery(String)
}

let error = PhoneError.lowBattery("배터리가 곧 방전됩니다.")
/*
 위 코드에서 lowBattery 항목은 연관 값으로 String을 받는다. 따라서 error라는 상수를 선언할 때 lowBattery 항목 옆 소괄호에 String을 넣어줌으로서 초기화할 수 있다.
 */
switch error {
case .lowBattery(let message):
    print(message)
    
case .unKnown:
    print("알 수 없는 error")
}
/*
 이후 if case 또는 switch 문을 이용해 연관 값을 추출할 수 있다.
 */
