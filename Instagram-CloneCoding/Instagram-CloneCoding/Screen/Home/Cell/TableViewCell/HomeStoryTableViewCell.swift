//
//  HomeStoryTableViewCell.swift
//  Instagram-CloneCoding
//
//  Created by EUNJU on 2022/05/06.
//

import UIKit
import SnapKit
import Then

class HomeStoryTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    private let storyCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 4
        $0.collectionViewLayout = layout
        $0.backgroundColor = .white
        $0.contentInset = UIEdgeInsets.init(top: 4, left: 6, bottom: 12, right: 4)
        $0.showsHorizontalScrollIndicator = false
    }
    
    private let lineView = UIView().then {
        $0.backgroundColor = UIColor(red: 0.925, green: 0.925, blue: 0.925, alpha: 1)
    }

    // MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        registerCell()
        setUpCollectionView()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - UI
extension HomeStoryTableViewCell {
    private func configureUI() {
        contentView.addSubviews([lineView, storyCollectionView])
        
        lineView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        storyCollectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(lineView.snp.top)
        }
    }
}

// MARK: - Custom Methods
extension HomeStoryTableViewCell {
    private func registerCell() {
        storyCollectionView.register(ProfileCollectionViewCell.self, forCellWithReuseIdentifier: ProfileCollectionViewCell.className)
    }
    
    private func setUpCollectionView() {
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeStoryTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        
        let cellWidth = width * (58/375)
        let cellHeight = cellWidth * (72/58)
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
}

// MARK: - UICollectionViewDataSource
extension HomeStoryTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ProfileDataModel.dummyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.className, for: indexPath) as? ProfileCollectionViewCell else { return UICollectionViewCell() }
        
        cell.setData(model: ProfileDataModel.dummyData[indexPath.row])
        return cell
    }
}

