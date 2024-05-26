//
//  TabbarVC.swift
//  CarRentalApp
//
//  Created by Seymur Naim on 19.05.24.
//

import UIKit

class TabbarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .white
        
        let homeViewController = HomeVC()
        homeViewController.tabBarItem = UITabBarItem(title: "Vehicles", image: UIImage(systemName: "car"), tag: 0)
        
        let searchViewController = SearchVC()
        searchViewController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        
        let accountViewController = ProfileVC()
        accountViewController.tabBarItem = UITabBarItem(title: "Account", image: UIImage(systemName: "person"), tag: 2)
        
        let tabBarList = [homeViewController, searchViewController, accountViewController]
        
        viewControllers = tabBarList.map { UINavigationController(rootViewController: $0) }
    }

}


