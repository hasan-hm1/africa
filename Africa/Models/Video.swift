//
//  Video.swift
//  Africa
//
//  Created by Hasan on 4/23/24.
//

import Foundation


struct Video : Codable, Identifiable{
    
    let id : String
    let name : String
    let headline : String
    
    var thumbnil : String {
       return  "video-\(id)"
    }
}
