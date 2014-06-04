//
//  AppDelegate.swift
//  LUTSwift
//
//  Created by Greg Cotten on 6/3/14.
//  Copyright (c) 2014 Greg Cotten. All rights reserved.
//

import Cocoa
import SceneKit

class AppDelegate: NSObject, NSApplicationDelegate {
                            
    @IBOutlet var window: NSWindow
    @IBOutlet var previewSceneViewController : LUTPreviewSceneViewController
    
    var lut: LUT
    
    init() {
        lut = LUT3D(identityOfSize: 32, inputLowerBound: 0, inputUpperBound: 1)
        let cineon = LUTColorTransferFunction.knownColorTransferFunctions()["Rec. 709"] as LUTColorTransferFunction
        let linear = LUTColorTransferFunction.knownColorTransferFunctions()["Linear"] as LUTColorTransferFunction
        lut = LUTColorTransferFunction.transformedLUTFromLUT(lut, fromColorTransferFunction:cineon, toColorTransferFunction:linear)
    }

    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        previewSceneViewController.setSceneWithLUT(lut);
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(application: NSApplication?) -> Bool {
        return true
    }
    
}

