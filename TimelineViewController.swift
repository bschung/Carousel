//
//  TimelineViewController.swift
//  Carousel
//
//  Created by Brenda Chung on 2/13/16.
//  Copyright © 2016 Brenda Chung. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var bannerView: UIImageView!
    
    @IBAction func onClose(sender: AnyObject) {
        UIView.animateWithDuration(0.3) { () -> Void in
            self.scrollView.transform = CGAffineTransformMakeTranslation(0,-45)
            self.bannerView.alpha = 0
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = CGSize(width: 320, height: 1564)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
