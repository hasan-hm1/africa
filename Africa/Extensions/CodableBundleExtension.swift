//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Hasan on 4/20/24.
//

import Foundation


extension Bundle {
    
    func decode<T : Codable>(_ file : String) -> T {
        // locate the json file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("couldn't find file \(file) in the bundle")
        }
        // get the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("couldn't load the file \(file)")
        }
        // decode the data
        guard let decoded = try? JSONDecoder().decode(T.self, from: data) else {
            fatalError("couldn't decode the data of the file \(file)")
        }
        return decoded
    }
}
