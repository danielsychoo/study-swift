import Foundation

/*
 CH01_10. 옵셔널
 */

/*
 Optional이란 값이 있을 수도, 없을 수도 있는 것을 뜻한다.
 */

// ---------- //

var name: String?

var optionalName: String? = "Choo"
print(optionalName)

var requiredName: String = optionalName!
