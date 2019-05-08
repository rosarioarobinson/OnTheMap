//
//  StudentArray.swift
//  On The Map
//
//  Created by Rosario A Robinson on 4/17/19.
//  Copyright © 2019 Rosario Robinson. All rights reserved.
//

import Foundation


//StudentInformation struct that is stored as an array inside a separate model class.

public class StudentArray {
    
    //Static reference of class
    static let sharedInstance = StudentArray()
    
    // Private initializer so that no one can create instance of this class from outside.
    private init(){}
    
    //Property to hold all the student location.
    var studentsArray = [StudentInformation]()
    
}
