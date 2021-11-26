//
//  RequestViewController.swift
//  Weather
//
//  Created by WSH on 2021/11/14.
//

import UIKit
import SnapKit
import Alamofire
import CoreLocation
import SwiftyJSON
import HandyJSON

class RequestViewController: UIViewController {
    
    var block: ((_ str:String) -> ())?
    var str:String = ""
    let id = "cell"
    var weatherData = WeatherData()
    let myKey = "713e52a79d1597d9d9e1281c26feeb49"
    let requestApi = "https://api.openweathermap.org/data/2.5/weather"
    
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
    
    lazy var backView:UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "backView")
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.frame = view.bounds
        return imageView
    }()

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(RequestCollectionViewCell.self, forCellWithReuseIdentifier: id)
        return collectionView
    }()
    
    func requestWeather(parms: Parameters){
        Alamofire.request(requestApi,parameters: parms).responseJSON { [self]
            response in
            if let json = response.value {
                let weatherJSON = JSON(json)
                self.weatherData = JSONDeserializer<WeatherData>.deserializeFrom(json: weatherJSON.description)!
                print(weatherData)
                collectionView.reloadData()
                self.tempLabel.text = "\(weatherData.main.temp - 273)℃"
                self.cloudLabel.text = weatherData.weather[0].main
                self.nameLabel.text = weatherData.name
            }
        }
    }
    
    func configUI() {
        self.view.addSubview(backView)
        self.view.addSubview(nameLabel)
        self.view.addSubview(tempLabel)
        self.view.addSubview(cloudLabel)
        self.view.addSubview(collectionView)
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120)
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
        
        collectionView.snp.makeConstraints{ make in
            make.top.equalTo(tempLabel.snp.bottom).offset(0)
            make.height.equalTo(600)
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        let parms = ["q":str,"appid":myKey]
        requestWeather(parms: parms)
    }
    
}
extension RequestViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as! RequestCollectionViewCell
        let slabel = ["最高温度","最低温度","大气压强","空气湿度","风速","体感温度"]
        let blabel = ["\(weatherData.main.temp_max - 273)","\(weatherData.main.temp_min - 273)",weatherData.main.pressure,weatherData.main.humidity,weatherData.wind.speed,"\(weatherData.main.feels_like - 273)"]
        cell.bigLabel.text = blabel[indexPath.row]
        cell.smallLabel.text = slabel[indexPath.row]
        return cell
        

    }
    

}

extension RequestViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ScreenWidth * 0.45, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
