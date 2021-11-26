//
//  CloudCollectionViewCell.swift
//  Weather
//
//  Created by LLF on 2021/11/6.
//

import UIKit

class CloudCollectionViewCell: UICollectionViewCell {
    
    override func layoutSubviews() {
        configUI()
    }
    
    lazy var tempLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.init(name: "TimesNewRomanPS-ItalicMT", size: 55)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.init(name: "TimesNewRomanPS-ItalicMT", size: 40)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var cloudLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.init(name: "TimesNewRomanPS-ItalicMT", size: 30)
        return label
    }()
    
    
    func configUI() {
        addSubview(nameLabel)
        addSubview(tempLabel)
        addSubview(cloudLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.left.equalToSuperview().offset(40)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        cloudLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(0)
            make.height.equalTo(30)
        }
        
        tempLabel.snp.makeConstraints { make in
            make.top.equalTo(cloudLabel.snp.bottom).offset(10)
            make.height.equalTo(200)
            make.width.equalTo(300)
            make.left.equalToSuperview().offset(250)
        }
        
    }
}
