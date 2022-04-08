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
        $0.setCharacterSpacing(1.2)
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
        $0.textAlignment = .center
        $0.sizeToFit()
    }
    
    private let subTitleLabel = UILabel().then {
        $0.text = "새 계정에 사용할 사용자 이름을 선택하세요. 나중에\n언제든지 변경할 수 있습니다."
        $0.textColor = .gray
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.sizeToFit()
    }
    
    private let userNameTextField = UITextField().then {
        $0.placeholder = "사용자 이름"
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.borderStyle = .roundedRect
    }
    
    private let nextBtn = UIButton().then {
        $0.setTitle("다음", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBlue
        $0.makeRounded(cornerRadius: 5.adjusted)
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setUpTapBackBtn()
        setUpTapNextBtn()
    }
}

// MARK: - UI
extension MakeUserNameViewController {
    private func configureUI() {
        view.addSubviews([backBtn, titleLabel, subTitleLabel, userNameTextField, nextBtn])
        
        backBtn.snp.makeConstraints {
            $0.top.equalToSuperview().offset(60)
            $0.leading.equalToSuperview().offset(12)
            $0.width.height.equalTo(32)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(90)
            $0.centerX.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(15)
            $0.centerX.equalTo(titleLabel.snp.centerX)
        }
        
        userNameTextField.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(45)
        }
        
        nextBtn.snp.makeConstraints {
            $0.top.equalTo(userNameTextField.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(50)
        }
    }
}

// MARK: - Custom Methods
extension MakeUserNameViewController {
    
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
}
