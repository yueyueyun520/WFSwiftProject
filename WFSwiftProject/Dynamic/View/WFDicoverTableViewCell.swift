//
//  WFDicoverTableViewCell.swift
//  WFSwiftProject
//
//  Created by efun on 2019/6/17.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

class WFDicoverTableViewCell: UITableViewCell {
    var iocnView:UIImageView?
    var userNameLabel:UILabel?
    var contentLabel:UILabel?
    var fieldLabel:UILabel?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
        configUI()
       
        

        
        
    }
    
    private func configUI() {

        self.iocnView = UIImageView(frame: CGRect(x: 12, y: 12, width: 30, height: 30))
        self.iocnView!.backgroundColor = UIColor.gray
        self.iocnView!.contentMode = .scaleAspectFit
        self.iocnView!.layer.cornerRadius = 15
        self.iocnView!.layer.masksToBounds = true
        self.addSubview(self.iocnView!)

        self.userNameLabel = UILabel(frame: CGRect(x:self.iocnView!.frame.maxX + 6 , y: 12, width: SCREEN_W - 52 - self.iocnView!.frame.maxX - 6 , height: 15))
        self.userNameLabel!.text = "label"
        self.userNameLabel!.textAlignment = NSTextAlignment.left
        self.userNameLabel!.font = UIFont.boldSystemFont(ofSize: 14)
        self.addSubview(self.userNameLabel!)

        self.fieldLabel = UILabel(frame: CGRect(x:self.iocnView!.frame.maxX + 6 , y: self.userNameLabel!.frame.maxY + 3, width: 150, height: 12))
        self.fieldLabel!.text = "欢聚时光  养猫猫 听音乐"
        self.fieldLabel!.textAlignment = NSTextAlignment.left
        self.fieldLabel!.font = UIFont.systemFont(ofSize: 11)
        self.fieldLabel!.textColor = UIColor.gray
        self.addSubview(self.fieldLabel!)

        let knowBtn = UIButton(frame: CGRect(x:SCREEN_W - 52 , y: 12, width: 40, height: 15))
        knowBtn.setTitle("想认识", for: UIControl.State.normal)
        knowBtn.setTitleColor(UIColor.orange, for: UIControl.State.normal)
        knowBtn.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        knowBtn.layer.cornerRadius = 6
        knowBtn.layer.borderWidth = 0.5
        knowBtn.layer.borderColor = UIColor.orange.cgColor
        knowBtn.addTarget(self, action:#selector(WFDicoverTableViewCell.knowClick(button:)) , for: UIControl.Event.touchUpInside)
        self.addSubview(knowBtn)
        
        self.contentLabel = UILabel(frame: CGRect(x:self.iocnView!.frame.maxX + 6 , y: self.fieldLabel!.frame.maxY + 8, width:  SCREEN_W - 30 - self.iocnView!.frame.maxX - 6, height: 16))
        self.contentLabel!.textAlignment = NSTextAlignment.left
        self.contentLabel!.font = UIFont.systemFont(ofSize: 13)
        self.contentLabel!.textColor = UIColor.black
        self.addSubview(self.contentLabel!)
        
        //图片collectionView
        





    }
    
    @objc private func knowClick(button:UIButton) {
        print("wyy")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setModel(listModel:List) {
        //?不确定是否有值  !确定有值
        let user:UserInfo = listModel.userInfo!
        self.userNameLabel?.text = user.nickName!
        self.contentLabel?.text = listModel.content
        
        if user.userIcon != nil {
            do {
                let imageData:Data = try Data.init(contentsOf: NSURL.init(string: user.userIcon!)! as URL)
                let image = UIImage(data: imageData)!
                self.iocnView?.image = image;
            } catch {
                
            }
        } else {
            
        }
    }
}


extension WFDicoverTableViewCell{
  
}
