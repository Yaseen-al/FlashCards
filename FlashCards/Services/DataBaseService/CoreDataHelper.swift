//
//  CoreDataHelper.swift
//  FlashCards
//
//  Created by C4Q on 2/14/18.
//  Copyright © 2018 QI. All rights reserved.
//

import Foundation
import UIKit
class CoreDataHelper {
    private init(){}
    static let manager = CoreDataHelper()
    let managedObject = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    //this function will save the data
    func saveAllData(){
        do {
            try managedObject.save()
        } catch let error {
            print("Dev: \(error)")
        }
    }
}
