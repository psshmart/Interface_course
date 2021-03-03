//
//  PictureView.swift
//  vkclient
//
//  Created by Svetlana Safonova on 01.03.2021.
//

import UIKit

@IBDesignable class PictureView: UIView {

    @IBOutlet var pictureImageView: UIImageView!
    @IBInspectable var shadowRadius: CGFloat = 3 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var shadowColor: UIColor = UIColor.black
    @IBInspectable var shadowOpacity: Float = 0.8
       
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        pictureImageView.layer.cornerRadius = pictureImageView.bounds.height/2
    }
    
    override func draw(_ rect: CGRect) {
        
        let circleView = UIView(frame: CGRect(x: 5, y: 5, width: 66, height: 66))
        circleView.layer.borderWidth = 2.5
        circleView.layer.borderColor = UIColor.init(red: 184/255, green: 129/255, blue: 227/255, alpha: 1).cgColor
        circleView.layer.cornerRadius = circleView.bounds.height/2
        circleView.layer.shadowColor = shadowColor.cgColor
        circleView.layer.shadowOpacity = shadowOpacity
        circleView.layer.shadowRadius = shadowRadius
        circleView.layer.shadowOffset = CGSize.zero
        circleView.layer.masksToBounds = false
        
        self.addSubview(circleView)
//
    }
    

}
