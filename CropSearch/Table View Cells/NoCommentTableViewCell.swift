//
//  NoCommentTableViewCell.swift
//  CropSearch
//
//  Created by Jonathan Hogue on 10/17/21.
//

import UIKit

class NoCommentTableViewCell: UITableViewCell {

    var titleLabel          = UILabel()
    var commentButton       = UIButton()
    var segmentControl      = UISegmentedControl()
    
    var cellChange: ((String) -> Void)?
    var segmentControlChanged: ((Int, UITableViewCell) -> Void)?
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // add views
        addSubview(titleLabel)
        contentView.addSubview(commentButton)
        contentView.addSubview(segmentControl)
        
        // set views
        setTitleLabelConstraints(label: titleLabel, topAnchorView: contentView, leadingAnchor: leadingAnchor)
        setCommentButtonConstraints(button: commentButton, image: UIImage(systemName: "plus.bubble")!, viewOne: titleLabel, viewTwo: contentView)
        setSegmentControl(segment: segmentControl, trailingAnchorView: commentButton, topAnchorView: contentView)
        
        // add actions
        commentButton.addTarget(self, action: #selector(commentButtonPressed), for: .touchUpInside)
        segmentControl.addTarget(self, action: #selector(segmentControlSelected), for: .valueChanged)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func segmentControlSelected() {
        
        segmentControlChanged?(segmentControl.selectedSegmentIndex, self)

        setSegmentControlAppearance(segment: self.segmentControl, index: segmentControl.selectedSegmentIndex)
    }
    
    @objc func commentButtonPressed() {
        cellChange?(CellType.textField)
    }
}
