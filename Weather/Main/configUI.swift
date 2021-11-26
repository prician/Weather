//
//  configUI.swift
//  Weather
//
//  Created by LLF on 2021/11/6.
//

import UIKit

class configUI: UIViewController {
    let ScreenHeight = UIScreen.main.bounds.height
    let ScreenWidth = UIScreen.main.bounds.width
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    lazy var BackGroundView:UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "backView")
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.frame = view.bounds
        return imageView
    }()
    
    lazy var tempLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 60)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 40)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var cloudLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }()
    
    func setUpUI(){
        self.view.addSubview(BackGroundView)
        self.view.addSubview(nameLabel)
        self.view.addSubview(cloudLabel)
        self.view.addSubview(tempLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.left.equalToSuperview().offset(40)
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
        
        cloudLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(0)
            make.height.equalTo(100)
        }
        
        tempLabel.snp.makeConstraints { make in
            make.top.equalTo(300).offset(40)
            make.height.equalTo(200)
            make.width.equalTo(200)
            make.right.equalToSuperview().offset(-400)
        }
    }
   

  
}
