//
//  ImageViewController.swift
//  calendarapp
//
//  Created by アプリ開発 on 2019/12/15.
//  Copyright © 2019 Masato.achiwa. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

      
        
        @IBOutlet var jkImage: UIImageView!
        
        @IBOutlet var speechText: CustomLabel!
  
        @IBOutlet var loveBar: UIProgressView!
        
        
        @IBOutlet var progressLabel: UILabel!
        
        @IBOutlet var count: UILabel!

        
        
        
        var cu : Int = 0
        
        let transform1 = CGAffineTransform(scaleX: 1, y: 10)
        let transform2 = CGAffineTransform(rotationAngle: CGFloat(-Double.pi / 2))
        
       
        
        
        
    override func viewDidLoad() {
        super.viewDidLoad()

  loveBar.transform = transform1.concatenating(transform2)
        speechText.padding = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
      
        
        }
        

        
        override func viewWillAppear(_ animated: Bool) {
      
                let talkManager = TalkManager()
              
                loveBar.setProgress(Float(Double(talkManager.currentTotalPoint) * 0.005555), animated: true)

                let num = loveBar.progress  * 100
                progressLabel.text = "\(ceil(num * 10)/10)%"
                
                count.text = String(talkManager.currentTotalPoint)
                
                switch talkManager.currentType {
                case .good:
                       speechText.text = talkManager.numberOfLabel().0
                         jkImage.image = talkManager.numberOfLabel().1
                       
                case .bad:
                       speechText.text = talkManager.badOfLabel().0
                         jkImage.image = talkManager.badOfLabel().1
 
                }
        }

  
        @IBAction func goButton(_ sender: Any) {
        }
        
        
        @IBAction func backButton(_ sender: Any) {
        }
        
        
        
        
        
        

        
}



