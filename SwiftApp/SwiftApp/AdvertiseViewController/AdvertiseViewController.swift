//
//  AdvertiseViewController.swift
//  SwiftApp
//
//  Created by quhong1v1 on 2022/3/12.
//

import UIKit

class AdvertiseViewController: ZABaseViewController {
    
    /// 懒加载 定时器
    lazy var timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.global())
    /// 倒计时时间
    var seconds = 5
    let timerLabel = UILabel.init(frame: CGRect.init(x: 10, y: 150, width: SCREEN_WIDTH, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        view.addSubview(timerLabel)
//        timerLabel.text = String(seconds) + "s" // int 型转为 string
        timerLabel.text = "\(seconds) s";// int 型转为 string
        timerLabel.textColor = .white
        timerLabel.textAlignment = .center
        timeCountDown()
        // Do any additional setup after loading the view.
    }
    
    func timeCountDown() {
          timer.schedule(deadline: .now(), repeating: .seconds(1))
          timer.setEventHandler(handler: {
              DispatchQueue.main.async { [weak self] in
                  
                  // 小于等于 0 时，结束 timer，并进行两个 rootViewController 的切换
                  if self!.seconds <= 0 {
                      self!.terminer()
                  }else{
                      self!.seconds -= 1
                      self?.timerLabel.text = "\(self!.seconds) s";
                  }
              }
          })
          timer.resume()
      }
    
    func terminer() {
        timer.cancel()
//        switchRootController()
        switchWindow()
    }
    
    // 一个 window 的情况：只用切换 rootViewController 就行
    func switchRootController() {
        let window = UIApplication.shared.windows.first!
        
        // 过渡动画：0.5s 淡出
        UIView.transition(with: window,
                          duration: 0.5,
                          options: .transitionCrossDissolve,
                          animations: {
            
            let old = UIView.areAnimationsEnabled
            UIView.setAnimationsEnabled(false)
            window.rootViewController = ZATabBarController()
            UIView.setAnimationsEnabled(old)
        }, completion: { _ in
            // Do Nothing
        })
    }
    
    // 同样两种方式可以实现：广告页 -> 主页面：
       // 1. 两个 window 来分别控制不同的业务，然后基于过渡动画来切换 window；
       // 2. 一个 window，两个 vc，分别是 主vc 和 广告vc，通过修改 window.rootViewController 来完成；
    func switchWindow() {
        // 第2个 window（广告窗口）
        let window = UIApplication.shared.windows.last!
        
//        UIView.transition(with: window, duration: 2.0, options: .transitionCrossDissolve) {
//            window.alpha = 0
//        } completion: { _ in
//            // 切换到主 window，即我们的 ZATabBarController
//            UIApplication.shared.windows.first?.makeKeyAndVisible()
//        }

        // 过渡动画：淡出
        UIView.transition(with: window,
                          duration: 0.5,
                          options: .transitionCrossDissolve,
                          animations: {
            
            // 临时保存 UIView 是否开启动画的状态（默认是开启）
            // 之所以先禁止，是防止存在其它动画影响了当前动画
            // ----------------------------------------
            // 设置了禁止动画后：
            // 1. 当前所有正在执行动画的没有任何影响
            // 2. 未执行的将不会执行动画
            // ----------------------------------------
            // 因为我们这个回调是动画已经开始，所以，并不会被强制停止,
            // 最后再恢复 UIView 是否开启动画的状态即可
            let old = UIView.areAnimationsEnabled
            UIView.setAnimationsEnabled(false)
            window.alpha = 0
            UIView.setAnimationsEnabled(old)
            
        }, completion: { _ in
            // 切换到主 window，即我们的 ZATabBarController
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        })
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
