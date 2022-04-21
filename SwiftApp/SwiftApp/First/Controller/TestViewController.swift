//
//  TestViewController.swift
//  SwiftApp
//
//  Created by quhong1v1 on 2022/3/11.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import RxRelay

class TestViewController: ZABaseViewController {
    
    let minUsernameLength = 8
    let minPasswordLength = 8
    let disposeBag = DisposeBag()
    
    lazy var nameTextF : UITextField = {
        var textF = UITextField()
        textF.placeholder = "请输入用户名"
        textF.layer.borderWidth = 1
        textF.layer.borderColor = UIColor.lightGray.cgColor
        return textF
    }()
    
    lazy var nameTips : UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.text = "密码至少\(minUsernameLength)个字符"
        return label
    }()
    
    lazy var passwordTextF : UITextField = {
        var textF = UITextField()
        textF.placeholder = "请输入密码"
        textF.layer.borderWidth = 1
        textF.layer.borderColor = UIColor.lightGray.cgColor
        return textF
    }()
    
    lazy var passwordTips : UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.text = "密码至少\(minPasswordLength)个字符"
        return label
    }()
    
    lazy var confimBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .green
        btn.setTitleColor(.black, for: .normal)
        btn.setTitleColor(.lightGray, for: .disabled)
        btn.setTitle("Confirm", for: .normal)
        btn.setTitle("Confirm", for: .disabled)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "二级页面"
        view.backgroundColor = .white
        addNavBar(.cyan)
        setupUI()
        
        let usernameValid = nameTextF.rx.text.orEmpty
            .map { $0.count >= self.minUsernameLength }
                .share(replay: 1)

            let passwordValid = passwordTextF.rx.text.orEmpty
            .map { $0.count >= self.minPasswordLength }
                .share(replay: 1)

            let everythingValid = Observable.combineLatest(
                  usernameValid,
                  passwordValid
                ) { $0 && $1 }
                .share(replay: 1)

            usernameValid
                .bind(to: passwordTextF.rx.isEnabled)
                .disposed(by: disposeBag)

            usernameValid
                .bind(to: nameTips.rx.isHidden)
                .disposed(by: disposeBag)

            passwordValid
                .bind(to: passwordTips.rx.isHidden)
                .disposed(by: disposeBag)

            everythingValid
                .bind(to: confimBtn.rx.isEnabled)
                .disposed(by: disposeBag)

            confimBtn.rx.tap
                .subscribe(onNext: { [weak self] in self?.showAlert() })
                .disposed(by: disposeBag)
    }
    
    func showAlert(){
        let alertView = UIAlertView(
                title: "RxExample",
                message: "This is wonderful",
                delegate: nil,
                cancelButtonTitle: "OK"
            )

            alertView.show()
    }
    
    func setupUI(){
        let tipLabel = UILabel()
        tipLabel.text = "用户名"
        
        view.addSubview(tipLabel)
        tipLabel.snp.makeConstraints { make in
            make.top.equalTo(SAFE_TOP_HEIGHT)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.height.equalTo(20)
        }
        view.addSubview(nameTextF)
        nameTextF.snp.makeConstraints { make in
            make.leading.trailing.equalTo(tipLabel)
            make.top.equalTo(tipLabel.snp.bottom).offset(5)
            make.height.equalTo(40)
        }
        view.addSubview(nameTips)
        nameTips.snp.makeConstraints { make in
            make.top.equalTo(nameTextF.snp.bottom).offset(5)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.height.equalTo(20)
        }
        
        let tipLabel2 = UILabel()
        tipLabel2.text = "密码"
        view.addSubview(tipLabel2)
        tipLabel2.snp.makeConstraints { make in
            make.top.equalTo(nameTips.snp.bottom).offset(10)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.height.equalTo(20)
        }
        view.addSubview(passwordTextF)
        passwordTextF.snp.makeConstraints { make in
            make.leading.trailing.equalTo(tipLabel2)
            make.top.equalTo(tipLabel2.snp.bottom).offset(5)
            make.height.equalTo(40)
        }
        view.addSubview(passwordTips)
        passwordTips.snp.makeConstraints { make in
            make.top.equalTo(passwordTextF.snp.bottom).offset(5)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.height.equalTo(20)
        }
        
        view.addSubview(confimBtn)
        confimBtn.snp.makeConstraints { make in
            make.top.equalTo(passwordTips.snp.bottom).offset(10)
            make.centerX.equalTo(view)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        
    }
    deinit {
        
        // 取消绑定，你可以在退出页面时取消绑定
        print("Testdeinit")
    }
}
