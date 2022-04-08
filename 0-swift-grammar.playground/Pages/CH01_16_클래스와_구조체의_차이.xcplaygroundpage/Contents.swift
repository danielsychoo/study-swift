import Foundation

/*
 CH01_16. 클래스와 구조체
 */

/*
 1. 클래스와 구조체의 공통점
    - 값을 저장할 property를 선언할 수 있다.
    - 함수적 기능을 하는 method를 선언할 수 있다.
    - 내부 값에 Dot notation을 사용하여 접근할 수 있다.
    - initializer를 사용해 initial value를 설정할 수 있다.
    - extension을 사용해 기능을 확장할 수 있다.
    - protocol을 채택해 기능을 설정할 수 있다.
 
 2. 클래스와 구조체의 차이점
    2-1. 클래스
        - ❗️reference 타입
        - ARC로 메모리를 관리
        - 상속이 가능
        - type casting을 통해 런타임에서 class instance의 타입을 확인할 수 있음
        - deinit을 사용하여 class instance의 메모리 할당을 해제할 수 있음
        - ❗️같은 class instance를 여러 개의 변수에 할당한 뒤 값을 변경시키면 모든 변수에 영향을 줌 (메모리가 복사 됨)
    2-2. 구조체
        - ❗️value 타입
        - 구조체의 변수를 새로운 변수에 할당할 때마다 새로운 구조체가 할당됨
        - ❗️같은 구조체를 여러 개의 변수에 할당한 뒤 값을 변경시키더라도 다른 변수에 영향을 주지 않음 (값 자체를 복사)
 */

class SomeClass {
    var count: Int = 0
}

struct SomeStruct {
    var count: Int = 0
}

// ---------- //

// class는 reference 타입이라 모두 같은 주소를 바라보기 때문에 함께 변경됨
var class1 = SomeClass()
var class2 = class1
var class3 = class1

class3.count = 10
print(class2.count)
print(class1.count)

// ---------- //

// struct는 value 타입이라 각각 다른 메모리를 가지므로 함께 변경되지 않음
var struct1 = SomeStruct()
var struct2 = struct1
var struct3 = struct1

struct2.count = 10
struct3.count = 100

print(struct1.count)
print(struct2.count)
print(struct3.count)
