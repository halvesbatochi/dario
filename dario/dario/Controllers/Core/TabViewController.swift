//
//  ViewController.swift
//  dario
//
//  Created by Henrique Alves Batochi on 19/04/23.
//

import UIKit

final class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabs()
    }
    
    private func setUpTabs() {
        let homeVC = HomeViewController()
        let historyVC = HistoryViewController()
        let profileVC = ProfileViewController()
        
        homeVC.navigationItem.largeTitleDisplayMode = .automatic
        historyVC.navigationItem.largeTitleDisplayMode = .automatic
        profileVC.navigationItem.largeTitleDisplayMode = .automatic
        
        let nav1 = UINavigationController(rootViewController: homeVC)
        let nav2 = UINavigationController(rootViewController: historyVC)
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

