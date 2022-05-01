//
//  ResultViewController.swift
//  Instagram-CloneCoding
//
//  Created by EUNJU on 2022/04/08.
//

import UIKit
import SnapKit
import Then

class ResultViewController: BaseViewController {

    // MARK: - Properties
    var userName: String = ""
    
    private let messageLabel = UILabel().then {
        $0.text = "000님, Instagram에\n오신 것을 환영합니다"
        $0.font = .SFProTextR(size: 24)
        $0.numberOfLines = 2
        $0.textAlignment = .center
        $0.sizeToFit()
        $0.setLineAndCharacterSpacing(lineSpacing: 4, characterSpacing: 0.15)
    }
    
    private let descriptionLabel = UILabel().then {
        $0.text = "언제든지 연락처 정보와 사용자 이름을 변경할 수 있습니다."
        $0.textColor = .darkGray
        $0.font = .SFProTextR(size: 12)
        $0.textAlignment = .center
        $0.sizeToFit()
    }
    
    private let completeBtn = InstagramBtn().then {
        $0.setTitle("완료하기", for: .normal)
        $0.isActivated = true
    }
    
    private let loginBtn = UIButton().then {
        $0.setTitle("다른 계정으로 로그인하기", for: .normal)
        $0.titleLabel?.font = .SFProTextR(size: 14)
        $0.setTitleColor(.btnBlue, for: .normal)
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setUpTaploginBtn()
        setUpTapCompleteBtn()
        setUpMessageLabel()
    }
}

// MARK: - UI
extension ResultViewController {
    private func configureUI() {
        view.addSubviews([messageLabel, descriptionLabel, completeBtn, loginBtn])
        
        messageLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(310)
            $0.centerX.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(messageLabel.snp.bottom).offset(23)
            $0.centerX.equalTo(messageLabel.snp.centerX)
        }
        
        completeBtn.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(23)
            $0.leading.equalToSuperview().inset(38)
            $0.trailing.equalToSuperview().inset(37)
            $0.height.equalTo(40)
        }
        
        loginBtn.snp.makeConstraints {
            $0.top.equalTo(completeBtn.snp.bottom).offset(18)
            $0.centerX.equalToSuperview()
        }
    }
}

// MARK: - Custom Methods
extension ResultViewController {
    
    /// 다른 계정으로 로그인하기 버튼 tap Action 설정 메서드
    private func setUpTaploginBtn() {
        loginBtn.press {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    /// 완료하기 로그인하기 버튼 tap Action 설정 메서드
    private func setUpTapCompleteBtn() {
        completeBtn.press {
            let homeViewController = InstagramTabBarController()
            
            homeViewController.modalPresentationStyle = .fullScreen
            self.present(homeViewController, animated: true, completion: nil)
        }
    }
    
    private func setUpMessageLabel() {
        messageLabel.text = "\(userName)님, Instagram에\n오신 것을 환영합니다"
        messageLabel.textAlignment = .center
    }
}
