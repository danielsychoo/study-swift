import Foundation

/*
 CH01_18. 타입캐스팅 (type casting)
 */
 
/*
 타입캐스팅은 instance의 타입을 확인하거나 어떤 class의 instance를 해당 class 계층 구조의 super class나 sub class로 취급하는 방법.
 
 instance의 타입을 super class의 타입이나 sub class의 타입처럼 다루기 위해 사용하는 것으로 볼 수 있다.
 
 Swift에서는 type casting을 'is' 와 'as'로 구현할 수 있는데, 두 연산자는 값의 타입을 확인하거나, 값을 다른 타입으로 변환하는데 사용한다.
    - is -- 타입을 확인
    - as -- 타입을 변환
 */

// ---------- //

/*
 1. ⛺️ 타입 캐스팅을 위한 클래스 정의
 */

// base class (super class)
class MediaItem {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

// sub class
class Movie: MediaItem {
    var director: String
    
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

// sub class
class Song: MediaItem {
    var artist: String
    
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

// ---------- //

/*
 2. ⛺️ 타입을 확인하는 'is'
 */
let library = [
    Movie(name: "기생충", director: "봉준호"),
    Song(name: "Butter", artist: "BTS"),
    Movie(name: "올드보이", director: "박찬욱"),
    Song(name: "Wonderwall", artist: "Oasis"),
    Song(name: "Rain", artist: "이적")
]

var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}

/*
 for in 문에서 각 item의 타입을 'is'로 확인할 수 있기 때문에 타입에 분기하여 count들이 올바르게 증가한 것이다.
 */
print("라이브러리에 Movie는 \(movieCount)개, Song은 \(songCount)개 있습니다.")

// ---------- //

/*
 3. ⛺️ 타입을 변환하는 'as'
 
 특정 class 타입의 상수 또는 변수는 하위 class의 instance를 참조할 수 있다.
 */
for item in library {
    if let movie = item as? Movie {
        print("영화제목: \(movie.name), 감독: \(movie.director)")
    } else if let song = item as? Song {
        print("노래제목: \(song.name), 감독: \(song.artist)")
    }
}
/*
 예로 이번 글의 예시에서 선언한 array library내부 item의 타입을 sub class인 'Movie' 또는 'Song'으로 참조할 수 있다.
 
 이 경우 type cast 연산자로 'as?' 또는 'as!'를 사용해서 down casting을 시도할 수 있다. type cast 연산자가 'as?' 와 'as!' 두 가지 인 이유는 down casting이 실패할 수 있기 때문이다.
 
    - as? -- 조건부 형식
    - as! -- 강제 형식
 
 조건부 형식인 'as?' 는 down casting 하려는 class의 optional 값으로 반환되고, 강제 형식인 'as!' 는 forced unwrapping 되어 반환된다.
 
 따라서 강제 형식인 'as!' 는 down casting이 항상 성공할 것이라는 확신이 들 때만 사용해야 한다. 만일 'as!' 로 잘못된 class를 casting하면, 런타임 에러로 앱이 crash 된다.
 */
print(type(of: library))

for item in library {
    print(type(of: item))
    
    if let movie = item as? Movie {
        print("영화제목: \(movie.name), 감독: \(movie.director)")
    } else if let song = item as? Song {
        print("노래제목: \(song.name), 감독: \(song.artist)")
    }
}
/*
 다시 예시를 살펴보면 'as?' 를 이용해 down casting을 진행한 것을 확인할 수 있는데, 이 경우 반환값이 optional 값이므로 if let 구문을 통해 optional binding을 진행해야 한다.
 
 결과적으로 각 item은 down casting이 성공했을 때에만 print가 출력된다.
 */
