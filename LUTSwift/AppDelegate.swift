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
        let cineon = LUTColorTransferFunction.knownColorTransferFunctions().filter(){
            ($0 as! LUTColorTransferFunction).name == "Cineon"
        }[0] as! LUTColorTransferFunction
        let linear = LUTColorTransferFunction.linearTransferFunction()

        previewScene.setSceneWithLUT(identity33.LUT3DByConvertingToMonoWithConversionMethod(LUTMonoConversionMethod.AverageRGB))
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

