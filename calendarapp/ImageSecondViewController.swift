//
//  ImageSecondViewController.swift
//  calendarapp
//
//  Created by アプリ開発 on 2020/04/07.
//  Copyright © 2020 Masato.achiwa. All rights reserved.
//

import UIKit

class ImageSecondViewController: UIViewController {

        @IBOutlet var gakuseiLabel: CustomLabel!
    
        let talkManager = TalkManager()
        
        override func viewDidLoad() {
        super.viewDidLoad()

                gakuseiLabel.text = talkManager.gakuseiOfLabel().0
                gakuseiLabel.padding = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 8)
                
                
                
    }
    
         override func viewWillAppear(_ animated: Bool) {
        
          let talkManager = TalkManager()
          gakuseiLabel.text = talkManager.gakuseiOfLabel().0
        
        
        }
        
        
        
        @IBAction func jkButton(_ sender: Any) {
      self.dismiss(animated: true, completion: nil)
        
        
        }
        
  
        
        
        
        
}
