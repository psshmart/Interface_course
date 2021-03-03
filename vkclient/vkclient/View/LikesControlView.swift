//
//  LikesControlView.swift
//  vkclient
//
//  Created by Svetlana Safonova on 01.03.2021.
//

import UIKit

class LikesControlView: UIControl {

    @IBOutlet var likeButton: UIButton!
    @IBOutlet var likesLabel: UILabel!
    var likeTapped: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        likesLabel.text = "0"
        likesLabel.textColor = UIColor.systemGray
        likeButton.addTarget(self, action: #selector(likeButtonTapped(_:)), for: .touchUpInside)
        
    }
    
    @objc func likeButtonTapped(_ gesture: UITapGestureRecognizer) {
        likeTapped.toggle()
        
        
        if likeTapped {
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: UIControl.State.normal)
            likesLabel.text = "1"
            likesLabel.textColor = UIColor.systemBlue
        }
        else {
            likeButton.setImage(UIImage(systemName: "heart"), for: UIControl.State.normal)
            likesLabel.text = "0"
            likesLabel.textColor = UIColor.systemGray
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    

}
