//
//  HomePostTableViewCell.swift
//  Instagram-CloneCoding
//
//  Created by EUNJU on 2022/05/05.
//

import UIKit
import SnapKit
import Then

class HomePostTableViewCell: UITableViewCell {

    // MARK: - Properties
    private let profileBtn = UIButton()
    
    private let userNameLabel = UILabel().then {
        $0.font = .SFProTextM(size: 12)
        $0.textAlignment = .center
        $0.sizeToFit()
    }
    
    private let moreBtn = UIButton().then {
        $0.setImage(UIImage(named: "icn_more"), for: .normal)
    }
    
    private let mainImgView = UIImageView()
    
    private let likeBtn = UIButton().then {
        $0.setImage(UIImage(named: "icn_unlike"), for: .normal)
    }
    
    private let commentBtn = UIButton().then {
        $0.setImage(UIImage(named: "icn_comment"), for: .normal)
    }
    
    private let shareBtn = UIButton().then {
        $0.setImage(UIImage(named: "icn_share"), for: .normal)
    }
    
    private let bookMarkBtn = UIButton().then {
        $0.setImage(UIImage(named: "icn_bookmark"), for: .normal)
    }
    
    private let likeCountLabel = UILabel().then {
        $0.font = .SFProTextSB(size: 10)
        $0.textAlignment = .left
        $0.sizeToFit()
    }
    
    private let contentLabel = UILabel().then {
        $0.font = .SFProTextM(size: 10)
        $0.numberOfLines = 0
        $0.sizeToFit()
    }
    
    private let commentLabel = UILabel().then {
        $0.font = .SFProTextM(size: 10)
        $0.textColor = .textGray
        $0.sizeToFit()
    }
    
    // MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomePostTableViewCell {
    private func configureUI() {
        contentView.addSubviews([profileBtn, userNameLabel, moreBtn, mainImgView, likeBtn, commentBtn, shareBtn, bookMarkBtn, likeCountLabel, contentLabel, commentLabel])
        
        profileBtn.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(6)
            $0.height.width.equalTo(24)
        }
        
        userNameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileBtn.snp.trailing).offset(6)
            $0.centerY.equalTo(profileBtn.snp.centerY)
        }
        
        moreBtn.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(10)
            $0.height.width.equalTo(24)
        }
        
        mainImgView.snp.makeConstraints {
            $0.top.equalTo(profileBtn.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview()
        }
        
        likeBtn.snp.makeConstraints {
            $0.top.equalTo(mainImgView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(10)
            $0.height.width.equalTo(24)
        }
        
        commentBtn.snp.makeConstraints {
            $0.leading.equalTo(likeBtn.snp.trailing).offset(10)
            $0.centerY.equalTo(likeBtn.snp.centerY)
            $0.height.width.equalTo(24)
        }
        
        shareBtn.snp.makeConstraints {
            $0.leading.equalTo(commentBtn.snp.trailing).offset(10)
            $0.centerY.equalTo(commentBtn.snp.centerY)
            $0.height.width.equalTo(24)
        }
        
        bookMarkBtn.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(10)
            $0.top.equalTo(mainImgView.snp.bottom).offset(8)
            $0.height.width.equalTo(24)
        }
        
        likeCountLabel.snp.makeConstraints {
            $0.top.equalTo(likeBtn.snp.bottom).offset(11)
            $0.leading.equalToSuperview().inset(12)
            $0.height.equalTo(12)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(likeCountLabel.snp.bottom).offset(5)
            $0.leading.equalTo(likeCountLabel.snp.leading)
            $0.trailing.equalToSuperview().inset(12)
        }
        
        commentLabel.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(4)
            $0.leading.equalTo(contentLabel.snp.leading)
            $0.bottom.equalToSuperview().inset(12)
            $0.height.equalTo(12)
        }
    }
}

// MARK: - Custom Methods
extension HomePostTableViewCell {
    func setData(model: PostDataModel) {
        profileBtn.setImage(UIImage(named: model.profileImgName), for: .normal)
        userNameLabel.text = model.userName
        mainImgView.image = model.makePostImg()
        likeCountLabel.text = model.makelikeData()
        contentLabel.text = model.userName + " " + model.content
        commentLabel.text = model.makeCommentData()
        
        let attr = NSMutableAttributedString(string: contentLabel.text!)
        attr.addAttribute(.font, value: UIFont.SFProTextM(size: 12)!, range: (contentLabel.text! as NSString).range(of: model.userName))
        attr.addAttribute(.font, value: UIFont.SFProTextM(size: 10)!, range: (contentLabel.text! as NSString).range(of: model.content))
        
        contentLabel.attributedText = attr
    }
}
