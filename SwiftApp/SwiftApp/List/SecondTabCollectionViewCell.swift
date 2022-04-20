//
//  SecondTabCollectionViewCell.swift
//  SwiftApp
//
//  Created by apple on 2022/4/20.
//

import UIKit
import SnapKit

class SecondTabCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        contentView.addSubview(imageV)
        contentView.layer.cornerRadius = 8
        contentView.layer.borderColor = UIColor.brown.cgColor
        contentView.layer.borderWidth = 1.0
        imageV.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(0)
            make.bottom.equalTo(-30)
        }
        
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(0)
            make.height.equalTo(30)
        }
    }
    
    public lazy var imageV : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    public lazy var nameLabel : UILabel = {
        let tmpLabel = UILabel()
        tmpLabel.textAlignment = .center
        tmpLabel.font = .boldSystemFont(ofSize: 15)
        tmpLabel.textColor = .black
        return tmpLabel
    }()
    
}
