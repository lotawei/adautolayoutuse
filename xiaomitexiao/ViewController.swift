//
//  ViewController.swift
//  xiaomitexiao
//
//  Created by lotawei on 16/9/8.
//  Copyright © 2016年 lotawei. All rights reserved.
//

import UIKit
let    cellindentifiy = "cellid"
class ViewController: UIViewController {
    
    var  strsize:CGSize!
   lazy var   tableview:UITableView = {
        let    tab = UITableView()
        return  tab
    }()
   lazy var    datasource:NSMutableArray = {
        let    da = NSMutableArray(capacity:0)
        return   da
    }()
  lazy  var    cellhe:NSMutableArray =
        {
            let   da = NSMutableArray(capacity:0)
            return  da
    }()
     var   abtn:UIButton!
      var  back:BackScreenView!
    override func viewDidLoad() {
        super.viewDidLoad()
        back = BackScreenView(frame: self.view.bounds)
        
        view.addSubview(back)
        preparedata()
        self.tableview .delegate = self
        self.tableview.dataSource = self
        self.tableview.registerClass(LabCell.self, forCellReuseIdentifier:cellindentifiy )
        self.view.addSubview(tableview)
        var aimage = UIImage(named: "st")
        aimage =   aimage?.stretchableImageWithLeftCapWidth(2, topCapHeight: 2)
        tableview.backgroundView = UIImageView(image: aimage)
        tableview.separatorColor = UIColor.clearColor()
        //来设置一下图片拉伸不变形
        setmyqipao()
    }
    func setmyqipao()  {
      
        // Do any additional setup after loading the view, typically from a nib.
        //设置一个 上面 根据文字拉伸的气泡按钮
        
        abtn = UIButton()
        let  str = getrandomstr()
        
        abtn.setTitle(str, forState: .Normal)
       
        realsetstrsize(str)
        abtn.addTarget(self, action:#selector( change), forControlEvents: .TouchUpInside)
        var   bimage = UIImage(named: "气泡")
        bimage =  bimage?.stretchableImageWithLeftCapWidth(75 , topCapHeight: 20)
        abtn.setBackgroundImage(bimage, forState: .Normal)
        abtn.titleLabel?.textAlignment = .Left
        abtn.titleLabel?.font = UIFont.systemFontOfSize(13)
        abtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        abtn.titleLabel?.numberOfLines = 0
        view.addSubview(abtn)

    }
    override func prefersStatusBarHidden() -> Bool {
        return  true
    }
    func realsetstrsize(str:String)  {
        var   heigh = getLabHeigh(str, font: UIFont.systemFontOfSize(13), width: 75)
        var   widh = getLabWidth(str, font: UIFont.systemFontOfSize(13), height:40)
        widh = widh > 100 ? widh:150
        heigh = heigh > 50 ? heigh:heigh*7
        
        strsize = CGSizeMake(widh, heigh)
    }
    func change()  {
        let  str = getrandomstr()
        abtn.setTitle(str, forState: .Normal)
        realsetstrsize(str)
        self.view.setNeedsLayout()
    }
    func       preparedata(){
        var   strs = ["今天看到你很高星的你不回爱上我么？今天看到你很高星的你不回爱上我么？今天看到你很高星的你不回爱上我么？今天看到你很高星的你不回爱上我么？1","今天看到你很高星的你不回爱上我么？今天看到你很高星的你不回爱上我么？2","今天看到你很高星的你不回爱上我么？今天看到你很高星的你不回爱上我么？今天看到你很高星的你不回爱上我么？3","今天看到你很高星的你不回爱上我么？今天看到你很高星的你不回爱上我么？今天看到你很高星的你不回爱上我么？今天看到你很高星的你不回爱上我么？今天看到你很高星的你不回爱上我么？今天看到你很高星的你不回爱上我么？今天看到你很高星的你不回爱上我么？4"]
        for i in 0..<strs.count {
            let    amode = LabModel()
            amode.isaccessory = i%2==0 ? true : false
            amode.name = strs[i]
            amode.ptraitor = "rain-\(i+1)"
            let  h:CGFloat  = textHeightFromTextString(strs[i], textWidth: 300, fontSize: 13, isBold: true)  + 30
            self.datasource.addObject(amode)
            self.cellhe.addObject(h)
        }
        
    }
    override func viewWillLayoutSubviews()
    {
       
        self.tableview.sd_layout().topSpaceToView(self.view,164).widthIs(self.view.bounds.size.width).heightIs(self.view.bounds.size.height - 200).leftEqualToView(self.view).bottomSpaceToView(self.view,99)
        //这里需要获取计算的字符串高度
        self.abtn.sd_layout().topSpaceToView(self.view,20).centerXEqualToView(self.view).heightIs(strsize.height).widthIs(strsize.width)
        abtn.titleLabel!.sd_layout().leftSpaceToView(abtn,25).topSpaceToView(abtn,5).rightSpaceToView(abtn,10)
        abtn.imageView?.sd_layout().leftSpaceToView(abtn,0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //getrandstr
    func getrandomstr() -> String {
         var  randstrs = ["你好啊","上我么?","我不想理你","看到你很高兴看到你很高兴看到你很高兴"]
        let   r = arc4random_uniform(4)
        var   s =  0
        if r>0 && r<4 {
             s = Int(r)
        }
        
         return  randstrs[s]
        
    }
    func getLabHeigh(labelStr:String,font:UIFont,width:CGFloat) -> CGFloat {
        
        let statusLabelText: NSString = labelStr
        
        let size = CGSizeMake(width, 900)
        
        let dic = NSDictionary(object: font, forKey: NSFontAttributeName)
        
        let strSize = statusLabelText.boundingRectWithSize(size, options: .UsesDeviceMetrics, attributes: dic as? [String : AnyObject], context:nil).size
        
        return strSize.height
        
    }
    func getLabWidth(labelStr:String,font:UIFont,height:CGFloat) -> CGFloat {
        
        let statusLabelText: NSString = labelStr
        
        let size = CGSizeMake(900, height)
        
        let dic = NSDictionary(object: font, forKey: NSFontAttributeName)
        
        let strSize = statusLabelText.boundingRectWithSize(size, options: .TruncatesLastVisibleLine, attributes: dic as? [String : AnyObject], context:nil).size
        
        return strSize.width
        
    }

}
extension   ViewController:UITableViewDelegate,UITableViewDataSource
{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return  1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return     self.datasource.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let   amodel = self.datasource[indexPath.row] as? LabModel
        
        let cell =  LabCell(style: .Default, reuseIdentifier: cellindentifiy, model: amodel!)
        
        return  cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        
        
        
        return  self.cellhe[indexPath.row] as!  CGFloat
    }
    func textHeightFromTextString(text: String, textWidth: CGFloat, fontSize: CGFloat, isBold: Bool) -> CGFloat
    {
        
        
            //iOS7之后
            var dict: NSDictionary = NSDictionary()
            if (isBold) {
                dict = NSDictionary(object: UIFont.boldSystemFontOfSize(fontSize), forKey: NSFontAttributeName)
                
            } else {
                dict = NSDictionary(object: UIFont.systemFontOfSize(fontSize), forKey: NSFontAttributeName)
                
            }
            
            let rect: CGRect = (text as NSString).boundingRectWithSize(CGSizeMake(textWidth, CGFloat(MAXFLOAT)), options: [NSStringDrawingOptions.TruncatesLastVisibleLine, NSStringDrawingOptions.UsesFontLeading, NSStringDrawingOptions.UsesLineFragmentOrigin], attributes: dict as? [String : AnyObject], context: nil)
            return rect.size.height
        }
    
  
    
    

}

