//
//  GameUIButton.swift
//  Game15
//
//  Created by Serena Dose on 25/08/2017.
//  Copyright © 2017 Serena Dsoe. All rights reserved.
//

import UIKit

class GameUIButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    let lightColor = UIColor(displayP3Red: 0.99, green: 1.0, blue: 0.96, alpha: 1.0)
    let darkColor = UIColor(displayP3Red: 0.14, green: 0.43, blue: 0.53, alpha: 1.0)
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        //self.layer.borderWidth = 2
        self.backgroundColor = lightColor
        self.layer.cornerRadius = 4
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 2
        
        
    }



}
