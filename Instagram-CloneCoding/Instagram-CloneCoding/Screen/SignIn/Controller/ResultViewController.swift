//
//  ResultViewController.swift
//  Instagram-CloneCoding
//
//  Created by EUNJU on 2022/04/08.
//

import UIKit
import SnapKit
import Then

class ResultViewController: UIViewController {

    // MARK: - Properties
    private let messageLabel = UILabel().then {
        $0.text = "000님 Instagram에\n오신 것을 환영합니다"
        $0.font = .systemFont(ofSize: 24, weight: .regular)
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.sizeToFit()
        $0.setLineAndCharacterSpacing(lineSpacing: 4, characterSpacing: 1.2)
    }
    
    private let descriptionLabel = UILabel().then {
        $0.text = "언제든지 연락처 정보와 사용자 이름을 변경할 수 있습니다."
        $0.textColor = .gray
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.textAlignment = .center
        $0.sizeToFit()
    }
    
    private let completeBtn = UIButton().then {
        $0.setTitle("완료하기", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBlue
        $0.makeRounded(cornerRadius: 5.adjusted)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setUptapCompleteBtn()
    }
}

// MARK: - UI
extension ResultViewController {
    private func configureUI() {
        view.addSubviews([messageLabel, descriptionLabel, completeBtn])
        
        messageLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(300)
            $0.centerX.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(messageLabel.snp.bottom).offset(14)
            $0.centerX.equalTo(messageLabel.snp.centerX)
        }
        
        completeBtn.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(26)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(50)
        }
    }
}

// MARK: - Custom Methods
extension ResultViewController {
    
    /// 완료 버튼 tap Action 설정 메서드
    private func setUptapCompleteBtn() {
        completeBtn.press {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
