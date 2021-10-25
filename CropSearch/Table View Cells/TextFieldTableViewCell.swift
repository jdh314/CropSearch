//
//  TextFieldTableViewCell.swift
//  CropSearch
//
//  Created by Jonathan Hogue on 10/17/21.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell, UITextFieldDelegate {

    var commentTextField    = UITextField()
    var titleLabel          = UILabel()
    var commentButton       = UIButton()
    var segmentControl      = UISegmentedControl()
    var segmentIndex        = Int()
    
    
    var textFieldReturned: ((String) -> Void)?
    var segmentControlTracking: ((UITableViewCell) -> Void)?
    var cellChange: ((String) -> Void)?
    var segmentChange: ((Int) -> Void)?
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // add views
        addSubview(titleLabel)
        contentView.addSubview(commentButton)
        contentView.addSubview(segmentControl)
        contentView.addSubview(commentTextField)
        
        // set views
        setTitleLabelConstraints(label: titleLabel, topAnchorView: contentView, leadingAnchor: leadingAnchor)
        setCommentButtonConstraints(button: commentButton, image: UIImage(systemName: "xmark")!, viewOne: titleLabel, viewTwo: contentView)
        setSegmentControl(segment: segmentControl, trailingAnchorView: commentButton, topAnchorView: contentView)
        setCommentTextFieldlContraints(textField: commentTextField, viewToAnchorTo: contentView)
        
        // add actions
        commentButton.addTarget(self, action: #selector(commentButtonPressed), for: .touchUpInside)
        segmentControl.addTarget(self, action: #selector(segmentControlSelected), for: .valueChanged)

        // set delegates
        commentTextField.delegate = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @objc func segmentControlSelected() {
        let selectedSegment = segmentControl.selectedSegmentIndex
        segmentControlTracking?(self)
        segmentChange?(selectedSegment)
        setSegmentControlAppearance(segment: self.segmentControl, index: selectedSegment)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        commentTextFieldEndEditing()
        return true
    }
    
    @objc func commentButtonPressed() {
        commentTextField.resignFirstResponder()
        commentTextFieldEndEditing()
    }
    
}

extension TextFieldTableViewCell {
    func commentTextFieldEndEditing() {
        if commentTextField.hasText {
            self.textFieldReturned?(self.commentTextField.text!)
            cellChange?(CellType.comment)
            
        } else {
            cellChange?(CellType.noComment)
        }
    }
}
