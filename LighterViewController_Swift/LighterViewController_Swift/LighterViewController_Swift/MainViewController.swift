//
//  MainViewController.swift
//  LighterViewController_Swift
//
//  Created by Kxx.xxQ 一生相伴 on 15/12/6.
//  Copyright © 2015年 asahi_kuang. All rights reserved.
//

import UIKit

let cellIdentifier = "identifier"
class MainViewController: UIViewController, UITableViewDelegate {
    
    var tableView: UITableView?
    var dataArray: Array<AnyObject>?
    var dataSource: ArrayDataSource?
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.createUI()
        self.makeUpTableView()
        
        // 注册cell
        self.tableView!.registerNib(UINib(nibName: "KQXTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Methods
    func createUI() {
        let navTitleLabel = UILabel(frame: CGRectMake(0, 0, 100, 45))
        navTitleLabel.textAlignment = NSTextAlignment.Center
        navTitleLabel.textColor     = UIColor.whiteColor()
        navTitleLabel.font          = UIFont.boldSystemFontOfSize(20)
        navTitleLabel.text          = "LighterViewController_Swift"
        self.navigationItem.titleView = navTitleLabel;
    }
    
    func makeUpTableView() {
        self.tableView = UITableView(frame: self.view.frame, style: UITableViewStyle.Plain)
        self.tableView!.delegate = self
        
        let block: cellConfigureBlock = {
            cell, item in
            (cell as! KQXTableViewCell).cellLb.text = (item as! String)
        }
        
        self.dataArray = Array.init(["Objective-C", "Swift", "Javascript", "C++", "cocos2d", "..."])
        self.dataArray?.insert("OOOXXX", atIndex: 6)
        self.dataSource = ArrayDataSource(items: self.dataArray!, reuseIdentifier: cellIdentifier, block: block, isSystemCell: false)
        self.tableView!.dataSource = self.dataSource
        self.view.addSubview(self.tableView!)

    }
    
    // MARK: - UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 65
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
