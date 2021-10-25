//
//  MainTableViewController.swift
//  CropSearch
//
//  Created by Jonathan Hogue on 10/16/21.
//

import UIKit

class MainTableViewController: UITableViewController {

    let dataSource = DataSource()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Documents"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.facilities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .value1, reuseIdentifier: "cell")
        let cellTitle = dataSource.facilities[indexPath.row].title
        cell.textLabel!.text = "\(cellTitle) Risk Assessment"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        cellSelected(cellIndex: indexPath)
    }
    
    func cellSelected(cellIndex: IndexPath) {
        if cellIndex.row == 0 {
            let nextViewController = FacilityRiskAssessmentTableViewController()
            self.show(nextViewController, sender: self)
        }
    }
}
