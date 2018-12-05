//
//  TickView.swift
//  Unraid-Notifier
//
//  Created by Thomas Jezequel on 03/12/2018.
//  Copyright © 2018 Thomas. All rights reserved.
//

import UIKit

class TickView: SymbolView {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {

        let path = UIBezierPath()
        let width = rect.width
        let height = rect.height
        path.move(to: CGPoint(x: width*0.85, y: height*0.25))
        path.addLine(to: CGPoint(x: width*0.34, y: height*0.76))
        path.addLine(to: CGPoint(x: width*0.15, y: height*0.56))

        path.lineCapStyle = .round
        path.lineJoinStyle = .round
        path.lineWidth = 8.0 * (rect.width/100.0)
        color.setStroke()
        path.stroke()

    }

}
