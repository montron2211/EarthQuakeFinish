//
//  MasterTableViewController.swift
//  EarthQuakeApp
//
//  Created by Monmon on 5/21/19.
//  Copyright © 2019 Monmon. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {
    
    var featureData: [Features] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataService.sharedInstance.makeDataTaskRequest { (quake) in
            self.featureData = quake.features
            self.tableView.reloadData()
        }

      
    }

    

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return featureData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.magQR.text = String(featureData[indexPath.row].mag ?? 0)
        cell.place1.text = featureData[indexPath.row].distainsString
        cell.time1.text = featureData[indexPath.row].dateString
        cell.time2.text = featureData[indexPath.row].timeString
        cell.place2.text = featureData[indexPath.row].locationName
        
        

        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? DetailViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            vc?.urlString = featureData[indexPath.row].url ?? ""
        }
    }
   
}
