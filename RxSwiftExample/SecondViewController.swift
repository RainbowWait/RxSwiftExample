//
//  SecondViewController.swift
//  
//
//  Created by 郑小燕 on 2018/6/5.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var txtUserName: UITextField!
    
    @IBOutlet weak var labelPassword: UILabel!
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var txtPassword: UITextField!
    let minimalUsernameLength = 5
    
    
    @IBOutlet weak var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        labelUserName.text = "Username has to be at least \(minimalUsernameLength) characters"
        labelPassword.text = "Password has to be at least \(minimalUsernameLength) characters"
        let usernameValid = (txtUserName.rx.text).orEmpty.map {
            $0.count >= self.minimalUsernameLength
        }.share(replay: 1)
        
        usernameValid.bind(to: txtPassword.rx.isEnabled)
        usernameValid.bind(to: labelUserName.rx.isHidden)
        
        let passwordValid = (txtPassword.rx.text).orEmpty.map {
            $0.count >= self.minimalUsernameLength
        }.share(replay: 1, scope: .forever)
        
        passwordValid.bind(to: btn.rx.isEnabled)
        passwordValid.bind(to: labelPassword.rx.isHidden)
//        let everythingValid = CombineLatest
//            .combineLatest(
//            usernameValid,
//            passwordValid
//        ) { $0 && $1 }
//        .share(replay: 1)
        
        
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
