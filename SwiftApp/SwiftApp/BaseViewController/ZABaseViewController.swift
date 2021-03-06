//
//  ZABaseViewController.swift
//  SwiftApp
//
//  Created by quhong1v1 on 2022/3/11.
//

import UIKit



class ZABaseViewController: UIViewController {
    
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//
//        hidesBottomBarWhenPushed = true
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    
    
    lazy var mainTable : UITableView = {
        var tmpTable = UITableView()
         tmpTable.rowHeight = 50
         tmpTable.backgroundColor = .clear
         tmpTable.separatorStyle = .none
         tmpTable.frame = .init(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
         return tmpTable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// 如果所有的 ChildViewController 都继承于 BaseViewController，且想在 viewDidLoad 中统一设置导航栏的『左按钮』，
        /// 那么，只能设置 backBarButtonItem ，而不能设置 leftBarButtonItem，原因如下：
        ///
        /// previousVC 是上一个页面，nextVC 是下一个页面，当发生 push 时，有如下规则：
        /// 1、如果 nextVC 的 leftBarButtonItem != nil，那么将在 navigationBar 的左边显示 nextVC 指定的 leftBarButtonItem；
        /// 2、如果 nextVC 的 leftBarButtonItem == nil，previousVC 的 backBarButtonItem != nil，那么将在 navigationBar 的左边显示 previousVC 指定的 backBarButtonItem；
        /// 3、如果两者都为 nil 则：
        ///   3.1、nextVC 的 navigationItem.hidesBackButton = YES，那么 navigationBar 将隐藏左侧按钮；
        ///   3.2、否则 navigationBar的左边将显示系统提供的默认返回按钮；
        ///
        /// 我们从以上规则中发现：
        /// 1、leftBarButtonItem 的优先级比 backBarButtonItem 要高；
        /// 2、backBarButtonItem 是来自上一个页面，如果当前 VC 是第一个页面，那么它没有上一个页面，也就没有 backBarButtonItem；
        /// 3、leftBarButtonItem 是来自当前页面，与上个页面无关，因此，如果当前 VC 是第一个页面，那么设置了 leftBarButtonItem 就会很奇怪；
        ///
//        if #available(iOS 14.0, *) {
//            navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "返回", image: UIImage(), primaryAction: nil, menu: nil)
//        } else {
//            // Fallback on earlier versions
//            let  leftBarBtn =  UIBarButtonItem (title:  "" , style: .plain , target:  self , action: #selector(backToPrevious))
//            leftBarBtn.image =  UIImage (named:  "back" )
//            
////            //用于消除左边空隙，要不然按钮顶不到最前面
////            let  spacer =  UIBarButtonItem (barButtonSystemItem: .FixedSpace, target:  nil , action:  nil )
////            spacer.width = -10;
//            self .navigationItem.leftBarButtonItems = [leftBarBtn]
//        }
        
//        navigationItem.backBarButtonItem?.tintColor = .black
//        
//        // 设置导航栏背景为透明色图片
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        // 设置导航栏阴影为透明色图片
//        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    //返回按钮点击响应
    @objc func  backToPrevious(){
        self .navigationController?.popViewController( animated: true )
    }
    
    
    // 添加自定义导航栏背景
    func addNavBar(_ color: UIColor) {
        // 目前有点小瑕疵，高度是写死的，并没有考虑到 SafeArea
        // 我会在之后的一篇中分析 SafeArea 时，给出如何正确的适配不同机型
        let size = CGSize(width: view.bounds.width, height: SAFE_TOP_HEIGHT)
//        let size = CGSize.init(width: view.bounds.width, height: SAFE_TOP_HEIGHT)
        let navImageView = UIImageView(image: UIImage(size: size, color: color))
        view.addSubview(navImageView)
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


