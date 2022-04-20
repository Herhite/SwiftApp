//
//  FourthViewController.swift
//  SwiftApp
//
//  Created by quhong1v1 on 2022/3/11.
//

import UIKit

class FourthViewController: ZABaseViewController {

    private lazy var myArray: Array = {
        return [[["icon":"mine_vip", "title": "我的VIP"],
                 ["icon":"mine_coin", "title": "充值妖气币"]],
                
                [["icon":"mine_accout", "title": "消费记录"],
                 ["icon":"mine_subscript", "title": "我的订阅"],
                 ["icon":"mine_seal", "title": "我的封印图"]],
                
                [["icon":"mine_message", "title": "我的消息/优惠券"],
                 ["icon":"mine_cashew", "title": "妖果商城"],
                 ["icon":"mine_freed", "title": "在线阅读免流量"]],
                
                [["icon":"mine_feedBack", "title": "帮助中心"],
                 ["icon":"mine_mail", "title": "我要反馈"],
                 ["icon":"mine_judge", "title": "给我们评分"],
                 ["icon":"mine_author", "title": "成为作者"],
                 ["icon":"mine_setting", "title": "设置"]]]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(table)
        // Do any additional setup after loading the view.
    }
    
    lazy var table : UITableView = {
       var tmpTable = UITableView()
        tmpTable.rowHeight = 50
        tmpTable.backgroundColor = .clear
        tmpTable.separatorStyle = .none
        tmpTable.dataSource = self
        tmpTable.delegate = self
        tmpTable.frame = .init(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        return tmpTable
    }()
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension FourthViewController:UITableViewDelegate,UITableViewDataSource{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y >= 20 {
            navigationController?.barStyle(.normal)
        }else{
            navigationController?.barStyle(.clear)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MineTableViewCell.dequeCell(table: tableView)
        cell.iconImageV.image = UIImage.init(named: myArray[indexPath.section][indexPath.row]["icon"]!)
        cell.nameLabel.text = myArray[indexPath.section][indexPath.row]["title"]!
        cell.accessoryType = .disclosureIndicator //箭头
        //checkmark ✅
        //detailDisclosureButton ?
        //disclosureIndicator 箭头
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footView = UIView.init(frame: .init(x: 0, y: 0, width: view.frame.size.width, height: 10))
        footView.backgroundColor = .lightGray
        return footView
    }
    
    
}
