//
//  InstagramBtn.swift
//  Instagram-CloneCoding
//
//  Created by EUNJU on 2022/04/21.
//

import UIKit

class InstagramBtn: UIButton {

    // MARK: - Properties
    var isActivated: Bool = false {
        didSet {
            self.backgroundColor = self.isActivated ? activatedBgColor : normalBgColor
            //self.setTitleColor(fontColor, for: .normal)
            self.isEnabled = isActivated
        }
    }
    
    private var normalBgColor: UIColor = .defaultBlue
    private var fontColor: UIColor = .white
    private var activatedBgColor: UIColor = .btnBlue
    
    init() {
        super.init(frame: .zero)
        setDefaultStyle()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setDefaultStyle()
    }
    
    // MARK: - Private Methods
    
    /// 디폴트 버튼 스타일 설정
    private func setDefaultStyle() {
        self.makeRounded(cornerRadius: 4.adjusted)
        self.titleLabel?.font = .SFProTextSB(size: 14)
        self.backgroundColor = self.normalBgColor
        //self.tintColor = UIColor.mainDefault
        self.setTitleColor(self.fontColor, for: .normal)
    }
    
    /// 버튼 타이틀과 스타일 변경 폰트 사이즈 adjusted 적용
    func setTitleWithStyle(title: String, size: CGFloat, weight: FontWeight = .regular) {
        let font: UIFont
        
        switch weight {
        case .regular:
            font = .SFProTextR(size: size.adjusted)
        case .medium:
            font = .SFProTextM(size: size.adjusted)
        case .bold:
            font = .SFProTextB(size: size.adjusted)
        case .semiBold:
            font = .SFProTextSB(size: size.adjusted)
        }
        
        self.titleLabel?.font = font
        self.setTitle(title, for: .normal)
    }

}
