//
//  SecondViewController.swift
//  
//
//  Created by 郑小燕 on 2018/6/5.
//

import UIKit
import RxCocoa
import RxSwift

class SecondViewController: UIViewController {
    var disposeBag = DisposeBag.init()
    var citiesDic = [String: Int]()
    var cities = [City]()
    let capitals = [
        "France": "Paris",
        "Spain": "Madrid",
        "The Netherlands": "Amsterdam",
        "Belgium": "Brussels"
    ]
    let mayors = [
        "Paris": "Hidalgo",
        "Madrid": "Carmena",
        "Amsterdam": "van der Laan",
        "Berlin": "Müller"
    ]
    
    
    
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var labelPassword: UILabel!
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var txtPassword: UITextField!
    let minimalUsernameLength = 5
    
    
    @IBOutlet weak var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
         labelUserName.text = "Username has to be at least \(minimalUsernameLength) characters"
         labelPassword.text = "Password has to be at least \(minimalUsernameLength) characters"
         let usernameValid = (txtUserName.rx.text).orEmpty.map {
         $0.count >= self.minimalUsernameLength
         }.share(replay: 1)
         
         usernameValid.bind(to: txtPassword.rx.isEnabled).disposed(by: disposeBag)
         usernameValid.bind(to: labelUserName.rx.isHidden).disposed(by: disposeBag)
         
         let passwordValid = (txtPassword.rx.text).orEmpty.map {
         $0.count >= self.minimalUsernameLength
         }.share(replay: 1, scope: .forever)
         
         passwordValid.bind(to: btn.rx.isEnabled).disposed(by: disposeBag)
         passwordValid.bind(to: labelPassword.rx.isHidden).disposed(by: disposeBag)
         //        let everythingValid = CombineLatest
         //            .combineLatest(
         //            usernameValid,
         //            passwordValid
         //        ) { $0 && $1 }
         //        .share(replay: 1)
         
         */
        
        
        let array = [1, 2, 3, 4]
        let mapArray = array.map { (element) -> Bool in
            return element % 2 == 1
        }
        print("mapArray =\(mapArray)")
        
        let  filterArray = array.filter { (element) -> Bool in
            return element % 2 == 1
        }
        print("filterArray =\(filterArray)")
        
        
        let sum = array.reduce(0) { (result: Int, index) -> Int in
            return result + index
        }
        print("sum = \(sum)")
        
        let paris = City(name: "Paris", population: 2241)
        let madrid = City(name: "Madrid", population: 3165)
        let amsterdam = City(name: "Amsterdam", population: 827)
        let berlin = City(name: "Berlin", population: 3562)
        cities = [paris, madrid, amsterdam, berlin]
        let string = cities.filter { $0.population > 1000}
            .map { ($0.scalingPopulation()) }
            .reduce("City: Population") { (result, city) -> String in
                return result + "\n" + "\(city.name): \(city.population)"
        }
        print("string = \(string)")
        
        //字典
        citiesDic = ["Paris": 2241, "Madrid": 3165, "Amsterdam": 827, "Berlin": 3562]
        
        let madridPopulation: Int? = citiesDic["hh"]
        if madridPopulation != nil {
            print("The population of Madrid is \(madridPopulation! * 1000)")
        } else {
            print("Unknown city: Madrid")
        }
        
        //随机数
        print(Int.arbitrary())
        print(Int.arbitrary(in: 0..<256))
        print(UnicodeScalar.arbitrary())
        print(String.arbitrary())
        check1(10, "Every string starts with Hello") { (s: String) in
            s.hasPrefix("Hello")
        }
        
        print(100.smaller())
        
        print(self.qsort([7,8,1,4,6,3,10]))
        
        //枚举
        //        switch populationOfCapital(country: "France") {
        //        case let .success(population):
        //            print("France's capital has \(population)thousand inhabitants")
        //        case let .error(error):
        //            print("Error: \(error)")
        //        }
        do {
            let popultation = try populationOfCapital(country: "France")
            print("popultation = \(popultation)")
        } catch  {
            print("Look error: \(error)")
        }
        
        switch mayorOfCapital(country: "France") {
        case let .success(mayor):
            print("France's mayor is \(mayor)")
        case let .error(error):
            print("Error: \(error)")
            
        }
        
        let leaf: BinarySearchTree<Int> = .leaf
        let five: BinarySearchTree<Int> = .node(leaf, 5, leaf)
        
        
        let One = BinarySearchTree<Int>.node(BinarySearchTree<Int>.node(leaf, 2, BinarySearchTree(5)), 1, BinarySearchTree<Int>.node(leaf, 3, BinarySearchTree(4)))
        print("OneCount = \(One.count)")
        print("OneElement = \(One.elements), OneElements2 = \(One.elements2), OneElement3 = \(One.elements3)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        elementR = \(One.elementsR)")
        
        //字典树
        let dic = Tire(isElement: false, children: ["c": Tire(isElement: false, children: ["a": Tire(isElement: false, children: ["r": Tire(isElement: false, children: ["t": Tire(isElement: true, children: [:])]), "t": Tire(isElement: true, children: [:])])]),"d": Tire(isElement: false, children: ["o": Tire(isElement: false, children: ["g": Tire(isElement: true, children: [:])])])])
        print("elements = \(dic.elements)")
        
//        let dic = Tire(isElement: false, children: ["c": Tire(isElement: false, children: ["a": Tire(isElement: false, children: ["r": Tire(isElement: false, children: ["t": Tire(isElement: false, children: [:])])])])])
//        print("dic.elemnt =\(dic.elements)")
        /*
         key = "c"
         value = Tire(isElement: true, children: ["a": Tire(isElement: true, children: ["r": Tire(isElement: true, children: ["t": Tire.init()])])])
         key = "a"
         value = Tire(isElement: true, children: ["r": Tire(isElement: true, children: ["t": Tire.init()])])
         key = "r"
         value = Tire(isElement: true, children: ["t": Tire.init()])
         key = "t"
         value = Tire.init()
         [[]] + ["c"] +
         
         */
        
//        print([1, 2, 3, 4, 5].slice.decomposed)
//        print(self.sum([1, 2,3, 4,5].slice))
//        print(dic.lookup(key: ["c", "a", "r", "e"]))
//        print(dic.lookUp(key: ["c", "a", "r", "t"]))
//        print(dic.complete(key: ["c", "a", "r", "t"]))
//        print("------------------------")
//        print("-------------------------\(dic.inserting(["c", "a", "r", "t", "e","m"]).elements)")
        
        print("--------------\(Tire<String>.build(words: ["car","art","camel"]).elements)-------")
        
        Tire<Character>(isElement: false, children: ["c": RxSwiftExample.Tire<Swift.Character>(isElement: false, children: ["a": RxSwiftExample.Tire<Swift.Character>(isElement: false, children: ["r": RxSwiftExample.Tire<Swift.Character>(isElement: true, children: [:]), "m": RxSwiftExample.Tire<Swift.Character>(isElement: false, children: ["e": RxSwiftExample.Tire<Swift.Character>(isElement: false, children: ["l": RxSwiftExample.Tire<Swift.Character>(isElement: true, children: [:])])])])]), "a": RxSwiftExample.Tire<Swift.Character>(isElement: false, children: ["r": RxSwiftExample.Tire<Swift.Character>(isElement: false, children: ["t": RxSwiftExample.Tire<Swift.Character>(isElement: true, children: [:])])])])
        //自动补全
        print("自动补全功能：\("ca".complete(Tire<Character>.build(words: ["car","art","camel"])))")
    }
    
    //切片
    func sum(_ integers: ArraySlice<Int>) -> Int {
        guard let (head, tail) = integers.decomposed else { return 0 }
        return head + sum(tail)
    }
    
    //枚举
    //    func populationOfCapital(country: String) -> PopulationResult {
    //        guard let capital = capitals[country] else { return PopulationResult.error(.capitalNotFound) }
    //        guard let population = citiesDic[capital] else { return PopulationResult.error(.populationNotFound) }
    //        return PopulationResult.success(population)
    //    }
    
    //错误处理
    func populationOfCapital(country: String)throws -> Int {
        guard let capital = capitals[country] else { throw LookupError.capitalNotFound }
        guard let popultation = citiesDic[capital] else { throw LookupError.populationNotFound }
        return popultation
    }
    
    func mayorOfCapital(country: String) -> Result<String?> {
        guard let capital = capitals[country] else { return Result.error(.capitalNotFound) }
        guard let mayor = mayors[capital] else { return Result.error(.other("mayorNotFound")) }
        return Result.success(mayor)
    }
    
    
    func increment(optional: Int?) -> Int? {
        return optional.map{$0 + 1}
    }
    
    func populationOfCapital3(country: String) -> Int? {
        return capitals[country].flatMap({ (capital)in
            citiesDic[capital]
        }).flatMap({ (pupulation) in
            return pupulation * 1000
        })
    }
    
    func check1<A: Arbitrary>(_ numberOfIterations: Int, _ message: String, _ property: (A)-> Bool) -> () {
        for _ in 0..<numberOfIterations {
            let value = A.arbitrary()
            guard property(value) else {
                print("\(message) doesn't hold: \(value)")
                return
            }
        }
        print("\(message) passed \(numberOfIterations) tests")
    }
    
    func iterate<A>(while condition: (A)-> Bool, initial: A, next: (A) -> A?) -> A {
        guard let x = next(initial), condition(x) else {
            return initial
        }
        return iterate(while: condition, initial: x, next: next)
    }
    
    func check2<A: Arbitrary2>(_ numberOfIterations: Int,_ message: String, _ property: (A)-> Bool) -> () {
        for _ in 0..<numberOfIterations{
            let value = A.arbitrary()
            guard property(value) else {
                let smallerValue = iterate(while: {
                    !property($0)
                }, initial: value) {
                    $0.smaller()
                }
                print("\(message) doesn't hold: \(smallerValue)")
                return
            }
            
        }
        print("\(message) passed \(numberOfIterations) tests")
    }
    
    
    func qsort(_ input: [Int]) -> [Int] {
        var array = input
        if array.isEmpty { return [] }
        let pivot = array.removeFirst()
        let lesser = array.filter { $0 < pivot }
        let greater = array.filter { $0 >= pivot }
        let intermediate = qsort(lesser) + [pivot]
        return intermediate + qsort(greater)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
extension Array {
    func map<T>(transform: (Element)-> T) -> [T] {
        var result: [T] = []
        for x in self {
            result.append(transform(x))
        }
        return result
    }
    
    func filter(transform: (Element) -> Bool) -> [Element] {
        var result: [Element] = []
        for x in self where transform(x) {
            result.append(x)
        }
        return result
    }
    
    func reduce<T>(_ initial: T,combine: (T,Element)-> T) -> T {
        var result = initial
        for x in self {
            result = combine(result, x)
        }
        return result
    }
}

//单位千
struct City {
    var name = ""
    var population: Int = 0
}
extension City {
    func scalingPopulation() -> City {
        return City(name: self.name, population: self.population * 1000)
    }
}

extension Optional {
    func map<U>(_ transform: (Wrapped) -> U) -> U? {
        guard let x = self else {
            return nil
        }
        return transform(x)
    }
    
    func flatMap<U>(_ transform: (Wrapped) -> U?) -> U? {
        guard let x = self else {
            return nil
        }
        return transform(x)
    }
}

protocol Arbitrary {
    static func arbitrary() -> Self
}

extension Int: Arbitrary {
    static func arbitrary() -> Int {
        return Int(arc4random())
    }
    static func arbitrary(in range: CountableRange<Int>) -> Int {
        let diff = range.upperBound - range.lowerBound
        return range.lowerBound + (Int.arbitrary() % diff)
        
    }
}

extension UnicodeScalar: Arbitrary {
    static func arbitrary() -> UnicodeScalar {
        return UnicodeScalar(Int.arbitrary(in: 65..<90))!
    }
}

extension String: Arbitrary {
    static func arbitrary() -> String {
        let randomLength = Int.arbitrary(in: 0..<40)
        let randomScalars = (0..<randomLength).map { _ in
            UnicodeScalar.arbitrary()
        }
        return String(UnicodeScalarView(randomScalars))
        
        
    }
}

protocol Smaller {
    func smaller() -> Self?
}

extension Int: Smaller {
    func smaller() -> Int? {
        return self == 0 ? nil : self / 2
    }
}

extension String: Smaller {
    func smaller() -> String? {
        return isEmpty ? nil : String(characters.dropFirst())
    }
}

protocol Arbitrary2: Smaller {
    static func arbitrary()-> Self
}

//枚举
enum LookupError: Error {
    case capitalNotFound
    case populationNotFound
}
enum PopulationResult {
    case success(Int)
    case error(LookupError)
}
enum ErrorType: Error{
    case capitalNotFound
    case other(String)
}
enum Result<T> {
    case success(T)
    case error(ErrorType)
}
enum Zero { }

//二叉树
indirect enum BinarySearchTree<Element: Comparable> {
    case leaf//一个没有关联值的叶子
    case node(BinarySearchTree<Element>, Element, BinarySearchTree<Element>)
}

extension BinarySearchTree {
    init() {
        self = .leaf
    }
    init(_ value: Element) {
        self = .node(.leaf , value, .leaf)
    }
    
    var count: Int {
        switch self {
        case .leaf:
            return 0
        case let .node(left, _, right):
            return 1  + left.count + right.count
        }
    }
    
    var elements: [Element] {
        switch self {
        case .leaf:
            return []
        case let .node(left, x, right):
            return left.elements + [x] + right.elements
        }
        
    }
    //根左右
    var elements2: [Element] {
        switch self {
        case .leaf:
            return []
        case let .node(left, x, right):
            return [x] + left.elements2 + right.elements2
        }
    }
    
    //左根右
    var elements3: [Element] {
        switch self {
        case .leaf:
            return []
        case let .node(left, x , right):
            return left.elements3 + right.elements3 + [x]
            
        }
    }
    
    
    
    func reduce<A>(leaf leafF: A, node nodeF: (A, Element, A) -> A) -> A {
        switch self {
        case .leaf:
            return leafF
        case let .node(left, x, right):
            return nodeF(left.reduce(leaf: leafF, node: nodeF), x, right.reduce(leaf: leafF, node: nodeF))
            
        }
    }
    
    var elementsR: [Element] {
        return reduce(leaf: [], node: { $0 + [$1] + $2
        })
    }
    var countR: Int {
        return reduce(leaf: 0, node: {
            1 + $0 + $2
        })
        
    }
    
    var isEmpty: Bool {
        if case .leaf = self {
            return true
        }
        return false
    }
    
    var isBST: Bool {
        switch self {
        case .leaf:
            return true
        case let .node(left, x, right):
            return left.elementsR.all{y in y < x} && right.elementsR.all(predicate: {  y in y > x
            }) && left.isBST && right.isBST
            
        }
    }
    
    func contains(_ x: Element) -> Bool {
        switch self {
        case .leaf:
            return false
        case let .node(_, y, _) where x == y:
            return true
        case let .node(left, y, _) where x<y:
            return left.contains(x)
        case let .node(_, y, right) where x>y:
            return right.contains(x)
        default:
            fatalError("The impossible occurred")
        }
    }
    
    mutating func insert(_ x: Element) {
        switch self {
        case .leaf:
            self = BinarySearchTree(x)
        case .node(var left, let y, var right):
            if x < y {left.insert(x)}
            if x > y {right.insert(x)}
            self = .node(left,y, right)
        }
    }
    
    
    
}
extension Sequence {
    func all(predicate: (Iterator.Element) -> Bool) -> Bool {
        for x in self where !predicate(x) {
            return false
        }
        return true
    }
}


//字典树
struct Tire<Element: Hashable> {
    let isElement: Bool
    let children: [Element: Tire<Element>]
}
extension Tire {
    init() {
        isElement = false
        children = [:]
    }
    var elements: [[Element]] {
        
//        Tire(isElement: true, children: ["c": Tire(isElement: true, children: ["a": Tire(isElement: true, children: ["r": Tire(isElement: true, children: ["t": Tire(isElement: true, children: [:])])])])])
        
        var result: [[Element]] = isElement ? [[]]:[]
        for (key, value) in children {
//            print("value.elements = \(value.elements)")
            //[key] + $0
            result += value.elements.map(transform: { (hhh) -> [Element] in
//                print("hhh = \(hhh) ------\(key)")
                return [key] + hhh
            })
//            print("result = \(result)")
        }
        return result
        
    }
    
}

extension Array {
    var slice: ArraySlice<Element> {
        return ArraySlice(self)
    }
}

extension ArraySlice {
    var decomposed: (Element, ArraySlice<Element>)? {
        return isEmpty ? nil : (self[startIndex], self.dropFirst())
    }
}

extension Tire {
    func lookup(key: ArraySlice<Element>) -> Bool {
        guard let (head, tail) = key.decomposed else { return isElement }
        guard let subtrie = children[head] else { return false }
        return subtrie.lookup(key: tail)
    }
    
    func lookUp(key: ArraySlice<Element>) -> Tire<Element>? {
        guard let (head,tail) = key.decomposed else { return self }
        guard let remainder = children[head] else { return nil }
        return remainder.lookUp(key: tail)
    }
    
    func complete(key: ArraySlice<Element>) -> [[Element]] {
        return lookUp(key: key)?.elements ?? []
    }
    
    init(_ key: ArraySlice<Element>) {
        if let (head, tail) = key.decomposed {
            let children = [head: Tire(tail)]
            self = Tire(isElement: false, children: children)
        } else {
            self = Tire(isElement: true, children: [:])
        }
    }
    
    func inserting(_ key: ArraySlice<Element>) -> Tire<Element> {
        guard let (head, tail) = key.decomposed else { return Tire(isElement: true, children: children) }
        var newChildren = children
        print("children = \(children)")
        if let nextTire = children[head] {
            newChildren[head] = nextTire.inserting(tail)
        } else {
            newChildren[head] = Tire(tail)
        }
        return Tire(isElement: isElement, children: newChildren)
        
    }
    
    static func build(words: [String]) -> Tire<Character> {
        let emptyTrie = Tire<Character>()
        return words.reduce(emptyTrie, combine: { (tire, word) -> Tire<Character> in
        tire.inserting(Array(Substring(word)).slice)
        })
    }
    
    
    
}

extension String {
    func complete(_ knownWords: Tire<Character>) -> [String] {
        let chars = Array(Substring(self)).slice
        let completed = knownWords.complete(key: chars)
        print("complete = \(completed)")
        return completed.map(transform: { (chars) in
            self + String(chars)
        })
        
    }
}
