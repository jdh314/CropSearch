//
//  FacilityRiskAssessmentTableViewController.swift
//  CropSearch
//
//  Created by Jonathan Hogue on 10/16/21.
//

import UIKit

class FacilityRiskAssessmentTableViewController: UITableViewController {

    
    let dataSource = DataSource()
    
    var selectedSegments: [UITableViewCell] = []
    
    let headerCell                                   = HeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "\(dataSource.facilities[0].title) Risk Assessment"
        
        tableView.allowsSelection = false
        
        dataSource.populateData()
        
        tableView.register(NoCommentTableViewCell.self, forCellReuseIdentifier: CellType.noComment)
        tableView.register(CommentTableViewCell.self, forCellReuseIdentifier: CellType.comment)
        tableView.register(TextFieldTableViewCell.self, forCellReuseIdentifier: CellType.textField)
        tableView.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: CellType.sectionHeader)
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.facilityAreas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        // set background color for odd cells
        var bgColor = UIColor()
        switch indexPath.row % 2 {
        case 0:
            bgColor = UIColor.white
        default:
            bgColor = UIColor.systemGray4
        }
        
        let facilityArea = dataSource.facilityAreas[indexPath.row]
        switch facilityArea.cellType {
        case CellType.noComment:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellType.noComment) as! NoCommentTableViewCell
            cell.backgroundColor = bgColor
            cell.titleLabel.text = facilityArea.title
            cell.segmentControl.selectedSegmentIndex = facilityArea.facilityCondition
            setSegmentControlAppearance(segment: cell.segmentControl, index: cell.segmentControl.selectedSegmentIndex)
            if facilityArea.facilityCondition > -1 {
                selectedSegments.append(cell)
            }
            //
            cell.segmentControlTracking = { [weak self] cell in
                self?.segmentControlPressed(cell: cell)
            }
            
            // changes the cell type in the data and reloads the tableView
            cell.cellChange = { [weak self] cellType in
                self?.dataSource.facilityAreas[indexPath.row].cellType = cellType
                if self?.selectedSegments.contains(cell) == true {
                    self?.selectedSegments.remove(at: (self?.selectedSegments.firstIndex(of: cell)!)!)
                }
                self?.tableView.reloadRows(at: [indexPath], with: .bottom)
            }
            
            // sets the objects facility condition to the selected segment
            cell.segmentChange = { [weak self] newSegment in
                self?.dataSource.facilityAreas[indexPath.row].facilityCondition = newSegment
            }
            return cell
            
        case CellType.textField:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellType.textField) as! TextFieldTableViewCell
            cell.backgroundColor = bgColor
            cell.titleLabel.text = facilityArea.title
            cell.segmentControl.selectedSegmentIndex = facilityArea.facilityCondition
            setSegmentControlAppearance(segment: cell.segmentControl, index: cell.segmentControl.selectedSegmentIndex)
            if facilityArea.facilityCondition > -1 {
                selectedSegments.append(cell)
            }
            
            // sets the object comment to the text from text field
            cell.textFieldReturned = { [weak self] comment in
                let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = .short
                let today = Date.init()
                self?.dataSource.facilityAreas[indexPath.row].comments =  "Jonathan Hogue on \(dateFormatter.string(from: today)): " + comment
                cell.commentTextField.text = nil
            }
            cell.segmentControlTracking = { [weak self] cell in
                self?.segmentControlPressed(cell: cell)
            }
            cell.cellChange = { [weak self] cellType in
                self?.dataSource.facilityAreas[indexPath.row].cellType = cellType
                if self?.selectedSegments.contains(cell) == true {
                    self?.selectedSegments.remove(at: (self?.selectedSegments.firstIndex(of: cell)!)!)
                }
                self?.tableView.reloadRows(at: [indexPath], with: .bottom)
            }
            cell.segmentChange = { [weak self] newSegment in
                self?.dataSource.facilityAreas[indexPath.row].facilityCondition = newSegment
            }
            return cell
            
        case CellType.comment:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellType.comment) as! CommentTableViewCell
            cell.backgroundColor = bgColor
            cell.titleLabel.text = facilityArea.title
            cell.segmentControl.selectedSegmentIndex = facilityArea.facilityCondition
            setSegmentControlAppearance(segment: cell.segmentControl, index: cell.segmentControl.selectedSegmentIndex)
            if facilityArea.facilityCondition > -1 {
                selectedSegments.append(cell)
            }
            cell.commentLabel.text = facilityArea.comments
            
            cell.segmentControlTracking = { [weak self] cell in
                self?.segmentControlPressed(cell: cell)
            }
            cell.cellChange = { [weak self] cellType in
                self?.dataSource.facilityAreas[indexPath.row].cellType = cellType
                self?.tableView.reloadRows(at: [indexPath], with: .bottom)
            }
            cell.segmentChange = { [weak self] newSegment in
                self?.dataSource.facilityAreas[indexPath.row].facilityCondition = newSegment
            }
            return cell
            
        default:
            let cell = UITableViewCell()
            cell.largeContentTitle = "cell did not load correctly"
            cell.backgroundColor = .systemRed
            return cell
        }
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let facilityArea = dataSource.facilityAreas[indexPath.row]
        switch facilityArea.cellType {
        case CellType.comment:
            return 140
        case CellType.noComment:
            return 70
        case CellType.textField:
            return 140
        default:
            return 70
        }

    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        headerCell.contentView.backgroundColor = .systemGray
        headerCell.title.textColor = .white
        return headerCell
    }
    
    func segmentControlPressed(cell: UITableViewCell) {
        switch selectedSegments.contains(cell) {
        case true:
            return
        case false:
            if !selectedSegments.contains(cell) {
                selectedSegments.append(cell)
            }
            if selectedSegments.count == dataSource.facilityAreas.count{
                headerCell.contentView.backgroundColor = UIColor.systemGreen
            }
        }
        
    }

}
