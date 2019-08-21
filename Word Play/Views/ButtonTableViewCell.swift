//
//  ButtonTableViewCell.swift
//  Word Play
//
//  Created by Lonnie Gerol on 11/19/18.
//  Copyright © 2018 Lontronix. All rights reserved.
//

import UIKit

@objc protocol ButtonTableViewCellDelegate{
    func buttonPressed(_ sender: UIButton)
    
}

class ButtonTableViewCell: UITableViewCell {
    var button: UIButton!
    var buttonDelegate: ButtonTableViewCellDelegate?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "groupedCell")
        self.accessoryType = .none
        button = UIButton()
        button.backgroundColor = UIColor.red
        button.layer.cornerRadius = 15
        self.backgroundColor = UIColor.clear
        button.addTarget(buttonDelegate, action: #selector(buttonDelegate?.buttonPressed(_:)), for: .touchUpInside)
        self.addSubview(button)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        button.frame = CGRect(x: 5, y: 0, width: self.contentView.frame.width - 10, height: self.contentView.frame.height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
