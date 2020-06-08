//
//  TopViewController.swift
//  calendarapp
//
//  Created by アプリ開発 on 2019/12/17.
//  Copyright © 2019 Masato.achiwa. All rights reserved.
//

import UIKit
import GoogleMobileAds       ///////←←←←←←←←←←←←←←←←
class TopViewController: UIViewController,GADInterstitialDelegate, CatchProtocol{
     
        
        
     var  interstitial: GADInterstitial!     ///////←←←←←←←←←←←←←←←←

        @IBOutlet var admobLabel: UILabel!
        
        
        @IBOutlet var yearLabel: UILabel!
        
        @IBOutlet var doLabel: UILabel!
        
        @IBOutlet var do2Label: UILabel!
        
        @IBOutlet var kariLabel: UILabel! //デバック用ラベル
        
       @IBOutlet var pointLabel: UILabel! //デバック用ラベル
        
       @IBOutlet var badLabel: UILabel! //デバック用ラベル
        
        
        @IBOutlet var testLabel: UILabel!  //デバック用日付変更確認ラベル
        
        
     var n = 0
        
        @IBOutlet var topView: UIImageView!
        
        @IBOutlet var goodButton: UIButton!
        
        @IBOutlet var badButton: UIButton!
        
        @IBOutlet var restButton: UIButton!
        
        let defaults = UserDefaults.standard
        
        
        let datemanager = DateManager()
        
        
        let talkManager = TalkManager()
      
        let date = Date() //本日の日付取得
        let dateFormatter = DateFormatter() //文字列からDate型の日付を生成できる（インスタンスの作成）
      
         let alldayArray =  UserDefaults.standard.array(forKey: {"alldayArray"}())as? [String]          //配列の呼び出し
        
        
      
   
        
        override func viewDidLoad() {
                super.viewDidLoad()
                
            createAndLoadInterstitial() //広告のロード
                
        
              kariLabel.isHidden = true
              pointLabel.isHidden = true
              badLabel.isHidden = true
              testLabel.isHidden = true
               
                yearLabel.text = "\(String(datemanager.year))年\(String(datemanager.month))月\(String(datemanager.day))日"
               
                let effort: String = (UserDefaults.standard.string(forKey: "effort") ?? "田中")
              let period: String = (UserDefaults.standard.string(forKey: "period") ?? "21")
                 let unit: String = (UserDefaults.standard.string(forKey: "unit") ?? "")
             
             
                doLabel.text = effort + "を"
               do2Label.text = period + unit + "する"
                
                   switch talkManager.currentType { //---------------デバック用ポイント確認コード---
       
                   case .good:
                        kariLabel.text = talkManager.numberOfLabel().0
                          pointLabel.text = String(talkManager.currentTotalPoint)
                case .bad:
                        kariLabel.text = talkManager.badOfLabel().0
                   case.rest:
                        kariLabel.text = talkManager.restOfLabel().0
                        
                }
                pointLabel.text = String(talkManager.currentTotalPoint)
                badLabel.text = String(talkManager.currentTotalbadPoint)
                //---------ここまで---------------------------
              
                talkManager.date(abcd:dateFormatter.string(from: date) ) //配列に初期値を代入
                talkManager.badDate(abcd:dateFormatter.string(from: date) )
                talkManager.restDate(abcd:dateFormatter.string(from: date) )
              
                talkManager.point = talkManager.currentTotalPoint
                talkManager.badPoint = talkManager.currentTotalbadPoint
                
                
               

                if datemanager.month < 10 {  //----------------アプリ落としてもボタン押せない処理---------------------------------------
                        let alldayArray =  UserDefaults.standard.array(forKey: {"alldayArray"}())as? [String] ??  [""]        //配列の呼び出し
                        
                        let newMonth =  String("0") + String(datemanager.month)
     
                        
                        if alldayArray.contains(String(datemanager.year) + String(newMonth) + String(datemanager.day))   {
                                //goodの配列の中の数字と、カレンダーの日付が同じ日に
                            
//                                badButton.isEnabled = false
//                                restButton.isEnabled = false
//                                goodButton.isEnabled = false
                    
                        }else{ return
                        }
                
                }else{
                          let alldayArray =  UserDefaults.standard.array(forKey: {"alldayArray"}())as? [String] ??  [""]        //配列の呼び出し
                    
                    if    alldayArray.contains(String(datemanager.year) + String(datemanager.month) + String(datemanager.day)) {
//                                badButton.isEnabled = false
//                                restButton.isEnabled = false
//                                goodButton.isEnabled = false
              
                        }
                        else{ return
                }
              
        }//--------------------------------------------------ここまで---------------
        }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     
        let effort: String = (UserDefaults.standard.string(forKey: "effort") ?? "努力")
        let period: String = (UserDefaults.standard.string(forKey: "period") ?? "今すぐ")
        let unit: String = (UserDefaults.standard.string(forKey: "unit") ?? "")
        
        doLabel.text = effort + "を"
        do2Label.text = period + unit + "する"
        
          ////---------- 日付変更---------------------
        let alldayArray =  UserDefaults.standard.array(forKey: {"alldayArray"}())as? [String]
        print([alldayArray])
     print( "\(String(datemanager.year))\(String(datemanager.month))\(String(datemanager.day))")
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(significantTimeChangeNotification(_:)), name: UIApplication.significantTimeChangeNotification, object: nil)
        
        
    }
        
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIApplication.significantTimeChangeNotification, object: nil)
    }
        
     ////--------------ここまで--------
        
        @IBAction func goodButton(_ sender: Any) {
                talkManager.currentType = .good
                talkManager.point += 1
                kariLabel.text = talkManager.numberOfLabel().0
                pointLabel.text = String(talkManager.currentTotalPoint)
        
                
                dateFormatter.dateFormat = "yyyyMMd" //yyMMddの形式で日付を生成する
          //      print(dateFormatter.string(from: date)) //本日の日付を取得
                
         
                talkManager.date(abcd:dateFormatter.string(from: date) )
                talkManager.allDate(abcd:dateFormatter.string(from: date) )
         talkManager.kakinDate(abcd: talkManager.numberOfLabel().2)
                print(talkManager.kakindayArray)
//         badButton.isEnabled = false   // ボタン無効
//         restButton.isEnabled = false
//         goodButton.isEnabled = false
//
            
                

                
                if let buy = UserDefaults.standard.object(forKey: "buy"){  //"buy"がnilじゃなかったら、広告を除去する。
                        let  count = UserDefaults.standard.object(forKey: "buy") as! Int
                        if count == 1 { // 広告を除去する
                                let UINavigationController = self.tabBarController?.viewControllers?[3];       //タブバー コントローラの画面遷移
                                self.tabBarController?.selectedViewController = UINavigationController;
                                
                        }else{
                                let UINavigationController = self.tabBarController?.viewControllers?[3];       //タブバー コントローラの画面遷移
                                self.tabBarController?.selectedViewController = UINavigationController;
                                
                        }
                        
                }else{
                        //広告を設定する
                        if self.interstitial.isReady {                                 ///////←←←←←←←←←←←←←←←← 広告の処理
                                self.interstitial.present(fromRootViewController: self)
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                                let UINavigationController = self.tabBarController?.viewControllers?[3];       //タブバー コントローラの画面遷移
                                self.tabBarController?.selectedViewController = UINavigationController;
                                }
                                } else {
                                admobLabel.text = ("広告の準備がない")
                                let UINavigationController = tabBarController?.viewControllers?[3];       //タブバー コントローラの画面遷移
                                tabBarController?.selectedViewController = UINavigationController;
                                
                        }
                        
                        
                }
           

                
        }
        
        
        
        @IBAction func badButton(_ sender: Any) {
                talkManager.currentType = .bad
                talkManager.badPoint += 1
                kariLabel.text = talkManager.badOfLabel().0
                badLabel.text = String(talkManager.currentTotalbadPoint)
                
                dateFormatter.dateFormat = "yyyyMMd" //yyMMddの形式で日付を生成する
             //   print(dateFormatter.string(from: date)) //本日の日付を取得
                
                talkManager.badDate(abcd:dateFormatter.string(from: date) )
                 talkManager.allDate(abcd:dateFormatter.string(from: date) )
                 talkManager.kakinDate(abcd: talkManager.badOfLabel().2)
                print(talkManager.kakindayArray)
//                badButton.isEnabled = false // ボタン無効
//               restButton.isEnabled = false
//                goodButton.isEnabled = false
                
//                           let goodButton2: Bool = defaults.bool(forKey: "goodButton")
//                               goodButton.isEnabled = goodButton2
        
                let UINavigationController = tabBarController?.viewControllers?[3];       //タブバー コントローラの画面遷移
                tabBarController?.selectedViewController = UINavigationController;
              
             
        }
        
        @IBAction func restButton(_ sender: Any) {
               talkManager.currentType = .rest
               let num = arc4random_uniform(51)
                talkManager.randomPoint = Int(num)
                print(talkManager.randomPoint)
                print(num)
                dateFormatter.dateFormat = "yyyyMMd" //yyMMddの形式で日付を生成する
      //          print(dateFormatter.string(from: date)) //本日の日付を取得
                
                talkManager.restDate(abcd:dateFormatter.string(from: date) )
                talkManager.allDate(abcd:dateFormatter.string(from: date) )
                talkManager.kakinDate(abcd: talkManager.restOfLabel().2)
                
//                badButton.isEnabled = false // ボタン無効
//               restButton.isEnabled = false
//                goodButton.isEnabled = false
                
                let UINavigationController = tabBarController?.viewControllers?[3];       //タブバー コントローラの画面遷移
                tabBarController?.selectedViewController = UINavigationController;
                
                
        }
        
        @IBAction func risettButton(_ sender: Any) {
                talkManager.resetPoint()
       //         kariLabel.text = TalkManager.shared.numberOfLabel()
                pointLabel.text = String(talkManager.point)
                badLabel.text = String(talkManager.badPoint)
                
              
               talkManager.remove()
//                badButton.isEnabled = true
//                restButton.isEnabled = true
//                goodButton.isEnabled = true
        }
        
        
    @objc private func significantTimeChangeNotification(_ notification: Notification) {
        testLabel.text = "日付が変わりました"
        badButton.isEnabled = true
        restButton.isEnabled = true
        goodButton.isEnabled = true
    }
       

        func createAndLoadInterstitial() -> GADInterstitial {              ///////←←←←←←←←←←←←←←←←
                
                interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
                interstitial.delegate = self
                interstitial.load(GADRequest())
               return interstitial
        }
      
        
        
        // デリゲートメソッド。インタースティシャル広告が閉じられた時にもう一度createAndLoadInterstitialメソッドを呼び出し、
        // 新しい広告をロードしています。これを実装しないと、インタースティシャル広告は一度しか表示されなくなる。
                func interstitialDidDismissScreen(_ ad: GADInterstitial) {         ///////←←←←←←←←←←←←←←←←
                interstitial = createAndLoadInterstitial()
        }
       
      
        func showAdmob(interstitial: GADInterstitial){
                if interstitial.isReady{
                        interstitial.present(fromRootViewController: self)
                }
        
        
        }
        
        func interstitialDidReceiveAd(_ ad: GADInterstitial) {
                admobLabel.text = "準備完了"
                print("interstitialDidReceiveAd")
                
        }
        
        func interstitial(_ ad: GADInterstitial, didFailToReceiveAdWithError error: GADRequestError) {
                print("無理でした: \(error.localizedDescription)")
        }
        
        /// Tells the delegate that an interstitial will be presented.
        func interstitialWillPresentScreen(_ ad: GADInterstitial) {
                print("interstitialWillPresentScreen")
        }
        
        /// Tells the delegate the interstitial is to be animated off the screen.
        func interstitialWillDismissScreen(_ ad: GADInterstitial) {
                print("interstitialWillDismissScreen")
        }
        
        /// Tells the delegate that a user click will open another app
        /// (such as the App Store), backgrounding the current app.
        func interstitialWillLeaveApplication(_ ad: GADInterstitial) {
                print("interstitialWillLeaveApplication")
        }
        
        
        func catchDate(count: Int) {
                if let buy = UserDefaults.standard.object(forKey: "buy"){
                        
                        let count = UserDefaults.standard.object(forKey: "buy") as! Int
                        if count == 1{
                                
                                
                                
                                
                        }
                        
                }else{
                        
                        
                        interstitial = createAndLoadInterstitial() ///////←←←←←←←←←←←←←←←←
                        
                }
                
        }
        
        
        
        
        
        
        
        
        
}
