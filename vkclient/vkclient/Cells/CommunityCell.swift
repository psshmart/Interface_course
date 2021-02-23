//
//  CommunityCell.swift
//  vkclient
//
//  Created by Svetlana Safonova on 23.02.2021.
//

import UIKit

class CommunityCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var pictureImageView: UIImageView!

    func configure(community: Community)
    {
        nameLabel.text = community.name
        pictureImageView.image = community.picture
    }
}
