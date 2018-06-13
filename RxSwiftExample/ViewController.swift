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
        user.name  = "李欣"
        user.age = 24
        user.sex = "女"
        guard (btn) != nil else { return }
        (btn.rx.tap).subscribe(onNext: {
            print("button tapped\(self.index)")
            self.index += 1
            self.user.name = "\(self.index)"
        }, onError: { (error) in
            print("error")
        }, onCompleted: {
            print("完成")
        }, onDisposed: nil)
        
        scroll.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        scroll.backgroundColor = UIColor.red
        scroll.rx.contentOffset.subscribe(onNext: { (contentOffset) in
            print("contentOffset: \(contentOffset)")
        }, onDisposed: nil)
        
        //闭包
        URLSession.shared.rx.data(request: URLRequest(url: URL(string: "https://www.cqcb.com/newlist43.html?time")!)).subscribe(onNext: { (data) in
            print("data: \(data)")
        }, onError: { (error) in
            print("error: \(error)")
        }, onDisposed: nil)
        
        //通知
        NotificationCenter.default.rx.notification(Notification.Name.UIApplicationWillEnterForeground).subscribe(onNext: { (notification) in
            print("Application Will Enter Foreground")
        }, onDisposed: nil)
    
        user.rx.observe(String.self, #keyPath(User.name)).subscribe(onNext: { (newVluae) in
            print("do something with newValue")
        }, onDisposed: nil)
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

