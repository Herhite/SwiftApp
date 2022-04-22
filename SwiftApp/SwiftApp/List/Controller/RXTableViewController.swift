//
//  RXTableViewController.swift
//  SwiftApp
//
//  Created by apple on 2022/4/21.
//

import UIKit
import RxSwift
import RxCocoa

class RXTableViewController: ZABaseViewController {

    lazy var tableView: UITableView = UITableView()
        let reuserId:String = "cell"//重用标识
        let musicModel: MusicListViewModel = MusicListViewModel()//数据viewmodel
        //DisposeBag：作用是 Rx 在视图控制器或者其持有者将要销毁的时候，自动释法掉绑定在它上面的资源。它是通过类似“订阅处置机制”方式实现（类似于 NotificationCenter 的 removeObserver）。
        let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        
        // Do any additional setup after loading the view.
    }
    
    func configUI() {
        view.addSubview(mainTable)
        mainTable.frame = .init(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        mainTable.register(MineTableViewCell.self, forCellReuseIdentifier: "second")
        musicModel.data2.bind(to: mainTable.rx.items(cellIdentifier: "second", cellType: MineTableViewCell.self)) { (row, element, cell) in
            cell.nameLabel.text = element.name
            cell.singerLabel.text = element.singer
        }
            .disposed(by: disposeBag)
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
