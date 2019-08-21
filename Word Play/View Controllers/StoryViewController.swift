//
//  StoryViewController.swift
//  Word Play
//
//  Created by Lonnie Gerol on 11/30/18.
//  Copyright © 2018 Lontronix. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController {
    var storyTextView = UITextView()
    
    init(){
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Final Story"
        storyTextView.frame = self.view.frame
        self.view.addSubview(storyTextView)
        storyTextView.attributedText = madLib.generateStory()
        

    }
    
    
    
    
}
