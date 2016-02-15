//
//  TermsViewController.swift
//  Carousel
//
//  Created by Brenda Chung on 2/14/16.
//  Copyright © 2016 Brenda Chung. All rights reserved.
//

import UIKit

class TermsViewController: UIViewController {
    
    let url = "https://www.dropbox.com/terms?mobile=1"
    
    @IBOutlet weak var webView: UIWebView!
    
    @IBAction func doneButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Convert the url String to a NSURL object.
        let requestURL = NSURL(string:url)
        // Place the URL in a URL Request.
        let request = NSURLRequest(URL: requestURL!)
        // Load Request into WebView.
        webView.loadRequest(request)
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
