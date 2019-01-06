//
//  MessageCell.swift
//  GroupedMassages
//
//  Created by takeru on 2018/12/10.
//  Copyright © 2018 takeru. All rights reserved.
//

import UIKit

final class MessageCell: UITableViewCell {

    private var bubbleView: UIView!
    private var messageLabel: UILabel!

    private var leadingConstraint: NSLayoutConstraint!
    private var trailingConstraint: NSLayoutConstraint!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        addConstraint()
    }

    private func setupView() {
        backgroundColor = .clear
        selectionStyle = .none

        bubbleView = UIView()
        bubbleView.backgroundColor = .yellow
        bubbleView.translatesAutoresizingMaskIntoConstraints = false
        bubbleView.clipsToBounds = true
        bubbleView.layer.cornerRadius = 12
        addSubview(bubbleView)

        messageLabel = UILabel()
        messageLabel.numberOfLines = 0
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(messageLabel)
    }

    private func addConstraint() {
        messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32).isActive = true
        messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250).isActive = true

        bubbleView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -16).isActive = true
        bubbleView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -16).isActive = true
        bubbleView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 16).isActive = true
        bubbleView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16).isActive = true

        leadingConstraint = messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32)
        leadingConstraint.isActive = false

        trailingConstraint = messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        trailingConstraint.isActive = false
    }

    var message: Message? {
        didSet {
            guard let message = message else { return }
            messageLabel.text = message.text
            bubbleView.backgroundColor = message.isIncoming ? .white : .darkGray
            messageLabel.textColor = message.isIncoming ? .black : .white

            if message.isIncoming {
                leadingConstraint.isActive = true
                trailingConstraint.isActive = false
            } else {
                leadingConstraint.isActive = false
                trailingConstraint.isActive = true
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
