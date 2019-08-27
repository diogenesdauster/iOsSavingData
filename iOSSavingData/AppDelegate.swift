//
//  AppDelegate.swift
//  iOSSavingData
//
//  Created by Diógenes Dauster on 8/23/19.
//  Copyright © 2019 Dauster. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    
    func applicationDidFinishLaunching(_: UIApplication) {
      do {
        let directories: [FileManager.SearchPathDirectory] = [
          .documentDirectory, .applicationSupportDirectory, .cachesDirectory
        ]
        for image in try [Image](fileName: "images") {
          for directory in directories {
            try image.save(directory: directory)
          }
        }
      }
      catch {
        print(error)
      }
    }
 


}

