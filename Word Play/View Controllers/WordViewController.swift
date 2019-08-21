//
//  WordViewController.swift
//  Word Play
//
//  Created by Lonnie Gerol on 11/27/18.
//  Copyright © 2018 Lontronix. All rights reserved.
//

import UIKit

class WordViewController: UITableViewController {
   
    var wordType: WordType!
   
    var continueButton = UIButton()
    
    init(wordType: WordType){
        super.init(nibName: nil, bundle: nil)
        self.wordType = wordType
        
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = wordType.rawValue + "s"
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), style: UITableView.Style.grouped)
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(WordTableViewCell.self, forCellReuseIdentifier: "wordCell")
        tableView.tableHeaderView = UIView()
        tableView.allowsSelection = false
        self.tableView.contentInsetAdjustmentBehavior = .scrollableAxes
        continueButton.setTitle("Next", for: .normal)
        continueButton.setTitleColor(UIColor.white, for: .normal)
        continueButton.frame = CGRect(x: 0, y: 0, width: 30, height: 20)
        continueButton.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: continueButton)
        
      //  self.view.addSubview(tableView)
        
    }
    
    
    @objc func nextButtonPressed(){
       
        for section in 0...tableView!.numberOfSections - 1{
            let cell = tableView.cellForRow(at: IndexPath(row: 0, section: section)) as! WordTableViewCell
            
            if(cell.textField.text == ""){
                displayAlertController()
                break
            }
            else{
                addUserInputToProperArray(index: section, userInput: cell.textField.text!)
            }
            
        }
        
        
        switch wordType!{
        case .Noun:
            if(madLib.storyNumber != 1){
            self.navigationController?.pushViewController(WordViewController(wordType: .Adjective), animated: true)
            }
            else{
                self.navigationController?.pushViewController(WordViewController(wordType: .Verb), animated: true)

            }
        
        case .Adjective:
            self.navigationController?.pushViewController(WordViewController(wordType: .Verb), animated: true)
        
        case .Verb: ()
            self.navigationController?.pushViewController(StoryViewController() , animated: true)
            
        }
    
        self.view.endEditing(true)
    }
    
    func getCorrespondingArray() -> [Word]{
        switch wordType!{
        case .Noun:
            return madLib.nouns
        case .Verb:
            return madLib.verbs
        case .Adjective:
            return madLib.adjectives
        }
        
    }
    
    func addUserInputToProperArray(index: Int, userInput: String){
        switch wordType!{
        case .Noun:
            madLib.nouns[index].userInput = userInput
        case .Adjective:
            madLib.adjectives[index].userInput = userInput
        case .Verb:
            madLib.verbs[index].userInput = userInput
        }
    }
    
    
    func displayAlertController(){
        let alertController = UIAlertController(title: "Error!", message: "One or more fields is empty, please make sure all fields are filled out before continuing", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
        
    }
    
}


extension WordViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 1
        }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        switch wordType! {
        case .Noun:
            return madLib.nouns.count
        case .Verb:
            return madLib.verbs.count
        case .Adjective:
            return madLib.adjectives.count
    }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wordCell") as! WordTableViewCell
        if let specificWordType =  getCorrespondingArray()[indexPath.section].specificWordType{
            cell.descriptionLabel.text = specificWordType
            cell.textField.placeholder = specificWordType
        }
        else{
            cell.descriptionLabel.text = "Any \(wordType.rawValue)"
            cell.textField.placeholder = "Any \(wordType.rawValue)"

        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if(section == 0){
            switch wordType!{
            case .Noun:
                return 40.0
            case .Adjective:
                return 55.0
            case .Verb:
                return 55.0
            }
            }
        else{return 0}
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if(section == 0){
            let headerLabel = UILabel(frame: CGRect(x: 15, y: 0, width: tableView.frame.width - 60, height: 30))
                headerLabel.backgroundColor = UIColor.clear
                headerLabel.textAlignment = .left
                //setting header label text
            headerLabel.numberOfLines = 0
            headerLabel.minimumScaleFactor = 0.5
            switch wordType!{
            case .Noun:
                headerLabel.text = "A person, place or thing"
            case .Adjective:
                headerLabel.text = "Describes or clarifies a noun, like \"happy\""
            case .Verb:
                headerLabel.text = "A word used to describe an action, state, or occurrence, like \"happen\"."
                
        }
            headerLabel.textColor = UIColor.white
            headerLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
            headerLabel.sizeToFit()
            headerLabel.frame = CGRect(x: 5.0, y: 0.0, width: headerLabel.frame.width + 10.0, height: headerLabel.frame.height + 10)           
            headerLabel.backgroundColor = UIColor.red
            headerLabel.clipsToBounds = true
            headerLabel.layer.cornerRadius = 5
            
            
            
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: headerLabel.frame.width + 5, height: headerLabel.frame.height))
            headerView.addSubview(headerLabel)
            return headerView
    }
        else{
            return nil
        }
}
    
    
    
}
