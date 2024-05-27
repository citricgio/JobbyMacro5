//
//  Job+CoreDataProperties.swift
//  JobTrackMacro5
//
//  Created by Giovanna Micher on 26/05/24.
//
//

import Foundation
import CoreData


extension Job {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Job> {
        return NSFetchRequest<Job>(entityName: "Job")
    }

    @NSManaged public var companyName: String?
    @NSManaged public var name: String?
    @NSManaged public var status: String?

}

extension Job : Identifiable {

}
