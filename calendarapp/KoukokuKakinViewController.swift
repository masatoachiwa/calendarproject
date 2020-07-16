//
//  KoukokuKakinViewController.swift
//  calendarapp
//
//  Created by アプリ開発 on 2020/07/05.
//  Copyright © 2020 Masato.achiwa. All rights reserved.
//

import UIKit
import MessageUI
import SwiftyStoreKit



class KoukokuKakinViewController: UIViewController {
        
        
        @IBOutlet var topLabel: UILabel!
        
        @IBOutlet var middleLabel: UILabel!
        
        @IBOutlet var underLabel: UILabel!
        
        
        
        override func viewDidLoad() {
                super.viewDidLoad()
                topLabel.text = "全ての広告を削除します。一度の購入でずっとご利用できます。\nAppStoreのレートによって多少変動します。"
                
        }
        
        
        @IBAction func kakinButton(_ sender: Any) {
                
                purchase(PRODUCT_ID: "jp.masato.achiwa.calendarapp.adfree")
                
        }
        
        
        
        @IBAction func restoreButton(_ sender: Any) {
                SwiftyStoreKit.restorePurchases{(results)in
                        if Array(results.restoredPurchases.filter{ $0.productId == "jp.masato.achiwa.calendarapp.adfree"}).count > 0{
                                //リストア成功
                                
                              
                                UserDefaults.standard.set(1, forKey: "buy")
                                self.underLabel.text = "購入権が復元されました"
                                print("リストア成功")
                                
                        
                        }
                        
                
                else if results.restoreFailedPurchases.count > 0{
                        //リストア失敗
                        print("リストア失敗")
                        self.underLabel.text = "購入権の復元を失敗をしました。"
                                
                        
                } else{
                      self.underLabel.text = "購入権の復元を失敗をしました。"
                        print("購入権の復元を失敗をしました。")
                }
        }
        }

        
        
        
        override func viewWillAppear(_ animated: Bool) {
                super.viewWillAppear(animated)
                
                
                self.tabBarController?.tabBar.isHidden = true
                
        }
        
        
        
        func purchase(PRODUCT_ID:String){
                
                SwiftyStoreKit.purchaseProduct(PRODUCT_ID) { (result) in
                        
                        switch result{
                                
                        case .success(_):
                                //購入が成功
                                if UserDefaults.standard.object(forKey: "buy") != nil{       //"buy"がにnilでない場合
                                        UserDefaults.standard.set(1,forKey: "buy")
                                        print("購入済み")
                                }else{ //"buy"がnilの場合
                                        
                                        
                                        UserDefaults.standard.set(1,forKey: "buy")
                                        
                                        print("購入完了")
                                        
                                }
                                
                                self.koukokuVerifyPurchase(PRODUCT_ID: "jp.masato.achiwa.calendarapp.adfree")
                                
                                
                                break
                        case let .error(error):
                                print("失敗")
                                print("\(error)")
                                self.register(handler: nil)
                                //購入失敗
                                
                                break
                                
                                
                        }
        
                }
        
        }
        
        func koukokuVerifyPurchase(PRODUCT_ID:String){
                //共有シークレット リストア
                let appeValidator = AppleReceiptValidator(service: .production, sharedSecret: "94c2779e23074221962ea7e03075bc49")
                SwiftyStoreKit.verifyReceipt(using: appeValidator) { (result) in
                        
                        switch result{
                        case .success(let receipt):
                                let purchaseResult = SwiftyStoreKit.verifyPurchase(productId: PRODUCT_ID, inReceipt: receipt)
                                switch purchaseResult{
                                case.purchased:
                                        //リストア成功
                                      
                                        UserDefaults.standard.set(1, forKey: "buy")
                                   //     print("receiptの内容")
                                   //    print(receipt)
                                        break
                                        
                                case .notPurchased:
                                        //リストアされてない場合
                                        
                                        UserDefaults.standard.set(nil, forKey: "buy")
                                        break
                                        
                                }
                        case .error(let error):
                                print(error)
                                break
                        }
                        
                }
                
                
        }
        
        private func register(handler: ((UIAlertAction) -> Void)? = nil) {
                let alert = UIAlertController(title: "購入の失敗", message: "問題が発生したため現在購入できません。しばらくしてから再度お試しください。", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                present(alert,animated: true, completion: nil)
                return
        }
        
        
        
        
        
        
}
