//
//  CreateViewController.swift
//  Carousel
//
//  Created by Brenda Chung on 2/14/16.
//  Copyright © 2016 Brenda Chung. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController, UIScrollViewDelegate {
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    @IBOutlet weak var checkBox: UIButton!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var createNav: UIImageView!
    @IBOutlet weak var createText: UIImageView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!
    @IBOutlet weak var checkBoxButton: UIButton!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    @IBAction func onButton(sender: UIButton) {
        sender.selected = true
    }
    
    @IBAction func tapBack(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func didPressCreate(sender: AnyObject) {
        loginIndicator.startAnimating()
        
        if checkBox.selected != true {
            loginIndicator.stopAnimating()
            let alertCheckboxController = UIAlertController(title: "Agree to Terms", message: "Please check the terms", preferredStyle: .Alert)
            let cancelEmptyAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
            }
            alertCheckboxController.addAction(cancelEmptyAction)
            self.presentViewController(alertCheckboxController, animated: true, completion: nil)
        } else if emailField.text!.isEmpty || passwordField.text!.isEmpty {
            loginIndicator.stopAnimating()
            let alertEmptyController = UIAlertController(title: "Email and password required", message: "Please enter your email address and password", preferredStyle: .Alert)
            let cancelEmptyAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
            }
            alertEmptyController.addAction(cancelEmptyAction)
            self.presentViewController(alertEmptyController, animated: true, completion: nil)
        } else if emailField.text == "email" && passwordField.text == "pass" {
            delay(2, closure: { () -> () in
                self.loginIndicator.stopAnimating()
                self.performSegueWithIdentifier("createSegue", sender: nil)
            })
            // Otherwise, email or password are incorrect so...
        } else {
            delay(2, closure: { () -> () in
                self.loginIndicator.stopAnimating()
                let alertController = UIAlertController(title: "Incorrect email or password", message: "Please try again", preferredStyle: .Alert)
                let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
                }
                alertController.addAction(cancelAction)
                self.presentViewController(alertController, animated: true, completion: nil)
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkBox.selected = false
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        scrollView.delegate = self
        scrollView.contentSize = scrollView.frame.size
        scrollView.contentInset.bottom = 80
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -95
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView.contentOffset.y <= -50 {
            // Hide the keyboard
            view.endEditing(true)
        }
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        scrollView.contentOffset.y = scrollView.contentInset.bottom
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        buttonParentView.frame.origin.y = buttonInitialY
        scrollView.contentOffset.y = scrollView.contentInset.top
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    override func viewWillAppear(animated: Bool) {
        // Set initial transform values 20% of original size
        let transform = CGAffineTransformMakeScale(0.2, 0.2)
        // Apply the transform properties of the views
        createNav.transform = transform
        fieldParentView.transform = transform
        // Set the alpha properties of the views to transparent
        createNav.alpha = 0
        fieldParentView.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        //Animate the code within over 0.3 seconds...
        UIView.animateWithDuration(0.3) { () -> Void in
            // Return the views transform properties to their default states.
            self.fieldParentView.transform = CGAffineTransformIdentity
            self.createNav.transform = CGAffineTransformIdentity
            // Set the alpha properties of the views to fully opaque
            self.fieldParentView.alpha = 1
            self.createNav.alpha = 1
        }
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
