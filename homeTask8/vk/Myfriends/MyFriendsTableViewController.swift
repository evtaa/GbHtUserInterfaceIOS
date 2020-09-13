//
//  MyFriendsTableViewController.swift
//  vk
//
//  Created by Alexandr Evtodiy on 06.08.2020.
//  Copyright © 2020 Alexandr Evtodiy. All rights reserved.
//

import UIKit

class MyFriendsTableViewController: UITableViewController {
    
    var myFriendsDictionary : [String : [User]] = [:]
    var myFriendNameSectionTitles : [String] = []
    var myFriends : [User] = MyFriendsFactory.makeMyFriends()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Убираем разделительные линии между пустыми ячейками
        tableView.tableFooterView = UIView ()
        
        setDictionaryAndSectionTitlesOfMyFriends(searchText: "")
    }
    
    func setDictionaryAndSectionTitlesOfMyFriends (searchText: String ) {
        // Формирование словаря друзей ключ: [друг]  и массива ключей
        myFriendsDictionary = [:]
        myFriendNameSectionTitles = []
        for myFriend in myFriends {
            let name = myFriend.name
            if (name.starts(with: searchText) == false) {
                continue
            }
            let myFriendNameKey = String (name.prefix(1))
            if myFriendsDictionary [myFriendNameKey] == nil {
                myFriendsDictionary [myFriendNameKey] = []
            }
            myFriendsDictionary[myFriendNameKey]?.append(myFriend)
        }
        myFriendNameSectionTitles = myFriendsDictionary.keys.sorted()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return myFriendNameSectionTitles.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return myFriends.count
        
        let myFriendNameKey = myFriendNameSectionTitles [section]
        if let myFriendValues = myFriendsDictionary [myFriendNameKey] {
            return myFriendValues.count
        }
        return 0
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Вытащим ячейку из пула
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyFriendCell", for: indexPath) as! MyFriendsTableViewCell
        
        let myFriendNameKey = myFriendNameSectionTitles [indexPath.section]
        if let myFriendValue = myFriendsDictionary [myFriendNameKey] {
            let user = myFriendValue [indexPath.row]
            cell.setup(user: user)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return myFriendNameSectionTitles [section]
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return myFriendNameSectionTitles
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
                
                let myFriendNameKey = myFriendNameSectionTitles [indexPath.section]
                if let myFriendValue = myFriendsDictionary [myFriendNameKey] {
                    let friend = myFriendValue[indexPath.row]
                    photosMyFriendCollectionViewController?.friendSelected = friend
                }
            }
        }
        
    }
}

extension MyFriendsTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        setDictionaryAndSectionTitlesOfMyFriends(searchText: searchText)
        tableView.reloadData()
    }
    
}



//MARK: trash for me
//    func setDictionaryAndSectionTitlesOfMyFriends (searchText: String ) {
//        // Формирование словаря друзей ключ: [друг]  и массива ключей
//        for myFriend in myFriends {
//            let myFriendNameKey = String (myFriend.name.prefix(1))
//            if var myFriendValues = myFriendsDictionary [myFriendNameKey] {
//                // Формирование массива друзей
//                myFriendValues.append(myFriend)
//                myFriendsDictionary [myFriendNameKey] = myFriendValues
//            } else {
//                myFriendsDictionary [myFriendNameKey] = [myFriend]
//            }
//        }
//        myFriendNameSectionTitles = [String] (myFriendsDictionary.keys)
//        myFriendNameSectionTitles = myFriendNameSectionTitles.sorted(by: {$0 < $1})
//    }
