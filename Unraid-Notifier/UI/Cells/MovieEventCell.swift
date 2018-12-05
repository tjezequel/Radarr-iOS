//
//  MovieEventTableViewCell.swift
//  Unraid-Notifier
//
//  Created by Thomas Jezequel on 02/12/2018.
//  Copyright © 2018 Thomas. All rights reserved.
//

import UIKit

class MovieEventCell: UITableViewCell {

    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0, weight: .bold)
        label.numberOfLines = 1
        label.textColor = .white
        return label
    }()

    var eventLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.textColor = .white
        return label
    }()

    var symbolView: SymbolView = {
        let view = TickView()
        view.contentMode = .redraw
        return view
    }()

    var selectedBackground: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.Theme.orange
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    override func layoutSubviews() {

        super.layoutSubviews()

        //Setting up the label constraints
        titleLabel.autoPinEdge(toSuperviewMargin: .leading)
        titleLabel.autoPinEdge(toSuperviewMargin: .top)
        titleLabel.autoPinEdge(toSuperviewMargin: .trailing)
        titleLabel.autoSetDimension(.height, toSize: 18.0, relation: .greaterThanOrEqual)

        //Setting up the image view constraints
        symbolView.autoPinEdge(toSuperviewMargin: .leading)
        symbolView.autoPinEdge(toSuperviewMargin: .bottom)
        symbolView.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 10.0)
        symbolView.autoMatch(.width, to: .height, of: symbolView, withMultiplier: 1.0)

        //Setting up the label constraints
        eventLabel.autoPinEdge(.leading, to: .trailing, of: symbolView, withOffset: 10.0)
        eventLabel.autoAlignAxis(.horizontal, toSameAxisOf: symbolView)
    }

//    func setupImage(forEvent event: MovieEventType) {
//        switch event {
//        case .download:
//            self.symbolView.image = UIImage(named: "Download")
//        case .grab:
//            self.symbolView.image = UIImage(named: "Grab")
//        }
//    }

    func setupView() {

        backgroundColor = .clear
        contentView.backgroundColor = .clear

        contentView.addSubview(titleLabel)
        contentView.addSubview(symbolView)
        contentView.addSubview(eventLabel)

        selectedBackgroundView = selectedBackground

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        titleLabel.textColor = selected ? .black : .white
        eventLabel.textColor = selected ? .black : .white
        symbolView.color = selected ? .black : UIColor.Theme.orange
    }

}
