//
//  CustomEventDemo
//  Created by Ray Wu on 1/18/17.
//  Copyright © 2017 Xad. All rights reserved.
//

import XADDisplaySdk
import GoogleMobileAds
import XADCustomEventForGoogleMobileAd

class DFPViewController: UIViewController, GADBannerViewDelegate {

    @IBOutlet weak var adView: DFPBannerView!
    
    var adInterstitial: DFPInterstitial!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.adView.adUnitID = "<adunit_id>"
        self.adView.rootViewController = self
        self.adView.delegate = self
        self.adView.backgroundColor = UIColor.red
    }
    
    @IBAction func loadAd(_ sender: Any) {
        let date = "1988-04-14"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let request = DFPRequest()
        request.birthday = dateFormatter.date(from: date)!
        request.gender = .male
        self.adView.load(request)
    }
    
    @IBAction func loadInterstitial(_ sender: Any) {
        self.adInterstitial = DFPInterstitial(adUnitID: "<adunit_id>")
        
        let date = "1988-04-14"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let request = DFPRequest()
        request.birthday = dateFormatter.date(from: date)!
        request.gender = .male
        self.adInterstitial.load(request)
    }
    
    @IBAction func displayAdInterstitial(_ sender: UIButton) {
        if self.adInterstitial.isReady {
            self.adInterstitial.present(fromRootViewController: self)
        }
    }
}

