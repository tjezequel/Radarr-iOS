//
//  SymbolView.swift
//  Unraid-Notifier
//
//  Created by Thomas Jezequel on 03/12/2018.
//  Copyright © 2018 Thomas. All rights reserved.
//

import UIKit

class SymbolView: UIView {

    var color = UIColor.Theme.orange {
        didSet {
            setNeedsDisplay()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = .clear
    }

}
