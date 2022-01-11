//
//  ViewController.swift
//  TweetTextField
//
//  Created by SeongMinK on 2022/01/11.
//

import UIKit
import TweeTextField

class ViewController: UIViewController {

    @IBOutlet weak var myPasswordTextField: TweeAttributedTextField!
    @IBOutlet weak var myEmailTextField: TweeAttributedTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myEmailTextField.borderStyle = .none
        myEmailTextField.tweePlaceholder = "Input email"
        myEmailTextField.placeholderColor = .lightGray
        myEmailTextField.placeholderDuration = 0.1
        myEmailTextField.lineColor = .opaqueSeparator
        myEmailTextField.infoAnimationDuration = 0.2
        myEmailTextField.minimumPlaceholderFontSize = 12
        myEmailTextField.originalPlaceholderFontSize = 15
        myEmailTextField.minimizationAnimationType = .smoothly
    }

    // 비밀번호 입력이 시작될 때
    @IBAction func passwordBeginEditing(_ sender: TweeAttributedTextField) {
    }
    
    // 비밀번호 입력 중일 때
    @IBAction func passwordWhileEditing(_ sender: TweeAttributedTextField) {
        if let userInput = sender.text {
            if userInput.count == 0 {
                sender.activeLineColor = .blue
                sender.hideInfo(animated: true)
            } else if userInput.count < 6 {
                sender.activeLineColor = .red
                sender.infoTextColor = .red
                sender.showInfo("6글자 이상 입력하세요", animated: true)
            } else {
                sender.activeLineColor = .green
                sender.infoTextColor = .green
                sender.showInfo("6글자 이상입니다!", animated: true)
            }
        }
    }
    
    // 비밀번호 입력된 후
    @IBAction func passwordEndEditing(_ sender: TweeAttributedTextField) {
    }
    
    // 이메일 입력 중일 때
    @IBAction func emailWhileEditing(_ sender: TweeAttributedTextField) {
        if let userInput = sender.text {
            if userInput.count == 0 {
                sender.activeLineColor = .blue
                sender.hideInfo(animated: true)
                return
            }
            if userInput.isValidEmail {
                sender.activeLineColor = .green
                sender.infoTextColor = .green
                sender.showInfo("이메일 형식입니다!", animated: true)
            } else {
                sender.activeLineColor = .red
                sender.infoTextColor = .red
                sender.showInfo("이메일 형식이 아닙니다", animated: true)
            }
        }
    }
}

extension String {
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//        return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: self)
        return (self.range(of: emailRegEx, options: .regularExpression) != nil)
    }
}
