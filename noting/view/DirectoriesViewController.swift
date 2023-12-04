//
//  DirectoriesViewController.swift
//  noting
//
//  Created by shark boy on 12/3/23.
//

import UIKit

class DirectoriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var fileNumber = 0
    var files: [URL] = []


    @IBOutlet weak var directoriesTableViewOutlet: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let fileManager = FileManager.default
        if let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            do {
                files = try fileManager.contentsOfDirectory(at: documentsDirectory, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            } catch {
                print("An error occurred: \(error)")
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let fileManager = FileManager.default
        let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        do {
            // Get the list of files, excluding hidden files
            let files = try fileManager.contentsOfDirectory(at: documentsDirectory, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            return files.count
        } catch {
            print("An error occurred: \(error)")
            return 0
        }
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DirectoryCell") as! DirectoryTableViewCell

        let fileURL = files[indexPath.row]
        cell.textView?.text = fileURL.lastPathComponent

        return cell
    }

    @IBAction func addFileButtonTapped(_ sender: Any) {
        fileNumber += 1
        let fileNumberString = String(fileNumber)
        
        FileManager.addFolder(folderName: fileNumberString)
        directoriesTableViewOutlet.reloadData()
        
    }
    
    
    
}
