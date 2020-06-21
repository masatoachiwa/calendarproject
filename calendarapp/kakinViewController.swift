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

protocol CatchProtocol{

        func catchDate(count: Int)
}

class kakinViewController: UIViewController {
  
        var delegate : CatchProtocol?
        var count :Int = 0
        @IBOutlet var aLabel: UILabel!
        @IBOutlet var underLabel: UILabel!
        
        
        
    override func viewDidLoad() {
        super.viewDidLoad()

        aLabel.text = "全ての広告を削除します。一度の購入でアプリを削除しない限りずっとご利用できます。\nAppStoreのレートによって多少変動します。"
  underLabel.text = "あなたこれまでに見てきた、クラスメートのコメントと画像の履歴を見れるようになります。\nAppStoreのレートによって多少変動します。"
        }
    
        
        @IBAction func kakinButton(_ sender: Any) {
    purchase(PRODUCT_ID: "jp.masato.achiwa.calendarapp.adfree")
        
        
        }
        
        @IBAction func effortkakinButton(_ sender: Any) {
    
         effortPurchase(PRODUCT_ID: "jp.masato.achiwa.effortkakin")
        
        }
        
        
        
        
        
        
        
        func purchase(PRODUCT_ID:String){
                
                SwiftyStoreKit.purchaseProduct(PRODUCT_ID) { (result) in
                        
                        switch result{
                                
                        case .success(_):
                                //購入が成功
                                if UserDefaults.standard.object(forKey: "buy") != nil{       //"buy"がにnilでない場合
                                        let  count = UserDefaults.standard.object(forKey: "buy") as! Int
                                        
                                }else{ //"buy"がnilの場合
                                        self.count = 1
                                        UserDefaults.standard.set(1,forKey: "buy")
                                        
                                        print("test")
                                        
                                }
                        //         self.verifyPurchase(PRODUCT_ID: PRODUCT_ID) 広告が消えないバグが発生したのでコメントアウト
                                self.delegate?.catchDate(count: self.count)
                                //購入を検証します
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
                                              
                                              print("購入済み")
                                      }else{ //"buy"がnilの場合
                                             
                                              UserDefaults.standard.set(1,forKey: "effortBuy")
                                              
                                              print("購入完了")
                                              
                                      }
                                      
                                    
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
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        override func viewWillAppear(_ animated: Bool) {
              super.viewWillAppear(animated)
        
        
        self.tabBarController?.tabBar.isHidden = true
        
        }
        
        
        
        
}
