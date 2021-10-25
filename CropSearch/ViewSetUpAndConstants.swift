//
//  Constraints.swift
//  CropSearch
//
//  Created by Jonathan Hogue on 10/21/21.
//

import Foundation
import UIKit

let selectedSegmentTextColor = [NSAttributedString.Key.foregroundColor: UIColor.white]

func setTitleLabelConstraints(label: UILabel, topAnchorView: UIView, leadingAnchor: NSLayoutAnchor<NSLayoutXAxisAnchor>) {
    label.translatesAutoresizingMaskIntoConstraints                                 = false
    label.heightAnchor.constraint(equalToConstant: 80).isActive                     = true
    label.widthAnchor.constraint(equalToConstant: 450).isActive                     = true
    label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive          = true
    label.centerYAnchor.constraint(equalTo: topAnchorView.topAnchor, constant: 35).isActive  = true
}

func setCommentButtonConstraints(button: UIButton, image: UIImage, viewOne: UIView, viewTwo: UIView) {
    button.tintColor = .systemRed
    button.setTitleColor(.systemPink, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints                = false
    button.heightAnchor.constraint(equalToConstant: 60).isActive    = true
    button.widthAnchor.constraint(equalToConstant: 60).isActive     = true
    button.setImage(image, for: .normal)
    button.leadingAnchor.constraint(equalTo: viewOne.trailingAnchor, constant: 225).isActive  = true
    button.centerYAnchor.constraint(equalTo: viewTwo.topAnchor, constant: 35).isActive       = true
}

func setSegmentControl(segment: UISegmentedControl, trailingAnchorView: UIView, topAnchorView: UIView) {
    segment.translatesAutoresizingMaskIntoConstraints                       = false
    segment.heightAnchor.constraint(equalToConstant: 35).isActive           = true
    segment.widthAnchor.constraint(equalToConstant: 300).isActive           = true
    segment.insertSegment(withTitle: "Acceptable", at: 0, animated: true)
    segment.insertSegment(withTitle: "Unacceptable", at: 1, animated: true)
    segment.insertSegment(withTitle: "N/A", at: 2, animated: true)
    segment.leadingAnchor.constraint(equalTo: trailingAnchorView.trailingAnchor, constant: 10).isActive = true
    segment.centerYAnchor.constraint(equalTo: topAnchorView.topAnchor, constant: 35).isActive           = true
    
}

func setCommentTextFieldlContraints(textField: UITextField, viewToAnchorTo: UIView) {
    textField.translatesAutoresizingMaskIntoConstraints                                                     = false
    textField.leadingAnchor.constraint(equalTo: viewToAnchorTo.leadingAnchor, constant: 15).isActive        = true
    textField.centerYAnchor.constraint(equalTo: viewToAnchorTo.topAnchor, constant: 85).isActive            = true
    textField.heightAnchor.constraint(equalToConstant: 35).isActive                                         = true
    textField.trailingAnchor.constraint(equalTo: viewToAnchorTo.trailingAnchor, constant: -15).isActive     = true
    textField.backgroundColor = .white
    textField.layer.cornerRadius = 5
    textField.layer.borderWidth = 1
}

func setCommentLabelContraints(commentLabel: UILabel, viewToAnchorTo: UIView) {
    commentLabel.translatesAutoresizingMaskIntoConstraints                                                     = false
    commentLabel.leadingAnchor.constraint(equalTo: viewToAnchorTo.leadingAnchor, constant: 15).isActive        = true
    commentLabel.centerYAnchor.constraint(equalTo: viewToAnchorTo.topAnchor, constant: 85).isActive            = true
    commentLabel.heightAnchor.constraint(equalToConstant: 35).isActive                                         = true
    commentLabel.trailingAnchor.constraint(equalTo: viewToAnchorTo.trailingAnchor, constant: -15).isActive     = true
    commentLabel.textColor = .systemRed
    
}

func setSegmentControlAppearance(segment: UISegmentedControl, index: Int) {
    switch index {
    case 0:
        segment.selectedSegmentTintColor = .systemGreen
        segment.setTitleTextAttributes(selectedSegmentTextColor, for: .selected)
    case 1:
        segment.selectedSegmentTintColor = .systemRed
        segment.setTitleTextAttributes(selectedSegmentTextColor, for: .selected)
    case 2:
        segment.selectedSegmentTintColor = .systemGray
        segment.setTitleTextAttributes(selectedSegmentTextColor, for: .selected)
    default:
        return
    }
    
}
