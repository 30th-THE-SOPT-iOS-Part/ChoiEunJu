//
//  InstagramTabBarController.swift
//  Instagram-CloneCoding
//
//  Created by EUNJU on 2022/04/21.
//

import UIKit

class InstagramTabBarController: UITabBarController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }
}

// MARK: - UI
extension InstagramTabBarController {
    func makeTabBar(vc: UIViewController , tabBarImg: String, tabBarSelectedImg: String, renderingMode: UIImage.RenderingMode) -> UIViewController {

        let tab = UINavigationController(rootViewController: vc)
        tab.tabBarItem = UITabBarItem(title: "", image: UIImage(named: tabBarImg)?.withRenderingMode(renderingMode), selectedImage: UIImage(named: tabBarSelectedImg)?.withRenderingMode(renderingMode))
        
        return tab
    }
    
    func configureTabBar() {
        let homeTab = makeTabBar(vc: HomeViewController(), tabBarImg: "icn_home", tabBarSelectedImg: "icn_home_selected", renderingMode: .alwaysTemplate)
        let searchTab = makeTabBar(vc: SearchViewController(), tabBarImg: "icn_search", tabBarSelectedImg: "icn_search_selected", renderingMode: .alwaysTemplate)
        let videoTab = makeTabBar(vc: VideoViewController(), tabBarImg: "icn_reels", tabBarSelectedImg: "icn_reels_selected", renderingMode: .alwaysTemplate)
        let shopTab = makeTabBar(vc: ShopViewController(), tabBarImg: "icn_shop", tabBarSelectedImg: "icn_shop_selected", renderingMode: .alwaysTemplate)
        let mypageTab = makeTabBar(vc: MypageViewController(), tabBarImg: "icn_profile", tabBarSelectedImg: "icn_profile_selected", renderingMode: .alwaysOriginal)
        
        /// 탭 구성
        let tabs = [homeTab, searchTab, videoTab, shopTab, mypageTab]
        
        /// ViewController에 루트로 설정
        self.setViewControllers(tabs, animated: false)
        
        tabBar.backgroundColor = .white
        
    }
}
