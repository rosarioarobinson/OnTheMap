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
    
    //MARK: Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var pinIcon: UIImageView!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    //Mark: TableView Data
    
    /*override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentLocations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //dequeue
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentLocations", for: indexPath) as! TableViewController
        let meme = memes[indexPath.row]
        cell.nameLabel?.text = meme.topText + "..." + meme.bottomText
        cell.memeImageView?.image = meme.memedImage
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let meme = (UIApplication.shared.delegate as! AppDelegate).memes[(indexPath as NSIndexPath).row]
        
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "MemeDetailViewController", sender: meme)
    }*/
    
    
}
