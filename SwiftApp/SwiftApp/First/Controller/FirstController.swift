//
//  FirstController.swift
//  SwiftApp
//
//  Created by quhong1v1 on 2022/3/11.
//

import UIKit
import RxSwift
import RxCocoa

class FirstController: ZABaseViewController {

    let disposeBag = DisposeBag()
    let musicListViewModel = MusicListViewModel()
    
    lazy var table : UITableView = {
       var tmpTable = UITableView()
        tmpTable.rowHeight = 50
        tmpTable.backgroundColor = .clear
        tmpTable.separatorStyle = .none
//        tmpTable.dataSource = self
//        tmpTable.delegate = self
        tmpTable.frame = .init(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        tmpTable.register(MineTableViewCell.self, forCellReuseIdentifier: "musicCell")
        return tmpTable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        //将数据源数据绑定到tableView上
//        musicListViewModel.data2.bind(to: table.rx.items(cellIdentifier: <#T##String#>, cellType: <#T##Cell.Type#>))
        view.addSubview(table)
        musicListViewModel.data2.bind(to: table.rx.items) { (tb, row, model) -> MineTableViewCell in
            
            let cell = tb.dequeueReusableCell(withIdentifier: "musicCell") as? MineTableViewCell
            cell?.singerLabel.text = model.singer
            cell?.nameLabel.text = model.name
            return cell!
            }
            .disposed(by: disposeBag)
//        table.isEditing = true
        table.rx.itemSelected
            .subscribe(onNext: { indexPath in
                print("选中项的indexPath为：\(indexPath)")
            })
            .disposed(by: disposeBag)
        table.rx.modelSelected(Music.self)
            .subscribe(onNext:{ (model) in
                print("点击了\(model.name):\(model.singer)")
            })
            .disposed(by: disposeBag)
        
        table.rx.itemDeleted
            .subscribe(onNext: { (indexPath) in
                print("删除 \(indexPath)")
            })
            .disposed(by: disposeBag)
        
        table.rx.itemMoved
            .subscribe(onNext: { (soureIndex,destiIndex) in
                print("从 \(soureIndex)移动到 \(destiIndex)")
            })
            .disposed(by: disposeBag)
        
        table.rx.itemInserted
            .subscribe(onNext: { indexPath in
                print("从 \(indexPath) 插入")
            })
            .disposed(by: disposeBag)
        
//        view.backgroundColor = .red
//        title = "Home"
        
//        navigationController?.isNavigationBarHidden = true
               
//        rxswiftPractice()
        
//        let helloSequence = Observable.of("Hello Rx")
//            .subscribe { event in
//                print(event)
//            }
//
//        let helloSequence2 = Observable.from(["h","e","l","l","0"])
//
//        let dicSequence = Observable.from(["1":"one","2":"two"]).subscribe { Event in
//            print(Event)
//        }
//
//          let subscription = helloSequence2.subscribe { event in
//                    switch event {
//                        case .next(let value):
//                            print(value)
//                        case .error(let error):
//                            print(error)
//                        case .completed:
//                            print("completed")
//                    }
//                  }
//                   .disposed(by: disposeBag)

        
        
        // Do any additional setup after loading the view.
    }
    
    func rxswiftPractice(){
        let numbers: Observable<Int> = Observable.create { observer -> Disposable in

            observer.onNext(0)
            observer.onNext(1)
            observer.onNext(2)
            observer.onNext(3)
            observer.onNext(4)
            observer.onNext(5)
            observer.onNext(6)
            observer.onNext(7)
            observer.onNext(8)
            observer.onNext(9)
            observer.onCompleted()

            return Disposables.create()
        }
    }
    
    func setupUI() {
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
