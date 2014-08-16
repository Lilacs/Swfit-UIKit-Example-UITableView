//
//  ViewController.swift
//  editTable
//
//  Created by Vincent on 14-8-16.
//  Copyright (c) 2014年 Vincent. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate ,UITableViewDataSource {
    //数据源
    var data: NSMutableArray = NSMutableArray()
    var table: UITableView = UITableView(frame: CGRectMake(0, 64, 320,416),style: UITableViewStyle.Plain)
    
    @IBOutlet weak var editBtn: UIBarButtonItem!
    @IBOutlet weak var addBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTable()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func initTable() {
        table.delegate = self
        table.dataSource = self
        self.view.addSubview(table)
    }
    
    @IBAction func addData() {
        var value: Int
        if(data.count == 0) {
            value = 1
        }else {
            value = data.lastObject as Int + 1
        }
        data.addObject(value)
        table.reloadData()
    }
    
    @IBAction func edit() {
        if(editBtn.tag == 100) {
            editBtn.tag = 200
            editBtn.title = "Done"
            addBtn.enabled = false
            table.setEditing(true, animated: true)
        }else{
            editBtn.tag = 100
            editBtn.title = "Edit"
            addBtn.enabled = true
            table.setEditing(false, animated: true)
        }
       
        
    }
    
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    //返回每一行的cell
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel.text = "\(data[indexPath.row])"
        return cell
    }
    
    
    //效果->触摸行不高亮
    func tableView(tableView: UITableView!, shouldHighlightRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return false
    }
    
    //编辑模式的按钮点击
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        data.removeObjectAtIndex(indexPath.row)
        table.reloadData()
    }

}

