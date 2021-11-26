//
//  ViewController.swift
//  Weather
//
//  Created by WSH on 2021/11/4.
//

import UIKit
import SnapKit
import Alamofire
import CoreLocation
import SwiftyJSON
import HandyJSON
import SwiftFCXRefresh

class MainViewController: UIViewController {
    
    
    let weatherApi = "https://api.openweathermap.org/data/2.5/weather"
    let myKey = "713e52a79d1597d9d9e1281c26feeb49"
    let locationManager = CLLocationManager()
    var Data  = WeatherData()
    var headerRefreshView: FCXRefreshHeaderView?
    
    let SearchCellID = "SearchCell"
    let CloudCellID = "CloudCell"
    let DownCellID = "DownCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .refresh, target: self, action: #selector(autoRefresh))
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestLocation()
        locationManager.startUpdatingLocation()
        
        setupUI()
        addRefreshView()
    }
    
    @objc func autoRefresh() {
        headerRefreshView?.autoRefresh()
        self.collectionView.reloadData()
    }
    
    func addRefreshView() {
        headerRefreshView = collectionView.addFCXRefreshHeader {(refreshHeader) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                refreshHeader.endRefresh()
                self.collectionView.reloadData()
            }}
    }
  
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCellID)
        collectionView.register(CloudCollectionViewCell.self, forCellWithReuseIdentifier: CloudCellID)
        collectionView.register(DownCollectionViewCell.self, forCellWithReuseIdentifier: DownCellID)
        return collectionView
    }()
    
    lazy var BackGroundView:UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "backView")
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.frame = view.bounds
        return imageView
    }()
    
    
    
    func requestWeather(parms: Parameters){
        if getLocalData() == nil {
            Alamofire.request(weatherApi,parameters: parms).responseJSON { [self]
                response in
                if let json = response.value {
                    let weatherJSON = JSON(json)
                    self.Data = JSONDeserializer<WeatherData>.deserializeFrom(json: weatherJSON.description)!
                    putdata(data: Data)
                    collectionView.reloadData()
                }
            }
        }else{
            Data = getLocalData()!
            collectionView.reloadData()
        }
    }
  
    func setupUI() {
        self.view.addSubview(BackGroundView)
        self.view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints{ make in
            make.left.equalTo(self.view.snp.left).offset(0)
            make.right.equalTo(self.view.snp.right).offset(0)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
    
 
}

extension MainViewController: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[locations.count - 1]
        
        if(location.horizontalAccuracy > 0) {
            self.locationManager.stopUpdatingHeading()
            
            let longitude = String(location.coordinate.longitude)
            let latitude = String(location.coordinate.latitude)
            
            let parms = ["lat":String(latitude),"lon":String(longitude),"appid":myKey]
            self.requestWeather(parms: parms)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error")
        
    }
}

extension  MainViewController:  UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section{
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCellID, for: indexPath) as! SearchCollectionViewCell
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CloudCellID, for: indexPath) as! CloudCollectionViewCell
            if(self.Data.main.temp == 0){
                cell.tempLabel.text = "请稍后"
            }
            else{
                cell.tempLabel.text = "\(self.Data.main.temp - 273)℃"
            }
            cell.nameLabel.text = self.Data.name
            
            if(self.Data.weather.count == 0){
                cell.cloudLabel.text = "加载中..."
            }
            else{
                cell.cloudLabel.text = self.Data.weather[0].main
            }
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DownCellID, for: indexPath) as! DownCollectionViewCell

            if(self.Data.main.temp != 0){
                cell.bigLabel1.text = "\(self.Data.main.temp_max - 273)"
                cell.bigLabel2.text = "\(self.Data.main.temp_min - 273)"
                cell.bigLabel3.text = Data.main.pressure
                cell.bigLabel4.text = Data.main.humidity
                cell.bigLabel5.text = Data.wind.speed
                cell.bigLabel6.text = "\(self.Data.main.feels_like - 273)"
                
                
                cell.smallLabel1.text = "最高温度"
                cell.smallLabel2.text = "最低温度"
                cell.smallLabel3.text = "大气压强"
                cell.smallLabel4.text = "空气湿度"
                cell.smallLabel5.text = "风速"
                cell.smallLabel6.text = "体感温度"
                
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.section{
        case 0:
            let vc = SearchViewController()
            navigationController?.pushViewController(vc, animated: true)
        default: break
        }
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section{
        case 0:
            return CGSize(width: UIScreen.main.bounds.width, height: 40)
        case 1:
            return CGSize(width: UIScreen.main.bounds.width, height: 400)
        default:
            return CGSize(width: UIScreen.main.bounds.width, height: 600)
        }
    }
  
}

extension MainViewController {
    
    func getLocalData() -> WeatherData? {
        let path = NSHomeDirectory().appending("/Documents/user.plist")//文件位置
        let data = NSArray(contentsOfFile: path)//文件内容
        let dic = data?[0] as? NSDictionary//转成NSDictionary
        let model = WeatherData.deserialize(from: dic, designatedPath: "")//反序列化
        return model
    }
    
    func putdata(data: WeatherData) {
        let dic = NSDictionary(dictionary: data.toJSON()!)
        let path = NSHomeDirectory().appending("/Documents/user.plist")//文件位置
        let arr = NSMutableArray() //可变数组
        arr.add(dic) //增加元素
        arr.write(toFile: path, atomically: true)//将数组写入plist文件
    }
    
}
