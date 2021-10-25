//
//  HeaderView.swift
//  CropSearch
//
//  Created by Jonathan Hogue on 10/17/21.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView {
    let title = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints                                 = false
        title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive     = true
        title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive     = true
        title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive   = true
        
        title.text = "Areas of observation - please note concern(s) if any, as well as corrective action(s)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
