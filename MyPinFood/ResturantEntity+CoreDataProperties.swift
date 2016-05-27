//
//  ResturantEntity+CoreDataProperties.swift
//  MyPinFood
//
//  Created by chetaofeng on 16/5/27.
//  Copyright © 2016年 gsunis. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension ResturantEntity {

    @NSManaged var name: String?
    @NSManaged var type: String?
    @NSManaged var location: String?
    @NSManaged var image: NSData?
    @NSManaged var isHasVisited: NSNumber?
    @NSManaged var rating: String?

}
