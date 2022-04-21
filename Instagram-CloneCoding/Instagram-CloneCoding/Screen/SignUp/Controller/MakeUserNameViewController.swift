//
//  MakeUserNameViewController.swift
//  Instagram-CloneCoding
//
//  Created by EUNJU on 2022/04/08.
//

import UIKit
import SnapKit
import Then

class MakeUserNameViewController: UIViewController {

    // MARK: - Properties
    private let backBtn = UIButton().then {
        $0.setImage(UIImage(named: "icn_back_24"), for: .normal)
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "사용자 이름 만들기"
        $0.font = .SFProTextR(size: 24)
        $0.textAlignment = .center
        $0.sizeToFit()
    }
    
    private let subTitleLabel = UILabel().then {
        $0.text = "새 계정에 사용할 사용자 이름을 선택하세요. 나중에\n언제든지 변경할 수 있습니다."
        $0.textColor = .darkGray
        $0.font = .SFProTextR(size: 12)
        $0.numberOfLines = 2
        $0.textAlignment = .center
        $0.sizeToFit()
    }
    
    private let userNameTextField = InstagramTextField().then {
        $0.placeholder = "사용자 이름"
        $0.setPlaceholder(color: .darkGray)
    }
    
    private let nextBtn = InstagramBtn().then {
        $0.setTitle("다음", for: .normal)
        $0.isActivated = false
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setUpTapBackBtn()
        setUpTapNextBtn()
        setUpTextField()
    }
}

// MARK: - UI
extension MakeUserNameViewController {
    private func configureUI() {
        view.addSubviews([backBtn, titleLabel, subTitleLabel, userNameTextField, nextBtn])
        
        backBtn.snp.makeConstraints {
            $0.top.equalToSuperview().offset(56)
            $0.leading.equalToSuperview().inset(16)
            $0.width.height.equalTo(32)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(94)
            $0.centerX.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(19)
            $0.centerX.equalTo(titleLabel.snp.centerX)
        }
        
        userNameTextField.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(19)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(44)
        }
        
        nextBtn.snp.makeConstraints {
            $0.top.equalTo(userNameTextField.snp.bottom).offset(22)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(44)
        }
    }
}

// MARK: - Custom Methods
extension MakeUserNameViewController {
    
    /// 다음 버튼 활성화 조건 검사하는 메서드
    private func setUpNextBtnStatus() {
        if !userNameTextField.isEmpty {
            nextBtn.isActivated = true
        } else {
            nextBtn.isActivated = false
        }
    }
    
    /// 뒤로가기 버튼 tap Action 설정 메서드
    private func setUpTapBackBtn() {
        backBtn.press {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    /// 다음 버튼 tap Action 설정 메서드
    private func setUpTapNextBtn() {
        nextBtn.press {
            guard let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: MakePasswordViewController.className) as? MakePasswordViewController else { return }
            
            nextViewController.userName = self.userNameTextField.text ?? ""
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
    
    /// textField 설정 메서드
    private func setUpTextField() {
        userNameTextField.delegate = self
        userNameTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
}

// MARK: - UITextFieldDelegate
extension MakeUserNameViewController: UITextFieldDelegate {
    
    @objc
    func textFieldDidChange(_ sender: Any?) {
        setUpNextBtnStatus()
    }
}

