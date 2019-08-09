//
//  WFDynamicViewController.swift
//  WFSwiftProject
//
//  Created by efun on 2019/6/5.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit


protocol nameProtocol {
    func wyy()
}

class WFDynamicViewController: UIViewController {
    var listArray:[List]?
    var wfTableView: UITableView?
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configUI()
        self.loadData()
        
        
        
    }
    
    func loadData() {
        WFDynamicViewModel.loadData { (responeModel) in
            self.listArray = responeModel.dataModel?.dataDic?.list
            if self.listArray!.count > 0 {
                self.wfTableView!.reloadData()
            }
            print(self.listArray!.count)
            
        }
    }
    
    
}

extension WFDynamicViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.listArray != nil {
            return self.listArray!.count
        } else {
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! WFDicoverTableViewCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.setModel(listModel: self.listArray![indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}



//定义私有函数   public 可以添加:UITableViewDataSource,UITableViewDelegate
private extension WFDynamicViewController {
    func configUI() {
        self.title = "全部动态"
        
        let headerView = UILabel(frame: CGRect(x: 0, y: 0, width: SCREEN_W, height: 40))
        headerView.text = "头部"
        headerView.textAlignment = NSTextAlignment.center
        headerView.backgroundColor = UIColor.orange
        
        
        let frame = CGRect(x: 0, y: 88, width: SCREEN_W, height: SCREEN_H - 88 - 83)
        self.wfTableView = UITableView.init(frame:frame, style:.plain)
        self.wfTableView!.dataSource = self
        self.wfTableView!.delegate = self
        self.wfTableView!.register(WFDicoverTableViewCell.self, forCellReuseIdentifier: "cellID")
        self.wfTableView!.tableHeaderView = headerView
        self.view.addSubview(self.wfTableView!)

    }
    
    
    
    
}


/**
 UI 定义
 let textLabel = UILabel()
 textLabel.text = "hello"
 textLabel.frame = CGRect(x:100,y:100,width:100,height:30)
 self.view.addSubview(textLabel)
 */



/**
 集合  像数组，但是无序的。
 var setts = Set<String>()
 setts.insert("hello")
 print(setts)
 setts = ["1","23","34","567"]
 for item in setts {
 print("value is \(item) ")
 }
 setts.remove("34")
 for item in setts {
 print("current value is \(item) ")
 }
 
 if setts.contains("34") {
 print("yes")
 } else {
 print("NO")
 }
 
 //交集，并集，
 let set1:Set = ["2","45","3","76"]
 let set2:Set = ["8","45","65","6"]
 let set3:Set = ["9","0","3","76"]
 //交集：intersection
 // let sort:Set = set1.intersection(set2)
 //返回除了相同的，除了交集，
 // let sort:Set = set1.symmetricDifference(set3)
 //并集
 // let sort:Set = set1.union(set3)
 //返回set1除了并集
 let sort:Set = set1.subtracting(set3)
 for item in sort {
 print(item)
 }
 */

/**
 可选类型  optional 类型 ?表示未设置值时nil 不是指向不存在对象的指针
 var results: String?
 print("value is \(results)")
 results = "hello"
 print("value is \(results)")
 */

/**
 元组 可以放置不同类型，可以定义变量q获取，还可以通过index下标获得
 //元祖
 let girl = (22,"alice")
 let (age,name) = girl
 print("age is \(age)")
 print("name is \(name)")
 print("\(girl.0)")
 print("\(girl.1)")
 
 */



/**
 变量常量定义
 调用：self.constantAndVariables()
 方法：
 func constantAndVariables()  {
 let isShow = true
 //常量 let
 let constantas = 2
 //变量 var
 var textStr: NSMutableString, red: Double
 textStr = "ok 啦啦"
 red = 9.0
 print(constantas)
 print("值是  \(textStr)")
 }
 */


