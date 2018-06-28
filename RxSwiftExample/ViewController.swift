//
//  ViewController.swift
//  RxSwiftExample
//
//  Created by 郑小燕 on 2018/6/5.
//  Copyright © 2018年 郑小燕. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class Teacher: NSObject {
    var name = ""
    var age = 0
    var sex = ""
    var teacherId = 0
    
}
class Comment: NSObject {
    var teacherComment = ""
}
//enum API {
//    static func teacher(teacherId: Int) -> Observable<Teacher> {
//        return
//    }
//    static func teacherComments(teacherId: Int) -> Observable<[Comment]> {
//        return [Comment()]
//    }
//
//    static func token(username: String, password: String, success: (String)-> Void, failure: (Error) -> Void){
//    print("获取token")
//    }
//
//    static func userInfo(token: String, success: (User)-> Void, failure: (Error) -> Void) {
//
//    }
//
//}

class ViewController: UIViewController {

    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var btn: UIButton!
    @objc var user = User()
    
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        user.name  = "李欣"
//        user.age = 24
//        user.sex = "女"
//        guard (btn) != nil else { return }
//        (btn.rx.tap).subscribe(onNext: {
//            print("button tapped\(self.index)")
//            self.index += 1
//            self.user.name = "\(self.index)"
//        }, onError: { (error) in
//            print("error")
//        }, onCompleted: {
//            print("完成")
//        }, onDisposed: nil)
//
//        scroll.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
//        scroll.backgroundColor = UIColor.red
//        scroll.rx.contentOffset.subscribe(onNext: { (contentOffset) in
//            print("contentOffset: \(contentOffset)")
//        }, onDisposed: nil)
//
//        //闭包
//        URLSession.shared.rx.data(request: URLRequest(url: URL(string: "https://www.cqcb.com/newlist43.html?time")!)).subscribe(onNext: { (data) in
//            print("data: \(data)")
//        }, onError: { (error) in
//            print("error: \(error)")
//        }, onDisposed: nil)
//
//        //通知
//        NotificationCenter.default.rx.notification(Notification.Name.UIApplicationWillEnterForeground).subscribe(onNext: { (notification) in
//            print("Application Will Enter Foreground")
//        }, onDisposed: nil)
//
//        user.rx.observe(String.self, #keyPath(User.name)).subscribe(onNext: { (newVluae) in
//            print("do something with newValue")
//        }, onDisposed: nil)
        
        

        
        

    }
    
    func barGraph(_ input: [(String, Double)]) -> Diagram {
        let values: [CGFloat] = input.map { (value) -> CGFloat in
            return CGFloat(value.1)
        }
        let bars = values.normalized.map { (x) -> CGRect in
            return rect(width: 1, height: 3 * x)
        }
        
        
    }
    
    func rect(width: CGFloat, height: CGFloat) -> Diagram {
        return .primitive(CGSize(width: width, height: height), .rectangle)
    }
    
    func test() {
        let bounds = CGRect(x: 0, y: 0, width: 375, height: 667)
        if #available(iOS 10.0, *) {
            let renderer = UIGraphicsImageRenderer(bounds: bounds)
            let im =  renderer.image { context in
                UIColor.blue.setFill()
                context.fill(CGRect(x: 7.5, y: 97.5, width: 90, height: 90))
                UIColor.red.setFill()
                context.fill(CGRect(x: 97.5, y: 75, width: 180, height: 180))
                UIColor.green.setFill()
                context.cgContext.fillEllipse(in:
                    CGRect(x: 277.5, y: 97.5, width: 90, height: 90))
            }
            let img = UIImageView(image: im)
            self.view.addSubview(img)
            img.frame = CGRect(x: 0, y: 0, width: 375, height: 667)
            
            
        } else {
            // Fallback on earlier versions
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
enum Primitive {
    case elipse
    case rectangle
    case text(String)
}

indirect enum Diagram {
    case primitive(CGSize, Primitive)
    case beside(Diagram, Diagram)
    case below(Diagram, Diagram)
    case attributed(Attribute, Diagram)
    case align(CGPoint, Diagram)
}

enum Attribute {
    case fillColor(UIColor)
}

extension Sequence where Iterator.Element == CGFloat {
    var normalized: [CGFloat]  {
        let maxVal = reduce(0, Swift.max)
        return map{$0 / maxVal}
        
    }
}
