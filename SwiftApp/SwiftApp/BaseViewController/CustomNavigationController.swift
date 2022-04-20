//
//  CustomNavigationController.swift
//  SwiftApp
//
//  Created by quhong1v1 on 2022/3/11.
//

import UIKit

class CustomNavigationController: UINavigationController,UINavigationControllerDelegate {
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        za_init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func za_init(){
        if #available(iOS 11.0, *) {
            self.navigationBar.prefersLargeTitles = false
        } else {
            // Fallback on earlier versions
        }
        
        if #available(iOS 13.0, *) {
            let apperance = UINavigationBarAppearance.init()
            apperance.configureWithOpaqueBackground()
            self.navigationBar.standardAppearance = apperance
            self.navigationBar.scrollEdgeAppearance = apperance
        } else {
            // Fallback on earlier versions
        }
        
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // 重写 pushViewController 方法，不修改 pushViewController 的逻辑
        // 仅在跳转前，判断目标 VC 是否为一级页面还是二级页面，通过 viewControllers.count 来判断：
        // viewControllers.count > 0，那么目标 VC 肯定是第二个页面（即二级页面）；我们就添加上 hidesBottomBarWhenPushed = true
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    
//    override func popViewController(animated: Bool) -> UIViewController? {
//        super.popViewController(animated: animated)
//        var vc : ZABaseViewController?
//        if viewControllers.count > 0 {
//            vc = viewControllers.last as? ZABaseViewController
//            vc!
//        }
//        
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
enum barStyle {
    case normal
    case clear
    case white
}

extension UINavigationController{
    func barStyle(_ style: barStyle) {
        switch style {
        case .normal:
            navigationBar.barStyle = .black
            navigationBar.setBackgroundImage(UIImage(named: "nav_bg"), for: .default)
            navigationBar.shadowImage = UIImage()
        case .clear:
            navigationBar.barStyle = .black
            navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationBar.shadowImage = UIImage()
        case .white:
            navigationBar.barStyle = .default
            navigationBar.setBackgroundImage(UIColor.white.image(), for: .default)
            navigationBar.shadowImage = nil
        }
        
        
    }
    
    
}
