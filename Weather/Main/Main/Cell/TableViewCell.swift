//
//  TableViewCell.swift
//  Weather
//
//  Created by WSH on 2021/11/14.
//

import UIKit

class TableViewCell: UITableViewCell {

    lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "TimesNewRomanPS-ItalicMT", size: 18)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    func setupUI() {
        addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(170)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
