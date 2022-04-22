//
//  RXCollectionViewController.swift
//  SwiftApp
//
//  Created by apple on 2022/4/22.
//

import UIKit
import RxSwift
import RxCocoa

class RXCollectionViewController: ZABaseViewController {
    
    let musicModel = MusicCollectionViewModel()
    let disposeBag = DisposeBag()
    let reuseID = "reuseVae"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(collectionV)
        title = "许嵩作品"
        musicModel.data.bind(to: collectionV.rx.items(cellIdentifier: reuseID, cellType: SecondTabCollectionViewCell.self)) { (row, element, cell) in
            cell.nameLabel.text = "\(element.name) : \(element.singer)"
            cell.imageV.image = UIImage.init(named: "nodata")
        }
         .disposed(by: disposeBag)
    }
    
    lazy var collectionV :UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let width = (SCREEN_WIDTH - 40)/3
        layout.itemSize = .init(width: width, height: width+30)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        let tmpCV = UICollectionView.init(frame: .init(x: 10, y: 0, width: SCREEN_WIDTH-20, height: SCREEN_HEIGHT), collectionViewLayout: layout)
//        tmpCV.delegate = self
//        tmpCV.dataSource = self
        tmpCV.showsVerticalScrollIndicator = false
        tmpCV.register(SecondTabCollectionViewCell.self, forCellWithReuseIdentifier: reuseID)
        return tmpCV
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
