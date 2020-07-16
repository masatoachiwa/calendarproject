//
//  kakinViewController.swift
//  calendarapp
//
//  Created by アプリ開発 on 2020/06/18.
//  Copyright © 2020 Masato.achiwa. All rights reserved.
//

import UIKit
import MessageUI
import SwiftyStoreKit



class kakinViewController: UIViewController {
        
        //     var delegate : CatchProtocol?
        var count :Int = 0
        
        @IBOutlet var onLabel: UILabel!
        
        
        @IBOutlet var midleLabel: UILabel!
        
        @IBOutlet var underLabel: UILabel!
        
        
        
        override func viewDidLoad() {
                super.viewDidLoad()
                
                
                onLabel.text = "あなたがこれまでに見てきた、クラスメートのコメントと画像の履歴を見れるようになります。\nAppStoreのレートによって多少変動します。"
                midleLabel.text = "応援履歴の表示を購入されて、別端末で本アプリをDLした方はこちらで復元できます。"
                
                
        }
        
        
        
        @IBAction func effortkakinButton(_ sender: Any) {
                
                
                effortPurchase(PRODUCT_ID: "jp.masato.achiwa.ouenrireki")
                
        }
        
        
        
        
        
        
        
        func effortVerifyPurchase(PRODUCT_ID:String){
                //共有シークレット リストア
                let appeValidator = AppleReceiptValidator(service: .production, sharedSecret: "94c2779e23074221962ea7e03075bc49")
                SwiftyStoreKit.verifyReceipt(using: appeValidator) { (result) in
                        
                        switch result{
                        case .success(let receipt):
                                let purchaseResult = SwiftyStoreKit.verifyPurchase(productId: PRODUCT_ID, inReceipt: receipt)
                                switch purchaseResult{
                                case.purchased:
                                        //リストア成功
                                        print("リストアを成功しました")
                                        UserDefaults.standard.set(1, forKey: "effortbuy")
                                        break
                                case .notPurchased:
                                        
                                        
                                        //リストアされてない場合
                                        
                                        print("リストアを失敗しました")
                                              UserDefaults.standard.set(nil, forKey: "effortbuy")
                                        break
                                        
                                }
                        case .error:
                                
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
        
        
        func effortPurchase(PRODUCT_ID:String){
                
                SwiftyStoreKit.purchaseProduct(PRODUCT_ID) { (result) in
                        
                        switch result{
                                
                        case .success(_):
                                //購入が成功
                                if UserDefaults.standard.object(forKey: "effortBuy") != nil{       //"buy"がにnilでない場合
                                        UserDefaults.standard.set(1,forKey: "effortBuy")
                                        print("購入済み")
                                }else{ //"buy"がnilの場合
                                        
                                        UserDefaults.standard.set(1,forKey: "effortBuy")
                                        
                                        print("購入完了")
                                        
                                }
                                
                                self.effortVerifyPurchase(PRODUCT_ID: "jp.masato.achiwa.ouenrireki")
                                
                                
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
        
        
        
        @IBAction func restore(_ sender: Any) {
                
                SwiftyStoreKit.restorePurchases{(results)in
                        if Array(results.restoredPurchases.filter{ $0.productId == "jp.masato.achiwa.ouenrireki"}).count > 0{
                                //リストア成功
                                
                                
                                UserDefaults.standard.set(1, forKey: "effortBuy")
                                self.underLabel.text = "購入権が復元されました"
                                print("リストア成功")
                                
                                
                        }
                                
                        else  if results.restoreFailedPurchases.count > 0{
                                //リストア失敗
                                print("リストア失敗")
                                self.underLabel.text = "購入権の復元を失敗をしました。"//
                                
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
        
        
        
        
}
