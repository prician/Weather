//
//  DownCollectionViewCell.swift
//  Weather
//
//  Created by LLF on 2021/11/6.
//

import UIKit
import SnapKit
import Alamofire
import CoreLocation
import SwiftyJSON
import HandyJSON

let ScreenWidth = UIScreen.main.bounds.width
let ScreenHeight = UIScreen.main.bounds.height

class DownCollectionViewCell: UICollectionViewCell {
    
    var celldata = WeatherData()
    let id = "resuedCell"
    //var block: ((WeatherData)-> Void)?
    
    override func layoutSubviews() {
        configUI()
        self.backgroundColor = .clear
        
    }
    
    lazy var smallLabel1: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.init(name: "TimesNewRomanPS-ItalicMT", size: 10)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var bigLabel1: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.init(name: "TimesNewRomanPS-ItalicMT", size: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var smallLabel2: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.init(name: "TimesNewRomanPS-ItalicMT", size: 10)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var bigLabel2: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.init(name: "TimesNewRomanPS-ItalicMT", size: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var smallLabel3: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.init(name: "TimesNewRomanPS-ItalicMT", size: 10)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var bigLabel3: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.init(name: "TimesNewRomanPS-ItalicMT", size: 20)
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    lazy var smallLabel4: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.init(name: "TimesNewRomanPS-ItalicMT", size: 10)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var bigLabel4: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.init(name: "TimesNewRomanPS-ItalicMT", size: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var smallLabel5: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.init(name: "TimesNewRomanPS-ItalicMT", size: 10)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var bigLabel5: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.init(name: "TimesNewRomanPS-ItalicMT", size: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var smallLabel6: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.init(name: "TimesNewRomanPS-ItalicMT", size: 10)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var bigLabel6: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.init(name: "TimesNewRomanPS-ItalicMT", size: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    func configUI() {
        addSubview(smallLabel1)
        addSubview(smallLabel2)
        addSubview(smallLabel3)
        addSubview(smallLabel4)
        addSubview(smallLabel5)
        addSubview(smallLabel6)
        addSubview(bigLabel1)
        addSubview(bigLabel2)
        addSubview(bigLabel3)
        addSubview(bigLabel4)
        addSubview(bigLabel5)
        addSubview(bigLabel6)
        
        smallLabel1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.height.equalTo(25)
            make.left.equalToSuperview().offset(80)
            make.width.equalTo(40)
        }
        
        bigLabel1.snp.makeConstraints { make in
            make.top.equalTo(smallLabel1.snp.bottom).offset(5)
            make.height.equalTo(25)
            make.left.equalToSuperview().offset(80)
            make.width.equalTo(40)
        }
        
        
        smallLabel2.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.height.equalTo(25)
            make.right.equalToSuperview().offset(-85)
            make.width.equalTo(40)
        }
        
        bigLabel2.snp.makeConstraints { make in
            make.top.equalTo(smallLabel2.snp.bottom).offset(5)
            make.height.equalTo(25)
            make.right.equalToSuperview().offset(-85)
            make.width.equalTo(40)
        }
        
        smallLabel3.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.height.equalTo(25)
            make.left.equalToSuperview().offset(80)
            make.width.equalTo(40)
        }
        
        bigLabel3.snp.makeConstraints { make in
            make.top.equalTo(smallLabel3.snp.bottom).offset(5)
            make.height.equalTo(25)
            make.left.equalToSuperview().offset(80)
            make.width.equalTo(40)
        }
        
        smallLabel4.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.height.equalTo(25)
            make.right.equalToSuperview().offset(-85)
            make.width.equalTo(40)
        }
        
        bigLabel4.snp.makeConstraints { make in
            make.top.equalTo(smallLabel4.snp.bottom).offset(5)
            make.height.equalTo(25)
            make.right.equalToSuperview().offset(-85)
            make.width.equalTo(40)
        }
        
        smallLabel5.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.height.equalTo(25)
            make.left.equalToSuperview().offset(80)
            make.width.equalTo(40)
        }
        
        bigLabel5.snp.makeConstraints { make in
            make.top.equalTo(smallLabel5.snp.bottom).offset(5)
            make.height.equalTo(25)
            make.left.equalToSuperview().offset(80)
            make.width.equalTo(40)
        }
        
        smallLabel6.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.height.equalTo(25)
            make.right.equalToSuperview().offset(-85)
            make.width.equalTo(40)
        }
        
        bigLabel6.snp.makeConstraints { make in
            make.top.equalTo(smallLabel6.snp.bottom).offset(5)
            make.height.equalTo(25)
            make.right.equalToSuperview().offset(-85)
            make.width.equalTo(40)
        }
        
    }
    
    
}


