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
        
        var number :Int = 0
        @IBOutlet var topLabel: UILabel!
        
        @IBOutlet var middleLabel: UILabel!
        
        @IBOutlet var underLabel: UILabel!
        
        
        
        override func viewDidLoad() {
                super.viewDidLoad()
                topLabel.text = "全ての広告を削除します。一度の購入でアプリを削除しない限りずっとご利用できます。\nAppStoreのレートによって多少変動します。"
                
        }
        
        
        @IBAction func kakinButton(_ sender: Any) {
                
                purchase(PRODUCT_ID: "jp.masato.achiwa.calendarapp.adfree")
                
        }
        
        
        
        @IBAction func restoreButton(_ sender: Any) {
                
                SwiftyStoreKit.restorePurchases{(results)in if
                        results.restoreFailedPurchases.self.number > 0{
                        //リストア失敗
                        print("リストア失敗")
                        self.underLabel.text = "購入権の復元を失敗しました"
                }else if results.restoredPurchases.self.number > 0{
                        //リストア成功
                        self.number = 1
                        UserDefaults.standard.set(1, forKey: "buy")
                        self.underLabel.text = "購入権が復元されました"
                        print("リストア成功")
                }else{
                        print("リストアするものがない")
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
                                        let number = UserDefaults.standard.object(forKey: "buy") as! Int
                                        print("購入済み")
                                }else{ //"buy"がnilの場合
                                        self.number = 1
                                        
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
                                        self.number = 1
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
        
        private func register(handler: ((UIAlertAction) -> Void)? = nil) {
                let alert = UIAlertController(title: "購入の失敗", message: "問題が発生したため現在購入できません。しばらくしてから再度お試しください。", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                present(alert,animated: true, completion: nil)
                return
        }
        
        
        
        
        
        
}
