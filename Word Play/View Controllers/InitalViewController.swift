//
//  ViewController.swift
//  Word Play
//
// EVERYTHING SHOULD BE CITED
//  Created by Lonnie Gerol on 11/19/18.
//  Copyright © 2018 Lontronix. All rights reserved.
//
import UIKit

class InitalViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView = UITableView(frame: self.tableView.frame, style: .grouped)
        self.tableView.register(ButtonTableViewCell.self, forCellReuseIdentifier: "buttonCell")
        self.tableView.allowsSelection = false
        self.title = "Welcome"
        tableView.separatorColor = tableView.backgroundColor
               
     
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "buttonCell") as! ButtonTableViewCell
        
        
        switch indexPath.section{
        case 0:
            cell.button.backgroundColor = red
            cell.button.setTitle("Movie Quotes", for: .normal)
            cell.buttonDelegate = self
            cell.button.tag = 0
        
        case 1:
            cell.button.backgroundColor = green
            cell.button.setTitle("Abducted By Aliens", for: .normal)
            cell.buttonDelegate = self
            cell.button.tag = 1
        case 2:
            cell.button.backgroundColor = blue
            cell.button.setTitle("Popular Video Game", for: .normal)
            cell.buttonDelegate = self
            cell.button.tag = 2
        default: ()
            
            }
        return cell
        
    
     
       
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 43.5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    
        if(section == 0){ return 75}
        else{return 20}
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
        //https://stackoverflow.com/questions/49654999/how-to-add-space-between-header-text-and-tableview
        
        if(section == 0){
        let headerLabel = UILabel(frame: CGRect(x: 15, y: 15, width: tableView.frame.size.width - 30, height: 50))
            headerLabel.backgroundColor = UIColor.clear
            headerLabel.textAlignment = .center
            headerLabel.text = "Please select a category to continue"
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: headerLabel.frame.width, height: 75))
            headerView.addSubview(headerLabel)
            
            return headerView
            
        }
        else{return nil}
}

}

extension InitalViewController: ButtonTableViewCellDelegate{
    func buttonPressed(_ sender: UIButton) {
            madLib.setStoryNumber(newStoryNumber: sender.tag)
            self.navigationController?.pushViewController(WordViewController(wordType: .Noun), animated: true)
       
        
        }
       
    }
    

