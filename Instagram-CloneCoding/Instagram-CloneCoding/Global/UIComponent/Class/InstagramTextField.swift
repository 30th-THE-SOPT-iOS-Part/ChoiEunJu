//
//  InstagramTextField.swift
//  Instagram-CloneCoding
//
//  Created by EUNJU on 2022/04/21.
//

import UIKit

class InstagramTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setDefaultStyle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setDefaultStyle()
    }
    
    // MARK: - Private Methods
    
    /// 디폴트 스타일 설정
    private func setDefaultStyle() {
        self.makeRounded(cornerRadius: 4.adjusted)
        self.font = .SFProTextR(size: 14)
        self.attributedPlaceholder = NSAttributedString(string: UITextPlaceholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.btnBlue])
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.strokeBlack.cgColor
        self.backgroundColor = .lightGray
    }
}
