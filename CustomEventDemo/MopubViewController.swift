//
//  MopubViewController.swift
//  CustomEventDemo
//
//  Created by Ray Wu on 1/18/17.
//  Copyright © 2017 Xad. All rights reserved.
//

import UIKit
import XADCustomEventForMopub

class MopubViewController: UIViewController {
    
    var mopubBanner: MPAdView!
    var mopubInterstitial: MPInterstitialAdController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mopubBanner = MPAdView(adUnitId: "<adunit_id>", size: MOPUB_BANNER_SIZE)
        self.mopubBanner.frame = CGRect(x: 0, y: 30, width: MOPUB_BANNER_SIZE.width, height: MOPUB_BANNER_SIZE.height)
        self.mopubBanner.delegate = self
        self.view.addSubview(self.mopubBanner)
    }
    
    @IBAction func loadAd(_ sender: UIButton) {
        self.mopubBanner.loadAd()        
    }
    
    @IBAction func loadInterstitial(_ sender: UIButton) {
        self.mopubInterstitial = MPInterstitialAdController(forAdUnitId: "<adunit_id>")
        self.mopubInterstitial.loadAd()
    }
    
    @IBAction func displayAdInterstitial(_ sender: UIButton) {
        if self.mopubInterstitial.ready {
            self.mopubInterstitial.show(from: self)
        }
    }
}

extension MopubViewController: MPAdViewDelegate {
    public func viewControllerForPresentingModalView() -> UIViewController! {
        return self
    }
}

