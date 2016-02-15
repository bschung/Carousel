//
//  SettingsViewController.swift
//  Carousel
//
//  Created by Brenda Chung on 2/13/16.
//  Copyright © 2016 Brenda Chung. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var scrollVIew: UIScrollView!
    @IBAction func button(sender: AnyObject) {
        let alertController = UIAlertController(title: nil, message: "Sign Out", preferredStyle: .ActionSheet)
        let signoutAction = UIAlertAction (title: "Sign Out", style: .Destructive ) { alertAction in
            self.performSegueWithIdentifier("signoutSegue", sender: self)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
        }
        alertController.addAction(signoutAction)
        alertController.addAction(cancelAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    @IBAction func closeButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollVIew.contentSize = CGSize(width: 320, height: 695)
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
