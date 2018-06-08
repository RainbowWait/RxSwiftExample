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

