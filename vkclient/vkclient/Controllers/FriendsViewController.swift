//
//  FriendsViewController.swift
//  vkclient
//
//  Created by Svetlana Safonova on 23.02.2021.
//

import UIKit

class FriendsViewController: UITableViewController {

    let friendsList = [
        User(firstName: "Cat", surname: "1", profilePicture: UIImage(named: "cat")),
        User(firstName: "Cat", surname: "1", profilePicture: UIImage(named: "cat")),
        User(firstName: "Cat", surname: "1", profilePicture: UIImage(named: "cat")),
        User(firstName: "Cat", surname: "1", profilePicture: UIImage(named: "cat")),
        User(firstName: "Cat", surname: "1", profilePicture: UIImage(named: "cat")),
        User(firstName: "Cat", surname: "1", profilePicture: UIImage(named: "cat")),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friendsList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendCell
        else {
            return UITableViewCell()
        }
        cell.configure(user: friendsList[indexPath.row])
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FriendProfile",
           let senderCell = sender as? FriendCell,
           let cellIndexPath = tableView.indexPath(for: senderCell),
           let profileViewController = segue.destination as? ProfileViewController {
            let selectedFriend = friendsList[cellIndexPath.row]
            profileViewController.profile = selectedFriend
        }
    }
    

}
