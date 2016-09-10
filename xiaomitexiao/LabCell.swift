//
//  LabCell.swift
//  autolayoutuse
//
//  Created by lotawei on 16/9/10.
//  Copyright © 2016年 lotawei. All rights reserved.
//


class LabModel: NSObject {
    var   name:String!
    var   isaccessory:Bool!
    var   ptraitor:String!
}
class LabCell: UITableViewCell {
    var   model:LabModel!
   
   override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    
    
    }
    convenience  init(style: UITableViewCellStyle, reuseIdentifier: String?,model:LabModel) {
        self.init(style: style,reuseIdentifier: reuseIdentifier)
        
        let amode = LabModel()
        amode.isaccessory = model.isaccessory
        amode.name = model.name
        amode.ptraitor = model.ptraitor
        self.model  =     amode
        if (model.isaccessory != nil && model.isaccessory) {
            accessoryType = .DisclosureIndicator
        }
        else
        {
            accessoryType = .Checkmark
        }
        imageView?.image = UIImage(named: amode.ptraitor)
        textLabel!.text  = model.name
//        CGSize requiredSize = [cell.textLabel.text sizeWithFont:[UIFont systemFontOfSize:13] constrainedToSize:boundSize lineBreakMode:UILineBreakModeWordWrap];
        textLabel?.font = UIFont.systemFontOfSize(13)
       
        textLabel?.backgroundColor =  UIColor.blueColor()
        textLabel?.tintColor = UIColor.greenColor()
      
    }
    
    
    override func layoutSubviews() {
        let   w =  contentView.frame.size.width
        
        imageView?.sd_layout().leftSpaceToView(contentView,1).widthIs(20).heightIs(20).topSpaceToView(contentView,5)
        textLabel!.sd_layout().topSpaceToView(contentView,5).leftSpaceToView(imageView,15).widthIs(w-30).autoHeightRatio(0)
        
       textLabel!.setMaxNumberOfLinesToShow(0)
       
        
        backgroundColor  =  UIColor.clearColor()
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - 动态 计算行高,根据字符串的实际内容的多少 在固定的宽度和字体的大小，动态的计算出实际的高度
       //MARK: - 获取版本号
    func getCurrentIOS() -> Double
    {
        
        return (UIDevice.currentDevice().systemVersion as NSString).doubleValue
        
    }

    
}
