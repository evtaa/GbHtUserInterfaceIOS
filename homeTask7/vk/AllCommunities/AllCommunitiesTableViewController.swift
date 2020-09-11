//
//  AllCommunitiesTableViewController.swift
//  vk
//
//  Created by Alexandr Evtodiy on 07.08.2020.
//  Copyright © 2020 Alexandr Evtodiy. All rights reserved.
//

import UIKit

class AllCommunitiesTableViewController: UITableViewController {
    
    var allCommunities: [Community] = AllCommunitiesFactory.makeAllCommunities()
     var allCommunitiesSearch: [Community] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Убираем разделительные линии между пустыми ячейками
        tableView.tableFooterView = UIView ()
        
        setArrayCommunitySearch(searchText: "")
    }
    
    func setArrayCommunitySearch (searchText: String ) {
        allCommunitiesSearch = []
        for community in allCommunities {
            let name = community.name
            if (name.starts(with: searchText) == false) {
                continue
            }
            allCommunitiesSearch.append(community)
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allCommunitiesSearch.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllCommunitiesCell", for: indexPath) as! AllCommunitiesTableViewCell
        let community = allCommunitiesSearch[indexPath.row]
        cell.setup(community: community)
        return cell
    }
}

extension AllCommunitiesTableViewController: UISearchBarDelegate {
   
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
           setArrayCommunitySearch(searchText: searchText)
           tableView.reloadData()
       }
    
}
