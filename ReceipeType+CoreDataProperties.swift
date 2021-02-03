//
//  ReceipeType+CoreDataProperties.swift
//  RecipeBook
//
//  Created by Ashish Viltoriya on 31/01/21.
//
//

import Foundation
import CoreData


extension ReceipeType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ReceipeType> {
        return NSFetchRequest<ReceipeType>(entityName: "ReceipeType")
    }

    @NSManaged public var receipeType_ID: Int32
    @NSManaged public var receipeType_Name: String?
    @NSManaged public var receipeType_ImageName: String?

}

extension ReceipeType : Identifiable {

}
