//
//  AppDelegate.swift
//  iOsSaveData
//
//  Created by Diogenes Dauster on 3/17/19.
//  Copyright © 2019 Diogenes Dauster. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func applicationDidFinishLaunching(_ application: UIApplication) {
        do {
            let directories: [FileManager.SearchPathDirectory] =
                [.documentDirectory,
                 .applicationSupportDirectory,
                 .cachesDirectory
                ]
            for image in try [Image](filename: "images") {
                for directory in directories {
                    try image.save(directory: directory)
                }
            }
        } catch {
            print(error)
        }
    }


}

