//
//  RequestCollectionViewCell.swift
//  Weather
//
//  Created by WSH on 2021/11/14.
//

import UIKit

class RequestCollectionViewCell: UICollectionViewCell {
    
    lazy var smallLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.init(name: "TimesNewRomanPS-ItalicMT", size: 10)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var bigLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.init(name: "TimesNewRomanPS-ItalicMT", size: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    func configUI() {
        addSubview(smallLabel)
        addSubview(bigLabel)
        
        smallLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(0)
            make.height.equalTo(25)
            make.left.equalToSuperview().offset(30)
            make.width.equalTo(40)
        }
        
        bigLabel.snp.makeConstraints{ make in
            make.top.equalTo(smallLabel.snp.bottom).offset(5)
            make.height.equalTo(25)
            make.left.equalToSuperview().offset(30)
            make.width.equalTo(40)
        }
    }
     
    override func layoutSubviews() {
        configUI()
        
    }
}
