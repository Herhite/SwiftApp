//
//  SecondViewController.swift
//  SwiftApp
//
//  Created by quhong1v1 on 2022/3/11.
//

import UIKit
import JXSegmentedView

class SecondViewController: ZABaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(collectionV)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        collectionV.frame = .init(x: 10, y: 0, width: SCREEN_WIDTH-20, height: view.frame.size.height)
    }
    
    lazy var collectionV :UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let width = (SCREEN_WIDTH - 40)/3
        layout.itemSize = .init(width: width, height: width+30)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        let tmpCV = UICollectionView.init(frame: .init(x: 10, y: 0, width: SCREEN_WIDTH-20, height: SCREEN_HEIGHT), collectionViewLayout: layout)
        tmpCV.delegate = self
        tmpCV.dataSource = self
        tmpCV.showsVerticalScrollIndicator = false
        tmpCV.register(SecondTabCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(SecondTabCollectionViewCell.self))
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

extension SecondViewController:UICollectionViewDataSource,UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : SecondTabCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(SecondTabCollectionViewCell.self), for: indexPath) as! SecondTabCollectionViewCell
        cell.imageV.image = UIImage.init(named: "nodata")
        cell.nameLabel.text = String(indexPath.item)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let num = indexPath.row % 3
        switch num {
        case 0:
            let sourceVC = RXDataSourceViewController()
            navigationController?.pushViewController(sourceVC, animated: true)
        case 1:
            let testVc = RXTableViewController()
            navigationController?.pushViewController(testVc, animated: true)
        default:
            let sourceVC = RXCollectionViewController()
            navigationController?.pushViewController(sourceVC, animated: true)
        }
    }
    
    
}

extension SecondViewController:JXSegmentedListContainerViewListDelegate{
    func listView() -> UIView {
        return view
    }
    func listDidAppear() {
        
    }
    func listWillAppear() {
        
    }
    func listDidDisappear() {
        
    }
    func listWillDisappear() {
        
    }
}
