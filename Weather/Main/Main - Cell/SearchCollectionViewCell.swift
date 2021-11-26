//
//  SearchCollectionViewCell.swift
//  Weather
//
//  Created by LLF on 2021/11/6.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {

    override func layoutSubviews() {
        configUI()
        
    }
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    lazy var photoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "search")
        return imageView
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "TimesNewRomanPS-ItalicMT", size: 15)
        label.text = "搜索"
        label.textColor = .gray
        return label
    }()
    
    func configUI() {
        self.addSubview(imageView)
        self.imageView.addSubview(photoImage)
        self.imageView.addSubview(label)
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(0)
            make.bottom.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(55)
            make.right.equalToSuperview().offset(-55)
        }
        
        photoImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.left.equalToSuperview().offset(10)
            make.width.equalTo(20)
        }
        
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.left.equalTo(photoImage.snp.right).offset(5)
            make.width.equalToSuperview().offset(50)
        }
    }
}
