//
//  SignInViewController.swift
//  Instagram-CloneCoding
//
//  Created by EUNJU on 2022/04/07.
//

import UIKit
import SnapKit
import Then

class SignInViewController: UIViewController {

    // MARK: - Properties
    private let logoImgView = UIImageView().then {
        $0.image = UIImage(named: "Instagram Black Logo")
    }
    
    private let idTextField = UITextField().then {
        $0.placeholder = "전화번호, 사용자 이름 또는 이메일"
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.borderStyle = .roundedRect
    }
    
    private let pwTextField = UITextField().then {
        $0.placeholder = "비밀번호"
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.borderStyle = .roundedRect
    }
    
    private let findPwBtn = UIButton().then {
        $0.setTitle("비밀번호를 잊으셨나요?", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 11)
    }
    
    private let signInBtn = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBlue
        $0.makeRounded(cornerRadius: 5.adjusted)
    }
    
    private let signUpContentView = UIView()
    
    private let signUpBtn = UIButton().then {
        $0.setTitle("가입하기", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        $0.setTitleColor(.systemBlue, for: .normal)
    }
    
    private let signUpGuideLabel = UILabel().then {
        $0.text = "계정이 없으신가요?"
        $0.textColor = .gray
        $0.font = .systemFont(ofSize: 14)
        $0.sizeToFit()
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
}

// MARK: - UI
extension SignInViewController {
    private func configureUI() {
        view.addSubviews([logoImgView, idTextField, pwTextField, findPwBtn, signInBtn, signUpContentView])
        signUpContentView.addSubviews([signUpBtn, signUpGuideLabel])
        
        logoImgView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(150)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(175)
            $0.height.equalTo(50)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(logoImgView.snp.bottom).offset(40)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(45)
        }
        
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(45)
        }
        
        findPwBtn.snp.makeConstraints {
            $0.top.equalTo(pwTextField.snp.bottom).offset(12)
            $0.trailing.equalTo(pwTextField.snp.trailing)
        }
        
        signInBtn.snp.makeConstraints {
            $0.top.equalTo(findPwBtn.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(50)
        }
        
        signUpContentView.snp.makeConstraints {
            $0.top.equalTo(signInBtn.snp.bottom).offset(35)
            $0.centerX.equalToSuperview()
        }
        
        signUpGuideLabel.snp.makeConstraints {
            $0.top.bottom.leading.equalTo(signUpContentView)
        }
        
        signUpBtn.snp.makeConstraints {
            $0.top.bottom.trailing.equalTo(signUpContentView)
            $0.leading.equalTo(signUpGuideLabel.snp.trailing).offset(3)
        }
    }
}

