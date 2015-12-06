//
//  ArrayDataSource.swift
//  LighterViewController_Swift
//
//  Created by Kxx.xxQ 一生相伴 on 15/12/6.
//  Copyright © 2015年 asahi_kuang. All rights reserved.
//

import UIKit

// 设置cell回调block
typealias cellConfigureBlock = (AnyObject, AnyObject) ->Void

class ArrayDataSource: UIViewController, UITableViewDataSource {
    var reuseIdentifier: String?
    var dataArray      : Array<AnyObject>?
    var block          : cellConfigureBlock?
    var isSystemCell   : Bool?
    
    init(items:Array<AnyObject>, reuseIdentifier:String, block:cellConfigureBlock, isSystemCell:Bool) {
        self.dataArray = items
        self.reuseIdentifier = reuseIdentifier
        self.block = block
        self.isSystemCell = isSystemCell
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("neet to init")
    }
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Methods
    func objectAtIndexPath(indexPath:NSIndexPath) ->AnyObject {
        return self.dataArray![indexPath.row]
    }
    
    //MARK: - UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let item = self.objectAtIndexPath(indexPath)
        // 需要区分是否为系统自带cell
        switch self.isSystemCell {
        case true?:
            // 是系统自带
            var cell = tableView.dequeueReusableCellWithIdentifier(self.reuseIdentifier!)
            if cell == nil {
                cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: self.reuseIdentifier)
            }
            else {
                while cell!.contentView.subviews.last != nil {
                    cell!.contentView.subviews.last!.removeFromSuperview()
                }
            }
            self.block!(cell!, item)
            return cell!
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier(self.reuseIdentifier!, forIndexPath: indexPath)
            self.block!(cell, item)
            return cell
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
