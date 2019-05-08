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
        
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "tableviewcell")
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableviewcell", for: indexPath) as! TableViewCell
        let student = StudentArray.sharedInstance.studentsArray[indexPath.row]
        let mediaURL = StudentArray.sharedInstance.studentsArray[indexPath.row].mediaURL
     
        //cell default info
        cell.textLabel?.text = "\(student.firstName!) \(student.lastName!)"
        cell.imageView!.image = UIImage(named: "icon_pin")
        cell.detailTextLabel?.text = mediaURL
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        //check if URL is valid
        let app = UIApplication.shared
                guard let urlString = StudentArray.sharedInstance.studentsArray[indexPath.row].mediaURL,
        //show error or open the URL
        let url =  URL(string: urlString) else {
                self.displayError("URL is invalid, please try again.")
                return
        }
        
        if app.canOpenURL(url){
            app.open(url, options: [:], completionHandler: nil)
        }
        else{
            self.displayError("URL is invalid, please try again.")
        }
        
     
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "StudentInformation" {
            let tableViewController = segue.destination as! TableViewController
            
        }
    }*/
    
    func displayError(_ errorString: String?) {
        // create the alert
        let alert = UIAlertController(title: "Error!", message: "Login Has Failed.", preferredStyle: UIAlertControllerStyle.alert)
        // add an action
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
