//
//  ProfileCollectionViewCell.swift
//  Instagram-CloneCoding
//
//  Created by EUNJU on 2022/05/06.
//

import UIKit
import SnapKit
import Then

class ProfileCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    private let profileImgView = UIImageView()
    private let userNameLabel = UILabel().then {
        $0.font = .SFProTextM(size: 10)
        $0.textAlignment = .center
        $0.sizeToFit()
    }
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

// MARK: - UI
extension ProfileCollectionViewCell {
    private func configureUI() {
        contentView.addSubviews([profileImgView, userNameLabel])
        
        profileImgView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(6)
            $0.leading.trailing.equalToSuperview().inset(5)
            $0.width.height.equalTo(48)
        }
        
        userNameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImgView.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview().inset(5)
        }
        
        contentView.backgroundColor = .white
    }
}

// MARK: - Custom Methods
extension ProfileCollectionViewCell {
    func setData(model: ProfileDataModel) {
        profileImgView.image = model.makeProfileImg()
        userNameLabel.text = model.userName
    }
}
