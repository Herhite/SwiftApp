//
//  FirstController.swift
//  SwiftApp
//
//  Created by quhong1v1 on 2022/3/11.
//

import UIKit

class FirstController: ZABaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.backgroundColor = .red
//        title = "Home"
        
//        navigationController?.isNavigationBarHidden = true
               
//        let label = UILabel(frame: CGRect.zero)
//        label.text = "HomeViewController"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(label)

        
        
        let btn = UIButton.init(type: .custom)
        btn.setTitle("PUSH", for: .normal)
        btn.frame = CGRect.init(x: 100, y: 100, width: 200, height: 200)
        btn.addTarget(self, action: #selector(pushTestVC), for: .touchUpInside)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.textAlignment = .center
        view.addSubview(btn)
        
//        NSLayoutConstraint.activate([
//            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            btn.topAnchor.constraint(equalTo: label.bottomAnchor),
//            btn.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        ])

        // Do any additional setup after loading the view.
    }
    
    
    @objc func pushTestVC(btn:UIButton){
        let testVc = TestViewController()
        navigationController?.pushViewController(testVc, animated: true)
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
