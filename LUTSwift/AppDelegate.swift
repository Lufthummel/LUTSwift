//
//  AppDelegate.swift
//  LUTSwift
//
//  Created by Greg Cotten on 5/13/15.
//  Copyright (c) 2015 Greg Cotten. All rights reserved.
//

import Cocoa
import CocoaLUT

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    @IBOutlet weak var previewScene: LUTPreviewSceneViewController!
    

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application

        let identity33 = LUT3D(identityOfSize: 33, inputLowerBound: 0, inputUpperBound: 1);

        previewScene.setSceneWithLUT(identity33.LUT3DByApplyingFalseColor())
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

