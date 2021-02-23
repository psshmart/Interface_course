//
//  FriendCell.swift
//  vkclient
//
//  Created by Svetlana Safonova on 23.02.2021.
//

import UIKit

class FriendCell: UITableViewCell {

    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var firstNameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    
    func configure(user: User) {
        profileImageView.image = user.profilePicture
        firstNameLabel.text = user.firstName
        surnameLabel.text = user.surname
    }

}
