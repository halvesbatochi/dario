//
//  ViewController.swift
//  dario
//
//  Created by Henrique Alves Batochi on 19/04/23.
//

import UIKit

/// Controller to house tans and root tab controllers
final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabs()
    }
    
    private func setUpTabs() {
        let homeVC = HomeViewController()
        let timelineVC = TimeLineViewController()
        let profileVC = DRProfileViewController()
        
        homeVC.navigationItem.largeTitleDisplayMode = .always
        timelineVC.navigationItem.largeTitleDisplayMode = .automatic
        profileVC.navigationItem.largeTitleDisplayMode = .automatic
        
        let nav1 = UINavigationController(rootViewController: homeVC)
        let nav2 = UINavigationController(rootViewController: timelineVC)
        let nav3 = UINavigationController(rootViewController: profileVC)
        
        nav1.tabBarItem = UITabBarItem(title: "Home",
                                       image: UIImage(systemName: "house.fill"),
                                       tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Histórico",
                                       image: UIImage(systemName: "bookmark.fill"),
                                       tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Perfil",
                                       image: UIImage(systemName: "person.fill"),
                                       tag: 3)
        
        for nav in [nav1, nav2, nav3] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers(
            [nav1, nav2, nav3],
            animated: true
        )
    }
}

