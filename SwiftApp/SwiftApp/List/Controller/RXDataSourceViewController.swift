//
//  RXDataSourceViewController.swift
//  SwiftApp
//
//  Created by apple on 2022/4/22.
//

import UIKit
import RxCocoa
import RxSwift

class RXDataSourceViewController: ZABaseViewController {

    let reuseId = "dataSource"
    let musicModel: MusicListViewModel = MusicListViewModel()//数据viewmodel
    //DisposeBag：作用是 Rx 在视图控制器或者其持有者将要销毁的时候，自动释法掉绑定在它上面的资源。它是通过类似“订阅处置机制”方式实现（类似于 NotificationCenter 的 removeObserver）。
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "RxSwift进阶";
        self.view.backgroundColor = UIColor.white
//        self.myTableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.plain)
        view.addSubview(mainTable)
        mainTable.delegate = self
        
        mainTable.frame = .init(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        mainTable.register(MineTableViewCell.self, forCellReuseIdentifier: "second")
        
        musicModel.data2.bind(to: mainTable.rx.items(cellIdentifier: "second", cellType: MineTableViewCell.self)) { (row, element, cell) in
            cell.nameLabel.text = element.name
            cell.singerLabel.text = element.singer
        }
            .disposed(by: disposeBag)
        // Do any additional setup after loading the view.
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

extension RXDataSourceViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row < 3 {
            return 100
        }else{
            return 50
        }
    }
}
