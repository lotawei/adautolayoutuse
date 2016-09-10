//
//  BackScreenView.swift
//  xiaomitexiao
//
//  Created by lotawei on 16/9/8.
//  Copyright © 2016年 lotawei. All rights reserved.
//

import   UIKit

class BackScreenView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        image = UIImage(named: "screen")
        
        
    }
   
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
