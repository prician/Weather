//
//  DownCell.swift
//  Weather
//
//  Created by LLF on 2021/11/7.
//

import UIKit

class DownCell: UICollectionViewCell {
    
    override func layoutSubviews() {
        configUI()
        
    }
    
    lazy var smallLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "最高温度"
        label.font = UIFont.init(name: "TimesNewRomanPS-ItalicMT", size: 10)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var bigLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.init(name: "TimesNewRomanPS-ItalicMT", size: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    
    
    func configUI() {
        self.addSubview(smallLabel)
        self.addSubview(bigLabel)
        
        smallLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.height.equalTo(25)
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
        }
        
        bigLabel.snp.makeConstraints { make in
            make.top.equalTo(smallLabel.snp.bottom).offset(5)
            make.height.equalTo(60)
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
        }
    }
}
