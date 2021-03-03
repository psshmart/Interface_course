//
//  CommunitiesController.swift
//  vkclient
//
//  Created by Svetlana Safonova on 23.02.2021.
//

import UIKit

class CommunitiesController: UITableViewController {

    var communities = [
        Community(name: "ForCat - 1", picture: UIImage(named: "cats")),
        Community(name: "ForCat - 2", picture: UIImage(named: "cats")),
        Community(name: "ForCat - 3", picture: UIImage(named: "cats")),
        Community(name: "ForCat - 4", picture: UIImage(named: "cats")),
        Community(name: "ForCat - 5", picture: UIImage(named: "cats")),
        Community(name: "ForCat - 6", picture: UIImage(named: "cats")),
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
        return communities.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommunitiesCell", for: indexPath) as? CommunityCell
        else {
            return UITableViewCell()
        }
        cell.configure(community: communities[indexPath.row])

        return cell
    }
    
    @IBAction func findCommunities(segue: UIStoryboardSegue) {
        if let newCommunityController = segue.source as? NewCommunitiesController,
           let selectedIndexPath = newCommunityController.tableView.indexPathForSelectedRow {
            let selectedGroup = newCommunityController.communities[selectedIndexPath.row]
            if !communities.contains(selectedGroup) {
                communities.append(selectedGroup)
                newCommunityController.communities.remove(at: selectedIndexPath.row)
                tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            communities.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

}
