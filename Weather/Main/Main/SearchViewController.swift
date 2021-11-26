//
//  SearchViewController.swift
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


class SearchViewController: UIViewController {
    
    let id = "Cell"
    let clabel = ["北京","长春","成都","重庆","广州","杭州","天津","上海","沈阳","深圳"]
    let elabel = ["beijing","changchun","chengdu","chongqing","guangzhou","hangzhou","tianjin","shanghai","shenyang","shenzhen"]
    
    lazy var backView:UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "backView")
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.frame = view.bounds
        return imageView
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "请选择城市"
        label.font = UIFont.init(name: "TimesNewRomanPS-ItalicMT", size: 18)
        label.textColor = .black
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero,style: .plain)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: id)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        self.view.addSubview(backView)
        self.view.addSubview(tableView)
        self.view.addSubview(label)
        
        label.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(100)
            make.height.equalTo(50)
            make.left.equalToSuperview().offset(155)
            make.width.equalTo(100)
        }
        
        tableView.snp.makeConstraints{ make in
            make.top.equalTo(label.snp.bottom).offset(10)
            make.height.equalTo(500)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-20)
        }
    }
    

}
extension SearchViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: id,for: indexPath) as! TableViewCell
        cell.label.text = clabel[indexPath.row]
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let parms = ["q":elabel[indexPath.row],"appid":myKey]
        //requestWeather(parms: parms)
        
        let vc = RequestViewController()
        vc.str = elabel[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
