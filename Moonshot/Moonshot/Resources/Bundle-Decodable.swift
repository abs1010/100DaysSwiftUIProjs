//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Alan Silva on 04/05/21.
//

import Foundation

extension Bundle {
    
    func decode<T: Decodable>(_ file: String) -> T {
        
        guard let url = self.url(forResource: file, withExtension: "json") else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let obj = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        
        return obj
        
    }
    
}
