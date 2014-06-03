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
                            
    @IBOutlet var lut3DSceneView : LUTPreviewSceneView
    @IBOutlet var window: NSWindow
    
    var lut: LUT
    
    init() {
        self.lut = LUT3D(identityOfSize: 32, inputLowerBound: 0, inputUpperBound: 1)
        self.lut = LUTColorTransferFunction.transformedLUTFromLUT(self.lut,
                                                                fromColorTransferFunction: LUTColorTransferFunction.knownColorTransferFunctions()["Rec. 709"] as LUTColorTransferFunction,
                                                                toColorTransferFunction: LUTColorTransferFunction.knownColorTransferFunctions()["Linear"] as LUTColorTransferFunction)
        
    }


    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        // Insert code here to initialize your application
        self.lut3DSceneView.scene = LUTPreviewScene(forLUT: self.lut)
    }

    func applicationWillTerminate(aNotification: NSNotification?) {
        // Insert code here to tear down your application
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(application: NSApplication?) -> Bool {
        return true
    }
    


}

