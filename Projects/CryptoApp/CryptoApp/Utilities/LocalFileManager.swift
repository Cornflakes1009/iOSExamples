//
//  LocalFileManager.swift
//  CryptoApp
//
//  Created by Harold Davidson on 1/20/25.
//

import SwiftUI

class LocalFileManager {
    static let instance = LocalFileManager()
    
    private init() {}
    
    func saveImage(image: UIImage, imageName: String, folderNmae: String) {
        // create folder
        createFolderIfNeeded(folderName: folderNmae)
        
        // get path for image
        guard let data = image.pngData(),
        let url = getURLForImage(imageName: imageName, folderName: folderNmae)
        else { return }// can't save an actual image to the file managers, but can save the data
        
        // save image to path
        do {
            try data.write(to: url)
        } catch {
            print("Error saving image. imageName: \(imageName) \(error)")
        }
    }
    
    func getImage(imageName: String, folderName: String) -> UIImage? {
        guard let url = getURLForImage(imageName: imageName, folderName: folderName),
        FileManager.default.fileExists(atPath: url.path) else { return nil }
        
        return UIImage(contentsOfFile: url.path)
    }
    
    private func createFolderIfNeeded(folderName: String) {
        guard let url = getURLForFolder(folderNmae: folderName) else { return }
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
            } catch let error {
                print("Error creating directory. FolderName: \(folderName). \(error)")
            }
        }
    }
    
    private func getURLForFolder(folderNmae: String) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return nil }
        
        return url.appendingPathComponent(folderNmae)
    }
    
    private func getURLForImage(imageName: String, folderName: String) -> URL? {
        guard let folderURL = getURLForFolder(folderNmae: folderName) else { return nil }
        
        return folderURL.appendingPathComponent(imageName + ".png") // since we're saving it as a png, we're adding the file extension
    }
}
