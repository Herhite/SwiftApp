//
//  ZATabBarController.swift
//  SwiftApp
//
//  Created by quhong1v1 on 2022/3/11.
//

import UIKit

class ZATabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initTabBar()
        // Do any additional setup after loading the view.
    }
    
    func initTabBar() -> Void {
        let firstVc = FirstController()
        
        firstVc.tabBarItem.image = UIImage.init(named: "tabbar_icon_home_normal")
        firstVc.tabBarItem.selectedImage = UIImage.init(named: "tabbar_icon_home_highlighted")?.withRenderingMode(.alwaysOriginal)
        let firstNavi = CustomNavigationController.init(rootViewController: firstVc)
        firstVc.title = "HOME"
        
        
        let secondVc = SecondViewController()
        
        secondVc.tabBarItem.image = UIImage.init(named: "tabbar_icon_live_normal")
        secondVc.tabBarItem.selectedImage = UIImage(named: "tabbar_icon_live_highlighted")?.withRenderingMode(.alwaysOriginal)
        let secondNavi = CustomNavigationController.init(rootViewController: secondVc)
        secondNavi.title = "LIVE" //    只设置导航栏标题
        secondVc.tabBarItem.title = "LIVE" //只设置tabBar标题
        secondVc.title = "LIVE" //设置全部title
        
        let thirdVc = ThirdViewController()
//        thirdVc.tabBarItem.title = "MATCH"
        thirdVc.tabBarItem.image = UIImage.init(named: "tabbar_icon_match_normal")
        thirdVc.tabBarItem.selectedImage = UIImage.init(named: "tabbar_icon_match_highlighted")?.withRenderingMode(.alwaysOriginal)
        let thirdNavi = CustomNavigationController.init(rootViewController: thirdVc)
        thirdVc.title = "MATCH"
        
        let fourthVc = FourthViewController()
        fourthVc.title = "MINE"
        fourthVc.tabBarItem.image = UIImage.init(named: "tabbar_icon_me_normal")
        fourthVc.tabBarItem.selectedImage = UIImage.init(named: "tabbar_icon_me_highlighted")?.withRenderingMode(.alwaysOriginal)
        let fourthNavi = CustomNavigationController.init(rootViewController: fourthVc)
        
        viewControllers = [firstNavi,secondNavi,thirdNavi,fourthNavi]
        setTabBarItemAttributes()
        
    }
    
    /// 这种方式比较灵活
    func setTabBarItemAttributes(fontName: String = "Courier",
                                 fontSize: CGFloat = 14,
                                 normalColor: UIColor = .gray,
                                 selectedColor: UIColor = .black,
                                 bgColor: UIColor = .black) {
        // tabBarItem 文字大小
        var attributes: [NSAttributedString.Key: Any] = [.font: UIFont(name: fontName, size: fontSize)!]
        
        // tabBarItem 文字默认颜色
        attributes[.foregroundColor] = normalColor
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .normal)
        
        // tabBarItem 文字选中颜色
        attributes[.foregroundColor] = selectedColor
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .selected)
       
//        UINavigationBar.appearance().isHidden = true
        
        // tabBar 文字、图片 统一选中高亮色
//        tabBar.tintColor = selectedColor
        
        // tabBar 背景色
        tabBar.barTintColor = .white
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
