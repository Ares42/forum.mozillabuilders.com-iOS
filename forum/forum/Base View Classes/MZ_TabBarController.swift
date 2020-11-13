//
//  MZ_TabBarController.swift
//  forum
//
//  Created by Luke Solomon on 11/12/20.
//

import UIKit

class MZ_TabBarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if #available(iOS 13, *) {
      let appearance = UITabBarAppearance()
      appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
      appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.blue]
      appearance.stackedLayoutAppearance.normal.badgeBackgroundColor = UIColor.white
      appearance.backgroundColor = UIColor.white
      tabBar.standardAppearance = appearance
      tabBar.isTranslucent = false
    } else {
      let appearance = UITabBarItem.appearance(whenContainedInInstancesOf: [MZ_TabBarController.self])
      appearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
      appearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.blue], for: .selected)
      tabBar.backgroundColor = UIColor.black
    }
    
    let viewcontroller = FeedViewController()
    let postNavigationController = UINavigationController(rootViewController: viewcontroller)
    
    self.viewControllers = [postNavigationController]
    
    self.selectedViewController = postNavigationController
    self.tabBar.barTintColor = UIColor.black
    self.tabBar.backgroundColor = UIColor.black
  }
  
}
