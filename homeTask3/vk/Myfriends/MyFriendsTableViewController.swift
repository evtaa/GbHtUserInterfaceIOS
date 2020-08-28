//
//  MyFriendsTableViewController.swift
//  vk
//
//  Created by Alexandr Evtodiy on 06.08.2020.
//  Copyright © 2020 Alexandr Evtodiy. All rights reserved.
//

import UIKit

class MyFriendsTableViewController: UITableViewController {
    
    var myFriends : [User] = MyFriendsFactory.makeMyFriends()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Убираем разделительные линии между пустыми ячейками
              tableView.tableFooterView = UIView ()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myFriends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Вытащим ячейку из пула
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyFriendCell", for: indexPath) as! MyFriendsTableViewCell
        let user = myFriends [indexPath.row]
        cell.nameFull.text = user.name
        cell.city.text = user.city
        cell.avatarImageView.image = user.avatar
        // cell.imageMyFriend.
        return cell
    }
    
    // MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Проверяем идентификатор чтобы убедиться, что это нужный переход
        if segue.identifier == "getSelectedFriend" {
            // Создаем указатель контроллера на который будет осуществлен переход
            let photosMyFriendCollectionViewController = segue.destination as? PhotosMyFriendCollectionViewController
            // Получаем индекс выделенной ячейки таблицы
            if let indexPath = self.tableView.indexPathForSelectedRow {
                // Передаем экземпляр объекта класса User контроллеру на который будет осуществлен переход
                let friend = self.myFriends[indexPath.row]
                photosMyFriendCollectionViewController?.friendSelected = friend
            }
        }
        
    }
    

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
