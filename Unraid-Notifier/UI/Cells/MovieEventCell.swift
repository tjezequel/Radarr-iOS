//
//  MovieEventTableViewCell.swift
//  Unraid-Notifier
//
//  Created by Thomas Jezequel on 02/12/2018.
//  Copyright © 2018 Thomas. All rights reserved.
//

import UIKit

class MovieEventTableViewCell: UITableViewCell {

    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18.0)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        titleLabel.autoPinEdge(toSuperviewMargin: .left)
        titleLabel.autoAlignAxis(toSuperviewAxis: .horizontal)
    }

    func createView() {
        addSubview(titleLabel)
    }

}
