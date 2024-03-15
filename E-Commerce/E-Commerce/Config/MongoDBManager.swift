//
//  MongoDBManager.swift
//  E-Commerce
//
//  Created by Orlando Nicolas Marchioli on 14/03/2024.
//

import Foundation
import MongoSwift
import NIO 

class MongoDBManager{
    let client: MongoClient
    let databaseName: String
    
    init(databaseName: String) {
        // Create an EventLoopGroup for the MongoClient
        let eventLoopGroup = MultiThreadedEventLoopGroup(numberOfThreads: System.coreCount)
        
        // Create MongoClient instance with the provided connection string and EventLoopGroup
        self.client = try! MongoClient("mongodb://localhost:27017", using: eventLoopGroup)
        
        self.databaseName = databaseName
    }
    
    func getDatabase() -> MongoDatabase {
        return self.client.db(self.databaseName)
    }
}
