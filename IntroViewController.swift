//
//  IntroViewController.swift
//  Carousel
//
//  Created by Brenda Chung on 2/11/16.
//  Copyright © 2016 Brenda Chung. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tile1View: UIImageView!
    @IBOutlet weak var tile2View: UIImageView!
    @IBOutlet weak var tile3View: UIImageView!
    @IBOutlet weak var tile4View: UIImageView!
    @IBOutlet weak var tile5View: UIImageView!
    @IBOutlet weak var tile6View: UIImageView!
    
    var yOffsets : [Float] = [-315, -250, -415, -408, -500, -500]
    var xOffsets : [Float] = [-80, 35, -6, 70, -130, -105]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
    func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) -> Float {
        let ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }
    
    func transformView(view : UIView!, atIndex index : Int, offset : Float) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 320, height: 1136)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        tile6View.transform = CGAffineTransformMakeTranslation(CGFloat(getTx(6)), CGFloat(getTy(6)))
        tile6View.transform = CGAffineTransformScale(tile6View.transform, CGFloat(getScale(6)), CGFloat(getScale(6)))
        tile6View.transform = CGAffineTransformRotate(tile6View.transform, CGFloat(Double(getRotation(6)) * M_PI / 180))
        
        tile5View.transform = CGAffineTransformMakeTranslation(CGFloat(getTx(5)), CGFloat(getTy(5)))
        tile5View.transform = CGAffineTransformScale(tile5View.transform, CGFloat(getScale(5)), CGFloat(getScale(5)))
        tile5View.transform = CGAffineTransformRotate(tile5View.transform, CGFloat(Double(getRotation(5)) * M_PI / 180))
        
        tile4View.transform = CGAffineTransformMakeTranslation(CGFloat(getTx(4)), CGFloat(getTy(4)))
        tile4View.transform = CGAffineTransformScale(tile4View.transform, CGFloat(getScale(4)), CGFloat(getScale(4)))
        tile4View.transform = CGAffineTransformRotate(tile4View.transform, CGFloat(Double(getRotation(4)) * M_PI / 180))
        
        tile3View.transform = CGAffineTransformMakeTranslation(CGFloat(getTx(3)), CGFloat(getTy(3)))
        tile3View.transform = CGAffineTransformScale(tile3View.transform, CGFloat(getScale(3)), CGFloat(getScale(3)))
        tile3View.transform = CGAffineTransformRotate(tile3View.transform, CGFloat(Double(getRotation(3)) * M_PI / 180))
        
        tile2View.transform = CGAffineTransformMakeTranslation(CGFloat(getTx(2)), CGFloat(getTy(2)))
        tile2View.transform = CGAffineTransformScale(tile2View.transform, CGFloat(getScale(2)), CGFloat(getScale(2)))
        tile2View.transform = CGAffineTransformRotate(tile2View.transform, CGFloat(Double(getRotation(2)) * M_PI / 180))
        
        tile1View.transform = CGAffineTransformMakeTranslation(CGFloat(getTx(1)), CGFloat(getTy(1)))
        tile1View.transform = CGAffineTransformScale(tile1View.transform, CGFloat(getScale(1)), CGFloat(getScale(1)))
        tile1View.transform = CGAffineTransformRotate(tile1View.transform, CGFloat(Double(getRotation(1)) * M_PI / 180))
    }
    
    func getTy(index: Int) -> Float {
        let offset = Float(scrollView.contentOffset.y)
        let ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[index-1], r2Max: 0)
        return (ty)
    }
    
    func getTx(index: Int) -> Float {
        let offset = Float(scrollView.contentOffset.y)
        let tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[index-1], r2Max: 0)
        return (tx)
    }
    
    func getScale(index: Int) -> Float {
        let offset = Float(scrollView.contentOffset.y)
        let scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[index-1], r2Max: 1)
        return (scale)
    }
    
    func getRotation(index: Int) -> Float {
        let offset = Float(scrollView.contentOffset.y)
        let rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[index-1], r2Max: 0)
        return (rotation)
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
