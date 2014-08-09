//
//  TaskManager.swift
//  TableViewTest
//
//  Created by David Owens on 7/4/14.
//  Copyright (c) 2014 rhinoIO. All rights reserved.
//

import UIKit

var taskMgr:TaskManager = TaskManager()

struct Task{
    var name: String = "Name"
    var description: String = "Description"
}

class TaskManager: NSObject {

    var tasks = [Task]()
    var persistenceHelper: PersistenceHelper = PersistenceHelper()
    
    override init(){
        
        var tempTasks:NSArray = persistenceHelper.list("Task")
        for res:AnyObject in tempTasks{
            tasks.append(Task(name:res.valueForKey("name")as String,description:res.valueForKey("desc") as String))
        }
        
    }
    
    func addTask(name:String, desc: String){
        
        var dicTask: Dictionary<String, String> = Dictionary<String,String>()
        dicTask["name"] = name
        dicTask["desc"] = desc

        if(persistenceHelper.save("Task", parameters: dicTask)){
            tasks.append(Task(name: name, description:desc))
        }
    }
    
    func removeTask(index:Int){
        
        var value:String = tasks[index].name
        
        if(persistenceHelper.remove("Task", key: "name", value: value)){
            tasks.removeAtIndex(index)
        }
    }    
    
}

