//
//  ViewController.swift
//  NetworkInfo
//
//  Created by M.Ike on 2016/03/07.
//  Copyright © 2016年 M.Ike. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    fileprivate var IPList: [NetworkInfo.IPAddress] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        update()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    fileprivate func update() {
        IPList = NetworkInfo.IPAddressList() ?? []
        tableView.reloadData()
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return IPList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        
        // Configure the cell...
        let inf = IPList[(indexPath as NSIndexPath).row]
        cell.detailTextLabel?.text = inf.device
        cell.textLabel?.text = ((inf.version == NetworkInfo.Version.iPv6) ? "IPv6" : "IPv4") + " : " + inf.IP
        
        if let _ = NetworkInfo.Device(rawValue: inf.device) {
            cell.backgroundColor = UIColor.lightGray
        } else {
            cell.backgroundColor = UIColor.white
        }
        
        
        return cell
    }
    
    // MARK: -
    @IBAction func tapUpdate(_ sender: UIBarButtonItem) {
        update()
    }

}

