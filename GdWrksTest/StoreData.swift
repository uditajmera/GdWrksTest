//
//  StoreData.swift
//  GdWrksTest
//
//  Created by Udit Ajmera on 12/17/16.
//  Copyright © 2016 Udit Ajmera. All rights reserved.
//
//---------------------------------------------------
// MARK: - Project Import
//---------------------------------------------------

import UIKit


class StoreData: NSObject {
    
    var strName:String
    var strAddr:String
    var strPicURL:String

    //---------------------------------------------------
    // MARK: - Initalization
    //---------------------------------------------------
    
    public init(withUserId lintUserId:Int,
                lstrUserName:String,
                lstrAddr:String,
                lstrPicURL:String)
    {
        
        self.strName = lstrUserName
        self.strAddr = lstrAddr
        self.strPicURL = lstrPicURL
        
        super.init()
        
    }
    
    
}
//---------------------------------------------------

