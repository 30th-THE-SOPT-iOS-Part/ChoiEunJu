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
    
    let idTextField = InstagramTextField().then {
        $0.placeholder = "전화번호, 사용자 이름 또는 이메일"
        $0.setPlaceholder(color: .darkGray)
    }
    
    let pwTextField = InstagramTextField().then {
        $0.placeholder = "비밀번호"
        $0.setPlaceholder(color: .darkGray)
        $0.isSecureTextEntry = true
    }
    
    private let findPwBtn = UIButton().then {
        $0.setTitle("비밀번호를 잊으셨나요?", for: .normal)
        $0.setTitleColor(.btnBlue, for: .normal)
        $0.titleLabel?.font = .SFProTextM(size: 10)
    }
    
    private let signInBtn = InstagramBtn().then {
        $0.setTitle("로그인", for: .normal)
        $0.isActivated = false
    }
    
    private lazy var signUpStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.addArrangedSubview(signUpGuideLabel)
        $0.addArrangedSubview(signUpBtn)
        $0.spacing = 5
    }
    
    private let signUpBtn = UIButton().then {
        $0.setTitle("가입하기", for: .normal)
        $0.titleLabel?.font = .SFProTextR(size: 14)
        $0.setTitleColor(.btnBlue, for: .normal)
    }
    
    private let signUpGuideLabel = UILabel().then {
        $0.text = "계정이 없으신가요?"
        $0.textColor = .darkGray
        $0.font = .SFProTextR(size: 14)
        $0.sizeToFit()
    }
    
    private let clearBtn = UIButton().then {
        $0.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        $0.tintColor = .systemGray
        $0.isHidden = true
    }
    
    private let eyeBtn = UIButton().then {
        $0.setImage(UIImage(named: "password hidden eye icon"), for: .normal)
    }
    
    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        resetTextField()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setUpTapSignInBtn()
        setUpTapSignUpBtn()
        setUpTapClearBtn()
        setUpTapEyeBtn()
        setUpTextField()
    }
}

// MARK: - UI
extension SignInViewController {
    private func configureUI() {
        view.addSubviews([logoImgView, idTextField, pwTextField, findPwBtn, signInBtn, signUpStackView, clearBtn, eyeBtn])
        
        logoImgView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(126)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(175)
            $0.height.equalTo(50)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(logoImgView.snp.bottom).offset(34)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(44)
        }
        
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(44)
        }
        
        findPwBtn.snp.makeConstraints {
            $0.top.equalTo(pwTextField.snp.bottom).offset(16)
            $0.leading.equalTo(pwTextField.snp.leading)
        }
        
        signInBtn.snp.makeConstraints {
            $0.top.equalTo(findPwBtn.snp.bottom).offset(34)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(44)
        }
        
        signUpStackView.snp.makeConstraints {
            $0.top.equalTo(signInBtn.snp.bottom).offset(34)
            $0.centerX.equalToSuperview()
        }
        
        clearBtn.snp.makeConstraints {
            $0.trailing.equalTo(idTextField.snp.trailing).inset(14)
            $0.centerY.equalTo(idTextField.snp.centerY)
            $0.width.equalTo(20)
            $0.height.equalTo(20)
        }
        
        eyeBtn.snp.makeConstraints {
            $0.trailing.equalTo(pwTextField.snp.trailing).inset(14)
            $0.centerY.equalTo(pwTextField.snp.centerY)
            $0.width.equalTo(20)
            $0.height.equalTo(20)
        }
    }
}

// MARK: - Custom Methods
extension SignInViewController {
    
    /// 로그인 버튼 활성화 조건 검사하는 메서드
    private func setUpSignInBtnStatus() {
        if !idTextField.isEmpty && !pwTextField.isEmpty {
            signInBtn.isActivated = true
        } else {
            signInBtn.isActivated = false
        }
    }
    
    /// 로그인 버튼 tap Action 설정 메서드
    private func setUpTapSignInBtn() {
        signInBtn.press {
            guard let resultViewController = self.storyboard?.instantiateViewController(withIdentifier: ResultViewController.className) as? ResultViewController else { return }
            
            resultViewController.userName = self.idTextField.text ?? ""
            resultViewController.modalPresentationStyle = .fullScreen
            self.present(resultViewController, animated: true, completion: nil)
        }
    }
    
    /// 가입하기 버튼 tap Action 설정 메서드
    private func setUpTapSignUpBtn() {
        signUpBtn.press {
            guard let signUpViewController = UIStoryboard.init(name: Identifiers.SignUpStoryBoard, bundle: nil).instantiateViewController(withIdentifier: MakeUserNameViewController.className) as? MakeUserNameViewController else { return }
            
            self.navigationController?.pushViewController(signUpViewController, animated: true)
        }
    }
    
    /// x버튼 tap Action 설정 메서드
    private func setUpTapClearBtn() {
        clearBtn.press {
            self.idTextField.text?.removeAll()
            self.setUpSignInBtnStatus()
        }
    }
    
    /// eye버튼 tap Action 설정 메서드
    private func setUpTapEyeBtn() {
        eyeBtn.press {
            self.eyeBtn.isSelected.toggle()
            self.pwTextField.isSecureTextEntry.toggle()
            self.eyeBtn.isSelected ? self.eyeBtn.setImage(UIImage(named: "password shown eye icon"), for: .normal) : self.eyeBtn.setImage(UIImage(named: "password hidden eye icon"), for: .normal)
        }
    }
    
    /// textField 설정 메서드
    private func setUpTextField() {
        idTextField.delegate = self
        pwTextField.delegate = self
        
        idTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        pwTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    /// textField 초기화하는 메서드
    private func resetTextField() {
        idTextField.text?.removeAll()
        pwTextField.text?.removeAll()
        setUpSignInBtnStatus()
    }
}

// MARK: - UITextFieldDelegate
extension SignInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.idTextField {
            textField.resignFirstResponder()
            self.pwTextField.becomeFirstResponder()
        }
        textField.resignFirstResponder()
        return true
    }
    
    @objc
    func textFieldDidChange(_ sender: Any?) {
        setUpSignInBtnStatus()
        clearBtn.isHidden = idTextField.isEmpty ? true : false
    }
}
