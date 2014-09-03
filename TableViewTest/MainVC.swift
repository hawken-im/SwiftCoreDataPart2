//
//  MainVC.swift
//  TableViewTest
//
//  Created by David Owens on 6/24/14.
//  Copyright (c) 2014 rhinoIO. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //This is your tableView
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Task List"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        table.reloadData()
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return taskMgr.tasks.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell { let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "TableView")
        
        //Assign the contents of our var "items" to the textLabel of each cell
        cell.textLabel!.text = taskMgr.tasks[indexPath.row].name
        cell.detailTextLabel!.text = taskMgr.tasks[indexPath.row].description
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //Create instance of DetailVC
        var detail:DetailVC = self.storyboard?.instantiateViewControllerWithIdentifier("DetailVC") as DetailVC
        
        //Reference DetailVC's var "cellName" and assign it to DetailVC's var "items"
        detail.cellName = taskMgr.tasks[indexPath.row].name
        detail.cellDesc = taskMgr.tasks[indexPath.row].description
        
        //Programmatically push to associated VC (DetailVC)
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
    func tableView(tableView:UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath:NSIndexPath!){
        
        if(editingStyle == UITableViewCellEditingStyle.Delete){
            taskMgr.removeTask(indexPath.row)
            table.reloadData()
        }
        
    }
    
}
