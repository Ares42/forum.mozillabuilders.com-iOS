//
//  PostCell.swift
//  forum
//
//  Created by Luke Solomon on 11/12/20.
//

import UIKit



class PostCell:UITableViewCell {
  
  
  var icon = UIImageView()
  var label = UILabel()
  var descriptorLabel = UILabel()
  var containerView = UIStackView()
  
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    self.contentView.addSubview(containerView)
    containerView.translatesAutoresizingMaskIntoConstraints = false
    containerView.axis = .horizontal
    containerView.distribution = .fillProportionally
    containerView.alignment = .center
    
    self.containerView.addArrangedSubview(icon)
    self.containerView.addArrangedSubview(label)
    self.containerView.addArrangedSubview(descriptorLabel)
    
    containerView.anchor(
      top: topAnchor,
      left: leftAnchor,
      bottom: bottomAnchor,
      right: rightAnchor,
      paddingTop: 0,
      paddingLeft: 8,
      paddingBottom: 0,
      paddingRight: 8,
      width: 0,
      height: 0,
      enableInsets: true
    )
    
    label.setContentHuggingPriority(.defaultLow + 1, for: .horizontal)
    label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
    
    descriptorLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
    descriptorLabel.setContentCompressionResistancePriority(.defaultHigh + 1, for: .horizontal)
    
    descriptorLabel.textAlignment = .right
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
}
