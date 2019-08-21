//
//  LabelTableViewCell.swift
//  Word Play
//
//  Created by Lonnie Gerol on 11/20/18.
//  Copyright © 2018 Lontronix. All rights reserved.
//

import UIKit

class LabelTableViewCell: UITableViewCell {

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.textLabel?.text = "test"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   

}
