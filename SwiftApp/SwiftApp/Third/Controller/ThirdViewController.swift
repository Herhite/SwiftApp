//
//  ThirdViewController.swift
//  SwiftApp
//
//  Created by quhong1v1 on 2022/3/11.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift
import Alamofire
import JXSegmentedView



class ThirdViewController: ZABaseViewController {
    
    let label = UILabel(frame: CGRect.zero)
    let titles = ["许嵩","其他歌手"]
    var segmentSource: JXSegmentedTitleDataSource!
    var segmentedView: JXSegmentedView!
    var listContainerView: JXSegmentedListContainerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        label.text = "MatchViewController"
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(view)
        }
        // Do any additional setup after loading the view.
       
        //1、初始化JXSegmentedView
        segmentedView = JXSegmentedView()
        segmentedView.delegate = self
        view.addSubview(segmentedView)
        
        segmentSource = JXSegmentedTitleDataSource()
        segmentSource.titles = titles
        segmentSource.isTitleZoomEnabled = true
        segmentSource.isTitleColorGradientEnabled = true
        segmentedView.dataSource = segmentSource;
        
        let indicator = JXSegmentedIndicatorLineView()
        indicator.indicatorWidth = 20
        segmentedView.indicators = [indicator]
        
        //5、初始化JXSegmentedListContainerView
        listContainerView = JXSegmentedListContainerView(dataSource: self)
        view.addSubview(listContainerView)
        
        //6、将listContainerView.scrollView和segmentedView.contentScrollView进行关联
        segmentedView.listContainer = listContainerView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        segmentedView.frame = CGRect(x: 0, y: SAFE_TOP_HEIGHT, width: view.bounds.size.width, height: 50)
        listContainerView.frame = CGRect(x: 0, y: SAFE_TOP_HEIGHT+50, width: view.bounds.size.width, height: SCREEN_HEIGHT - 50 - SAFE_TOP_HEIGHT - TABBAR_HEIGHT)
    }
    
    func rxswift() {
        
//        let observable = Observable.repeatElement(1).subscribe { Event in
//            print(Event)
//        }
        
        let obserable = Observable.generate(initialState: 0, condition: {$0 <= 10}, iterate: { $0 + 2 }).subscribe { event in
            print(event)
        }
        
        
        
        let obser2 = Observable.from([0,2,4,6,8,10])
        
//        var secq = obser.subscribe { event in
//            label.text = "\(event)"
//        }
        
//        let observe = Observable<String>.create { Observers in
//            Observers.onNext("GOGOGO")
//            Observers.onCompleted()
//            return Disposables.create()
//        }
//
//        observe.subscribe { event in
//            print("create\(event)")
//        }
        
//        //用于标记是奇数、还是偶数
//        var isOdd = true
//
//        //使用deferred()方法延迟Observable序列的初始化，通过传入的block来实现Observable序列的初始化并且返回。
//        let factory : Observable<Int> = Observable.deferred {
//
//            //让每次执行这个block时候都会让奇、偶数进行交替
//            isOdd = !isOdd
//
//            //根据isOdd参数，决定创建并返回的是奇数Observable、还是偶数Observable
//            if isOdd {
//                return Observable.of(1, 3, 5 ,7)
//            }else {
//                return Observable.of(2, 4, 6, 8)
//            }
//        }
//
//        //第1次订阅测试
//        factory.subscribe { event in
//            print("\(isOdd)", event)
//        }
//
//        //第2次订阅测试
//        factory.subscribe { event in
//            print("\(isOdd)", event)
//        }

//        let time = RxTimeInterval.seconds(3)
//        let observe = Observable<Int>.interval(time, scheduler: MainScheduler.instance)
//        observe.subscribe { [self] event in
//            self.label.text = "\(event)"
//        }
        
        let observable = Observable<Int>.timer(RxTimeInterval.seconds(3), period: RxTimeInterval.seconds(1), scheduler: MainScheduler.instance)
        observable.subscribe { [self] event in
            self.label.text = "\(event)"
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let obser = Observable.of(0,2,4,6,8,10)
        var secq2 = obser.subscribe { [self] num in
            print("\(num)")
            label.text = "\(num)"
        } onError: { error in
            
        } onCompleted: {
            
        } onDisposed: {
            
        }
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

extension ThirdViewController:JXSegmentedViewDelegate,JXSegmentedListContainerViewDataSource{
    func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int {
           return segmentSource.dataSource.count
       }

       func listContainerView(_ listContainerView: JXSegmentedListContainerView, initListAt index: Int) -> JXSegmentedListContainerViewListDelegate {
           if index == 1 {
               let vc = SecondViewController()
               return vc
           }else{
               let vc = RXCollectionViewController()
               return vc
           }
       }
}


