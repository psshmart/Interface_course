//
//  FriendsViewController.swift
//  vkclient
//
//  Created by Svetlana Safonova on 23.02.2021.
//

import UIKit

class FriendsViewController: UITableViewController {

    var letters = Set<Character>()
    var friendsList = [
        User(firstName: "Naruto", surname: "Uzumaki", profilePicture: UIImage(named: "naruto"), pictures: [UIImage(named: "naruto"), UIImage(named: "naruto")]),
        User(firstName: "Shikamaru", surname: "Nara", profilePicture: UIImage(named: "shikamaru"), pictures: [UIImage(named: "shikamaru"), UIImage(named: "shikamaru")]),
        User(firstName: "Sasuke", surname: "Uchiha", profilePicture: UIImage(named: "sasuke"), pictures: [UIImage(named: "sasuke"), UIImage(named: "sasuke")]),
        User(firstName: "Minato", surname: "Namikaze", profilePicture: UIImage(named: "minato"), pictures: [UIImage(named: "minato"), UIImage(named: "minato")]),
        User(firstName: "Kakashi", surname: "Hatake", profilePicture: UIImage(named: "Kakashi"), pictures: [UIImage(named: "Kakashi"), UIImage(named: "Kakashi")]),
        User(firstName: "Sakura", surname: "Haruno", profilePicture: UIImage(named: "sakura"), pictures: [UIImage(named: "sakura"), UIImage(named: "sakura")]),
    ]
    
    private struct SectionData {
        let users: [User]
    }
    
    private var lettersList: [String]?
    
    private var sectionData: [SectionData]?
    
    private func loadData() {
        sectionData = []
        
        var currentLetter = [User]()
        
        for i in 0...friendsList.count - 1 {
            currentLetter.append(friendsList[i])
            
            if i != friendsList.count - 1 {
                if friendsList[i].firstName.first != friendsList[i + 1].firstName.first {
                    sectionData?.append(SectionData.init(users: currentLetter))
                    currentLetter = []
                }
                
            }
            else {
                sectionData?.append(SectionData.init(users: currentLetter))
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = UIColor.init(patternImage: UIImage(named: "back") ?? UIImage())
        
        
        friendsList.sort { $0.firstName < $1.firstName }
        
        for friend in friendsList {
            letters.insert(friend.firstName.first!)
        }
        print(letters.count)
        
        loadData()

    }

    // MARK: - Table view data source

    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        lettersList = []
        
        var changableLetter = ""
        for letter in letters {
            changableLetter = String(letter)
            lettersList?.append(changableLetter)
        }
        lettersList?.sort { $0 < $1 }
        
        return lettersList
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return letters.count
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
        headerView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        
        let label = UILabel(frame: CGRect(x: 10, y: 6, width: 15, height: 15))
        
        lettersList = []
        
        var changableLetter = ""
        for letter in letters {
            changableLetter = String(letter)
            lettersList?.append(changableLetter)
        }
        lettersList?.sort { $0 < $1 }
        
        label.text = lettersList?[section]
        
        headerView.addSubview(label)
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            guard let sectionData = sectionData?[section] else {
                return 0
            }
        return sectionData.users.count
    }
        
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let firstLetter = sectionData?[section].users[0].firstName.first {
            return String(firstLetter)
        }
        return ""
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cellData = sectionData?[indexPath.section] else {
            fatalError("Attempt to get data while it is not loaded")
        }
        
        let cellIdentifire = "FriendCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire, for: indexPath) as? FriendCell else {
            return UITableViewCell()
        }
        
        cell.configure(user: cellData.users[indexPath.row])
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "FriendProfile",
//           let senderCell = sender as? FriendCell,
//           let cellIndexPath = tableView.indexPath(for: senderCell),
//           let profileViewController = segue.destination as? ProfileViewController {
//            let selectedFriend = friendsList[cellIndexPath.row]
//            profileViewController.profile = selectedFriend
//        }
        if segue.identifier == "FriendProfile" {
            if let indexPath = tableView.indexPathForSelectedRow {
                guard let cellData = sectionData?[indexPath.section] else {
                    fatalError()
                }
                
                let desctinationControllet = segue.destination as? ProfileViewController
                desctinationControllet?.profile = cellData.users[indexPath.row]
            }
        }
    }
    

}
