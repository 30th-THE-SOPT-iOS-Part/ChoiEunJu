//
//  HomeViewController.swift
//  Instagram-CloneCoding
//
//  Created by EUNJU on 2022/04/21.
//

import UIKit
import SnapKit
import Then

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    private let naviView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private let logoImgView = UIImageView().then {
        $0.image = UIImage(named: "logo_instagram_small")
    }

    private let addPostBtn = UIButton().then {
        $0.setImage(UIImage(named: "icn_add"), for: .normal)
    }
    
    private let likeListBtn = UIButton().then {
        $0.setImage(UIImage(named: "icn_unlike"), for: .normal)
    }
    
    private let directMessageBtn = UIButton().then {
        $0.setImage(UIImage(named: "icn_share"), for: .normal)
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
}

// MARK: - UI
extension HomeViewController {
    private func configureUI() {
        view.addSubviews([naviView])
        naviView.addSubviews([logoImgView, addPostBtn, likeListBtn, directMessageBtn])
        
        naviView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(94)
        }
        
        logoImgView.snp.makeConstraints {
            $0.leading.equalTo(naviView).inset(14)
            $0.bottom.equalTo(naviView).inset(8)
            $0.width.equalTo(96)
            $0.height.equalTo(27)
        }
        
        directMessageBtn.snp.makeConstraints {
            $0.trailing.equalTo(naviView).inset(14)
            $0.bottom.equalTo(naviView).inset(9)
            $0.width.height.equalTo(24)
        }
        
        likeListBtn.snp.makeConstraints {
            $0.trailing.equalTo(directMessageBtn.snp.leading).offset(-16)
            $0.bottom.equalTo(directMessageBtn.snp.bottom)
            $0.width.height.equalTo(24)
        }
        
        addPostBtn.snp.makeConstraints {
            $0.trailing.equalTo(likeListBtn.snp.leading).offset(-16)
            $0.bottom.equalTo(likeListBtn.snp.bottom)
            $0.width.height.equalTo(24)
        }
    }
}
