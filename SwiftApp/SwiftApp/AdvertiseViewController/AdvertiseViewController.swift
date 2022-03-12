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
        timerLabel.text = String(seconds) + "s"
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
                  }
                  self!.seconds -= 1
                  self?.timerLabel.text = String(self!.seconds) + "s"
              }
          })
          timer.resume()
      }
    
    func terminer() {
        timer.cancel()
        switchRootController()
    }
    
    //
    // 一个 window 的情况：只用切换 rootViewController 就行
    //
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
