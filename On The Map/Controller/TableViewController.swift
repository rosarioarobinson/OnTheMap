//
//  TableViewController.swift
//  On The Map
//
//  Created by Rosario A Robinson on 1/10/19.
//  Copyright © 2019 Rosario Robinson. All rights reserved.
//

import Foundation
import UIKit

class  TableViewController: UITableViewController {
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    //MARK: TableView Data
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StudentArray.sharedInstance.studentsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //dequeue
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentInformation", for: indexPath) as! UITableViewCell
        let student = StudentArray.sharedInstance.studentsArray[indexPath.row]
        let mediaURL = StudentArray.sharedInstance.studentsArray[indexPath.row].mediaURL
     
        //cell default info
        cell.textLabel?.text = (student.firstName!) + "..." + (student.lastName!)
        cell.imageView!.image = UIImage(named: "icon_pin")
        cell.detailTextLabel?.text = mediaURL
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        let app = UIApplication.shared
        let url = StudentArray.sharedInstance.studentsArray[indexPath.row].mediaURL
        
     
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TableViewController" {
            let tableViewController = segue.destination as! TableViewController
            
        }
    }*/
    
    
}
