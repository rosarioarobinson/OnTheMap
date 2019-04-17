//
//  StudentArray.swift
//  On The Map
//
//  Created by Rosario A Robinson on 4/17/19.
//  Copyright © 2019 Rosario Robinson. All rights reserved.
//

import Foundation

class StudentArray {
    
    let sharedInstance = StudentArray()
    
    //moved studentArray from StudentInformation in Model file to here.
    var studentsArray = [StudentInformation]()
    
}
