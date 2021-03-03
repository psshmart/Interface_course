//
//  ProfileCell.swift
//  vkclient
//
//  Created by Svetlana Safonova on 23.02.2021.
//

import UIKit

class ProfileCell: UICollectionViewCell {
    
    static let reuseIdentifire = "FriendPictureCell"
    
    @IBOutlet var pictureImage: UIImageView!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var likesCountLabel: UILabel!
    
    
}
