//
//  MyCommunitiesTableViewController.swift
//  vk
//
//  Created by Alexandr Evtodiy on 07.08.2020.
//  Copyright © 2020 Alexandr Evtodiy. All rights reserved.
//

import UIKit

class MyCommunitiesTableViewController: UITableViewController {
    
    var myCommunities : [Community] = []
    
    @IBAction func addCommunity (segue: UIStoryboardSegue) {
        if segue.identifier == "addCommunity" {
            let allCommunitiesTableViewController = segue.source as! AllCommunitiesTableViewController
            //            if let indexPath = allCommunitiesTableViewController.tableView.indexPathForRow {
            //            }
            if let indexPath = allCommunitiesTableViewController.tableView.indexPathForSelectedRow {
                let community = allCommunitiesTableViewController.allCommunities [indexPath.row]
              //  if myCommunities.contains(where: (community) //throw->Boll) {
                
                    myCommunities.append(community)
                    tableView.reloadData()
              //  }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Убираем разделительные линии между пустыми ячейками
        tableView.tableFooterView = UIView ()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myCommunities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCommunitiesCell", for: indexPath) as! MyCommunitiesTableViewCell
        let community = myCommunities[indexPath.row]
        cell.name.text = community.name
        cell.imageName.image = UIImage.init(named: community.imageName)
        
        return cell
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
        myCommunities.remove(at: indexPath.row)
     tableView.deleteRows(at: [indexPath], with: .fade)
     }
     //else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    // }
     }
     
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
