import UIKit
import Foundation
import os

var greeting = "Hello, playground"

for i in 0...99 {
    i
}

let a: Int = 100

var b: Int = 200
b = 300


var numbers: Array<Int> = Array<Int>()
numbers.append(1)
numbers.append(1)
numbers.append(1)

numbers[0]

numbers.insert(4, at: 2)
numbers

numbers.remove(at: 0)
numbers

var names = [String]()
var names1: [String] = []

var dic: Dictionary<String, Int> = Dictionary<String, Int>()
var dic1: [String: Int] = [:]

dic["김철수"] = 3
dic["김민지"] = 5
dic

dic["김민지"] = 6
dic

dic.removeValue(forKey: "김민지")
dic

var set:Set = Set<Int>()
set.insert(10)
set.insert(20)
set.insert(30)
set.insert(30)
set

set.remove(20)
set

func sum(a: Int, b: Int) -> Int {
    return a + b
}

sum(a: 5, b: 3)

func sendMessage(from myName: String, to name: String) -> String {
    return "Hello \(name)! I`m \(myName)"
}

sendMessage(from: "Gunter", to: "Json")

func sendMessage(_ name: String) -> String {
    return "Hello \(name)!"
}

sendMessage("권태완")


func sendMessage(me: String, friends: String...) -> String {
    return "Hello \(friends)! I'm \(me)"
}

sendMessage(me: "Gunter", friends: "JSON", "Albert")

var x = 10
repeat {
    x+=2
} while x < 7
            
print(x)


var name: String?
var optionalName: String = "Gunter"

var number: Int? = 3
print(number)
print(number!)


if let result = number {
    print(result)
} else {
    
}

func test() {
    let number: Int? = 5
    guard let result = number else { return }
    print(result)
}

test()

let value: Int? = 6
if value == 6 {
    print("value is 6")
} else {
    print("value is not 6")
}

let string = "12"
var stringToInt: Int! = Int(string)
print(stringToInt + 1)

struct User {
    var nickname: String
    var age: Int
    
    func information() {
        print("\(nickname) \(age)")
    }
}

var user = User(nickname: "gunter", age: 23)

user.nickname
user.age
user.nickname = "ablert"
user.nickname

user.information()

class Dog {
    var name: String = ""
    var age: Int = 0
    
    init() {
        
    }
    
    func introduce() {
        print("name \(name) age \(age)")
    }
}

var dog = Dog()
dog.name = "coco"
dog.age = 3
dog.name
dog.age

dog.introduce()


class User1 {
    var nickname: String
    var age: Int
    
    init(nickname: String, age: Int) {
        self.nickname = nickname
        self.age = age
    }
    
    init(age: Int) {
        self.nickname = "albert"
        self.age = age
    }
    
    deinit {
        print("deinit user")
    }
}
var user1 = User1(nickname: "gunter", age: 23)

user1.nickname
user1.age

var user2 = User1(age: 26)
user2.nickname
user2.age

var user3:User1? = User1(age: 23)
user3 = nil

struct Dog1 {
    var name: String
    let gender: String
}

var dog1 = Dog1(name: "gunter", gender:"Male")
print(dog1)

dog.name = "권태완"

let dog2 = Dog1(name: "gunter", gender:"Male")


struct Stock  {
    var averagePrice: Int
    var quantity: Int
    var purchasePrice: Int{
        get {
            return averagePrice * quantity
        }
        
        set(newPrice) {
            averagePrice = newPrice / quantity
        }
    }
}

var stock = Stock(averagePrice: 2300, quantity: 3)
print(stock)
stock.purchasePrice
stock.purchasePrice = 3000
stock.averagePrice


protocol SomeProtocol {
    
}

protocol SomeProtocol2 {
    
}

struct SomeStructure: SomeProtocol, SomeProtocol2 {
    
}

protocol FirstProtocol {
    var name: Int { get set }
    var age: Int { get }
}

protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}

protocol FullyNames {
    var fullName: String { get set }
    func printFullName()
}

struct Person: FullyNames {
    var fullName: String
    func printFullName() {
        print(fullName)
    }
}


protocol SomeProtocol3 {
    func someTypeMethod()
}

protocol SomeProtocol4 {
    init( someParameter: Int )
}

protocol SomeProtocol5 {
    init()
}

class SomeClass: SomeProtocol5 {
    required init() {
        
    }
}


extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
    
    var isOdd: Bool {
        return self % 2 == 1
    }
}

var number4 = 3
number4.isOdd
number4.isEven

extension String {
    func convertToInt() -> Int? {
        return Int(self)
    }
}

var string2 = "0"
string2.convertToInt()


enum CompassPoint: String {
    case north = "북"
    case south = "남"
    case east = "동"
    case west = "서"
}

var direction = CompassPoint.east
direction = .west


switch direction {
case.north:
    print(direction.rawValue)
case.south:
    print(direction.rawValue)
case.east:
    print(direction.rawValue)
case.west:
    print(direction.rawValue)
}

let direction2 = CompassPoint(rawValue: "남")

enum PhoneError {
    case unknown
    case batteryLow(String)
}

let error = PhoneError.batteryLow("배터리가 곧 방전됩니다.")

switch error {
case.batteryLow(let message):
    print(message)
case.unknown:
    print("알 수 없는 에러입니다.")
}


struct Developer {
    let name: String
}

struct Company {
    let name: String
    var developer: Developer?
}

var developer = Developer(name: "han")
var company = Company(name: "Gunter", developer: developer)
print(company.developer)
print(company.developer?.name)
print(company.developer!.name)


enum PhoneErrorEnum: Error {
    case unknown
    case batteryLow(batteryLevel: Int)
    
}

//throw PhoneErrorEnum.batteryLow(batteryLevel: 20)

func checkPhoneBatteryStatus(batteryLevel: Int) throws -> String {
    guard batteryLevel != -1 else { throw PhoneErrorEnum.unknown }
    guard batteryLevel <= 20 else { throw PhoneErrorEnum.batteryLow(batteryLevel: 20) }
    return "배터리 상태가 정상입니다."
}

do {
    try checkPhoneBatteryStatus(batteryLevel: -1)
} catch PhoneErrorEnum.unknown {
    print("알 수 없는 에러입니다.")
} catch PhoneErrorEnum.batteryLow(let batteryLevel) {
    print("배터리 전원 부족 남은 배터리 : \(batteryLevel)")
} catch {
    print("그 외 오류 발생 : \(error)")
}

let status = try? checkPhoneBatteryStatus(batteryLevel: 30)
print(status)

let hello = { () -> () in print("hello") }
hello()

let hello2 = { (name: String) -> String in
    return "Hello, \(name)"
}

hello2("Gunter")

func doSomething(closure: () -> ()) {
    closure()
}

doSomething(closure: { () -> () in
    print("hello")
})

doSomething() {
    print("hello2")
}

doSomething {
    print("hello3")
}

func doSomething2() -> () -> () {
    return { () -> () in
        print("hello4")
    }
}

doSomething2()()

func doSomething2(success: () -> (), fail: () -> ()) {
    
}


