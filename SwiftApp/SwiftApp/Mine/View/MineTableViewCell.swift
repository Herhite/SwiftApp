//
//  MineTableViewCell.swift
//  SwiftApp
//
//  Created by apple on 2022/4/20.
//

import UIKit
import SnapKit

class MineTableViewCell: UITableViewCell {
    
   static let identifies : String = "MineTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        contentView.addSubview(iconImageV)
        iconImageV.snp.makeConstraints { make in
            make.leading.equalTo(5)
            make.centerY.equalTo(contentView.snp.centerY)
            make.width.height.equalTo(30)
        }
        
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(iconImageV)
            make.leading.equalTo(iconImageV.snp.trailing).offset(10)
            make.width.equalTo(SCREEN_WIDTH/2-45)
            make.height.equalTo(40)
        }
        
        contentView.addSubview(singerLabel)
        singerLabel.snp.makeConstraints { make in
            make.centerY.equalTo(iconImageV)
            make.width.equalTo(SCREEN_WIDTH/2 - 10)
            make.trailing.equalTo(-10)
            make.height.equalTo(40)
        }
        
//        contentView.addSubview(markLabel)
//        markLabel.snp.makeConstraints { make in
//            make.bottom.equalTo(contentView.snp.bottom).offset(-1)
//            make.leading.equalTo(iconImageV.snp.trailing)
//            make.trailing.equalTo(0);
//            make.height.equalTo(1)
//        }
    }
    
    
    
    static public func dequeCell(table:UITableView) -> MineTableViewCell {
        var cell = table .dequeueReusableCell(withIdentifier: identifies)
        if cell == nil {
            cell = MineTableViewCell.init(style: .default, reuseIdentifier: identifies)
            cell?.selectionStyle = .none
        }
        return cell as! MineTableViewCell
    }
    
    public lazy var iconImageV: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 13.5
        return image
    }()
    
    public lazy var nameLabel : UILabel = {
        var label = UILabel.init()
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    public lazy var singerLabel : UILabel = {
        var label = UILabel.init()
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    public lazy var markLabel : UIView = {
        var markView = UIView.init()
        markView.backgroundColor = .systemGray
        return markView
    }()
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
