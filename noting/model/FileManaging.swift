//
//  FileManaging.swift
//  noting
//
//  Created by shark boy on 12/3/23.
//

import Foundation

extension FileManager {
    // TODO: fix this shit!!
    static func addFolder(folderName: String) { // will this cause glitches later? // could the parameter usage fuck anything up here later on? yes. delete/change it
        // Get the URL for the app's documents directory
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

        // Create a URL for the new folder
        let folderURL = documentsDirectory.appendingPathComponent(folderName)

        // Check if the folder already exists
        var isDir : ObjCBool = false
        if FileManager.default.fileExists(atPath: folderURL.path, isDirectory:&isDir) {
            if isDir.boolValue {
                // Folder already exists
                print("Folder already exists.")
                return
            }
        }

        // Create the folder
        do {
            try FileManager.default.createDirectory(at: folderURL, withIntermediateDirectories: true, attributes: nil)
            print("Folder created successfully.")
        } catch {
            print("Error creating folder: \(error)")
        }
    }
    
    static func deleteFolders() {
        do {
            let fileManager = FileManager.default
            let documentsDirectory = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            
            // Get all contents of the documents directory
            let contents = try fileManager.contentsOfDirectory(at: documentsDirectory, includingPropertiesForKeys: nil)

            // Iterate through the contents and remove each
            for url in contents {
                try fileManager.removeItem(at: url)
            }
        } catch {
            print("An error occurred: \(error)")
        }
    }

}
