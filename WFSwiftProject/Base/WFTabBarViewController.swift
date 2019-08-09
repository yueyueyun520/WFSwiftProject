//
//  WFTabBarViewController.swift
//  WFSwiftProject
//
//  Created by efun on 2019/6/21.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

class WFTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.tabBar.tintColor = UIColor.clear
        self.addChildViewController(viewController: WFDynamicViewController(), defaultImageName: "wf_tab_discover", selectImageName: "wf_tab_discover_selected", title: "动态")
        self.addChildViewController(viewController: WFMeViewController(), defaultImageName: "wf_tab_user", selectImageName: "wf_tab_user_selected", title: "我的")
        
        
        
    }
    
    func addChildViewController(viewController:UIViewController,defaultImageName:String,selectImageName:String,title:String){
        let defaultImage = UIImage(named: defaultImageName)?.withRenderingMode(.alwaysOriginal)
        let selectImage = UIImage(named: selectImageName)?.withRenderingMode(.alwaysOriginal)
        let tabbarItem = UITabBarItem(title: title, image: defaultImage, selectedImage: selectImage)
        tabbarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.gray], for: .normal)
        tabbarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:MAIN_COLOR], for: .selected)
        viewController.tabBarItem = tabbarItem
        let nav = WFNavigationController(rootViewController: viewController)
        self.addChild(nav)
    }

}
extension WFTabBarViewController:UITabBarControllerDelegate{

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
    }
}


