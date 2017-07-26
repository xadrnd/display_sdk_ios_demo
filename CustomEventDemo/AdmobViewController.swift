//
//  AdmobViewController.swift
//  CustomEventDemo
//
//  Created by Ray Wu on 1/18/17.
//  Copyright © 2017 Xad. All rights reserved.
//

import UIKit
import GoogleMobileAds
import XADCustomEventForGoogleMobileAd

class AdmobViewController: UIViewController, GADBannerViewDelegate {
    
    @IBOutlet weak var adMobBanner: GADBannerView!
    
    var adMobInterstitial: GADInterstitial!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.adMobBanner.delegate = self
        self.adMobBanner.backgroundColor = UIColor.red
        self.adMobBanner.adUnitID = "<adunit_id>"
        self.adMobBanner.rootViewController = self
    }

    @IBAction func loadAd(_ sender: UIButton) {
        let adRequest = GADRequest()
        self.adMobBanner.load(adRequest)
    }
    
    @IBAction func loadAdInterstitial(_ sender: UIButton) {
        self.adMobInterstitial = GADInterstitial(adUnitID: "<adunit_id>")
        let adRequest = GADRequest()
        self.adMobInterstitial.load(adRequest)
        
    }
    
    @IBAction func displayAdInterstitial(_ sender: UIButton) {
        if self.adMobInterstitial.isReady {
            self.adMobInterstitial.present(fromRootViewController: self)
        }
    }
}

extension AdmobViewController: GADInterstitialDelegate {
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        self.adMobInterstitial = nil
    }
}
