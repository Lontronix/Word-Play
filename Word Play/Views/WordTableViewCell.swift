//
//  WordTableViewCell.swift
//  Word Play
//
//  Created by Lonnie Gerol on 11/27/18.
//  Copyright © 2018 Lontronix. All rights reserved.
//

import UIKit

class WordTableViewCell: UITableViewCell {
    
    var textField = UITextField()
    var descriptionLabel = UILabel()
    
     init() {
        super.init(style: .default, reuseIdentifier: nil)
        self.addSubview(textField)
        self.addSubview(descriptionLabel)
        

     }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        textField.delegate = self
        textField.clearButtonMode = .whileEditing
        self.addSubview(textField)
        self.addSubview(descriptionLabel)
        

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        descriptionLabel.frame = CGRect(x: 5, y: 0, width: self.contentView.frame.width / 2, height: self.contentView.frame.height)
        textField.frame = CGRect(x: self.contentView.frame.width/2, y: 0, width: self.contentView.frame.width - (self.contentView.frame.width / 2), height: self.contentView.frame.height)
       
        
       
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension WordTableViewCell: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
}
