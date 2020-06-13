//
//  tableViewViewController.swift
//  calendarapp
//
//  Created by アプリ開発 on 2020/03/15.
//  Copyright © 2020 Masato.achiwa. All rights reserved.
//

import UIKit
import MessageUI
import SwiftyStoreKit

protocol CatchProtocol{

        func catchDate(count: Int)
}

let sectionTitle = ["課金","アプリについて",]
let section0 = [("広告非表示"),("応援履歴を見れるようにしたい")]
let section1 = [("お問い合わせ"),("レビューを書く"),("開発者のツイートを見る")]


let tableDate = [section0,section1]


class tableViewViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource,MFMailComposeViewControllerDelegate {
      
        var delegate : CatchProtocol?
        
   var count :Int = 0
        
        @IBOutlet var tableView: UITableView!
      
        override func viewDidLoad() {
        super.viewDidLoad()
                tableView.delegate = self
                tableView.dataSource = self
        
    }
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //セクションごとの行数を決める
       
                let sectionDate = tableDate[section]
                return sectionDate.count //複数のタプルが入っている配列
        }
      
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {  //セクションのタイトル
                return sectionTitle[section]
        }
        

        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {  //セルを作る
             
                let cell = UITableViewCell(style: .default, reuseIdentifier: "myCell")   //セルの作成
       let sectionDate = tableDate[indexPath.section]     //tableDateをセクションごとに振り分ける。
                let cellDate = sectionDate[indexPath.row]    //選択された行の値を振り分ける
          cell.textLabel? .text = cellDate
             
                return cell
        }
        
   
        func numberOfSections(in tableView: UITableView) -> Int {//セクションの個数
                return sectionTitle.count
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                
                if indexPath.section == 0{
                switch indexPath.row {
                 case 0:
                   
                        purchase(PRODUCT_ID: "jp.masato.achiwa.calendarapp.adfree")
                      
                        
                        
                        
                case 1:
                     print("\(indexPath.row)番目の行が選択されました。")
             
                default:
                        print("\(indexPath.row)番目の行が選択されました。")
                        }
                }
                        else if indexPath.section == 1{
                        switch indexPath.row {
                        case 0:
                        
                          self.sendMail()
                        case 1:
              
                            print("おはよう")
                
                        case 2:
                                if UIApplication.shared.canOpenURL(URL(string: "twitter")!) {
                                        // xxxアプリがインストールされている
                                        guard let twitterUrl = URL(string: "twitter://user?id=1073957131345260545") else { return }
                                        UIApplication.shared.open(twitterUrl)
                                        
                                        
                                } else {
                                        // xxxアプリがインストールされていない
                                        let url = NSURL(string: "https://twitter.com/progateofreon")
                                        if UIApplication.shared.canOpenURL(url! as URL){
                                                UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
                                        
                                        
                                                }
                                        
                                }
                        default:
                        print("\(indexPath.row)番目の行が選択されました。")
                      
                        
                        }
                        
                }
              
        }
        
        private func sendMail() {
                if MFMailComposeViewController.canSendMail() {
                        let mail = MFMailComposeViewController()
                        mail.mailComposeDelegate = self
                        mail.setToRecipients(["xxxx@yahoo.co.jp"]) // 宛先アドレス
                        mail.setSubject("お問い合わせ") // 件名
                        mail.setMessageBody("ここに本文が入ります。", isHTML: false) // 本文
                        present(mail, animated: true, completion: nil)
                } else {
                        print("送信できません")
                }
        }
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
                switch result {
                case .cancelled:
                        print("Email Send Cancelled")
                        break
                case .saved:
                        print("Email Saved as a Draft")
                        break
                case .sent:
                        print("Email Sent Successfully")
                        break
                case .failed:
                        print("Email Send Failed")
                        break
                default:
                        break
                }
                controller.dismiss(animated: true, completion: nil)
        }
     
        func purchase(PRODUCT_ID:String){
                
                SwiftyStoreKit.purchaseProduct(PRODUCT_ID) { (result) in
                        
                        switch result{
                                
                        case .success(_):
                                //購入が成功
                                if let buy =   UserDefaults.standard.object(forKey: "buy"){       //"buy"がにnilでない場合
                                        let  count = UserDefaults.standard.object(forKey: "buy") as! Int
                                        
                                }else{ //"buy"がnilの場合
                                        self.count = 1
                                        UserDefaults.standard.set(1,forKey: "buy")
                                        
                                        print("test")
                                        
                                }
                                 self.verifyPurchase(PRODUCT_ID: PRODUCT_ID)
                                self.delegate?.catchDate(count: self.count)
                                //購入を検証します
                        break
                        case let .error(error):
                        print("失敗")
                        print("\(error)")
                        //購入失敗
                   
                        break
                  
                        
                                }
                        
                   
                        }
                
                       
                }
        
        func verifyPurchase(PRODUCT_ID:String){
                //共有シークレット リストア
                let appeValidator = AppleReceiptValidator(service: .production, sharedSecret: "94c2779e23074221962ea7e03075bc49")
                SwiftyStoreKit.verifyReceipt(using: appeValidator) { (result) in

                        switch result{
                        case .success(let receipt):
                                let purchaseResult = SwiftyStoreKit.verifyPurchase(productId: PRODUCT_ID, inReceipt: receipt)
                                switch purchaseResult{
                                case.purchased:
                                        //リストア成功
                                        self.count = 1
                                        UserDefaults.standard.set(1, forKey: "buy")
                                        break
                                case .notPurchased:
                                        //リストアされてない場合

                                        UserDefaults.standard.set(nil, forKey: "buy")
                                        break

                                }
                        case .error(let error):
                                break
                        }

                }


        }

        
        
        
        
        
        
        
}
        
        


