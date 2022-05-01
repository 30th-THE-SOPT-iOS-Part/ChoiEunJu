//
//  MakePasswordViewController.swift
//  Instagram-CloneCoding
//
//  Created by EUNJU on 2022/04/08.
//

import UIKit
import SnapKit
import Then

class MakePasswordViewController: BaseViewController {
    
    // MARK: - Properties
    var userName: String = ""
    
    private let backBtn = UIButton().then {
        $0.setImage(UIImage(named: "icn_back_24"), for: .normal)
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "비밀번호 만들기"
        $0.font = .SFProTextR(size: 24)
        $0.textAlignment = .center
        $0.sizeToFit()
    }
    
    private let subTitleLabel = UILabel().then {
        $0.text = "비밀번호를 저장할 수 있으므로 iCloud 기기에서 로그인\n정보를 입력하지 않아도 됩니다."
        $0.textColor = .darkGray
        $0.font = .SFProTextR(size: 12)
        $0.numberOfLines = 2
        $0.textAlignment = .center
        $0.sizeToFit()
    }
    
    private let pwTextField = InstagramTextField().then {
        $0.placeholder = "비밀번호"
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
extension MakePasswordViewController {
    private func configureUI() {
        view.addSubviews([backBtn, titleLabel, subTitleLabel, pwTextField, nextBtn])
        
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
        
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(19)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(44)
        }
        
        nextBtn.snp.makeConstraints {
            $0.top.equalTo(pwTextField.snp.bottom).offset(22)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(44)
        }
    }
}

// MARK: - Custom Methods
extension MakePasswordViewController {
    
    /// 다음 버튼 활성화 조건 검사하는 메서드
    private func setUpNextBtnStatus() {
        if !pwTextField.isEmpty {
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
            let nextViewController = ResultViewController()
            
            nextViewController.userName = self.userName
            nextViewController.modalPresentationStyle = .fullScreen
            self.present(nextViewController, animated: true, completion: nil)
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    /// textField 설정 메서드
    private func setUpTextField() {
        pwTextField.delegate = self
        pwTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
}

// MARK: - UITextFieldDelegate
extension MakePasswordViewController: UITextFieldDelegate {
    
    @objc
    func textFieldDidChange(_ sender: Any?) {
        setUpNextBtnStatus()
    }
}
