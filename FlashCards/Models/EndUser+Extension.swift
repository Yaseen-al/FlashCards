//
//  EndUser+Extension.swift
//  FlashCards
//
//  Created by C4Q on 2/13/18.
//  Copyright © 2018 QI. All rights reserved.
//

import Foundation
import CoreData
extension EndUser{
    
    convenience init(userName: String, age: Int16, nationality: String, managedObjectContext: NSManagedObjectContext){
        self.init(context: managedObjectContext)
        self.userName = userName
        self.age = age
        self.nationality = nationality
    }
    func intoJSON()->[String: Any]{
        var dectionary = [String: Any]()
        dectionary["userName"] = userName
        dectionary["age"] = age
        dectionary["nationality"] = nationality
        return dectionary
    }
}
