//
//  AdvertisementManager.swift
//  calendarapp
//
//  Created by アプリ開発 on 2020/05/30.
//  Copyright © 2020 Masato.achiwa. All rights reserved.
//

import UIKit
import GoogleMobileAds

class AdvertisementManager,GADInterstitialDelegate{

        var  interstitial: GADInterstitial!
        
       

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
}
