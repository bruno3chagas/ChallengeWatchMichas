//
//  InterfaceController.swift
//  ChallengeWatchMichas WatchKit Extension
//
//  Created by Bruno Chagas on 27/09/17.
//  Copyright © 2017 Bruno Chagas. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var siriButton: WKInterfaceButton!
    var asking = false
    
    
//    var audioPlayer: WKAudioFilePlayer?
//    var path: String!
//    var soundPathURL: URL!
//    var audioFile: WKAudioFileAsset!
//    var audioItem: WKAudioFilePlayerItem!

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
//        path = Bundle.main.path(forResource: "", ofType: "mp3")
//        soundPathURL = URL(fileURLWithPath: path)
//        audioFile = WKAudioFileAsset(url: soundPathURL)
//        audioItem = WKAudioFilePlayerItem(asset: audioFile)
        
//        audioPlayer = WKAudioFilePlayer(playerItem: audioItem)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func siriAction() {
        if asking == false {
            siriButton.setTitle("Ask!")
            asking = true
        }
    
        else {
            asking = false
            let date = Date(timeIntervalSinceNow: 15)
            WKExtension.shared().scheduleSnapshotRefresh(withPreferredDate: date, userInfo: nil, scheduledCompletion: { (error) in
                guard error == nil else {
                    print(error!)
                    return
                }
            })
            WKExtension.shared().scheduleBackgroundRefresh(withPreferredDate: date, userInfo: nil, scheduledCompletion: { (error) in
                guard error == nil else {
                    print(error!)
                    return
                }
            })
            
            WKExtension.shared().isFrontmostTimeoutExtended = true
            WKInterfaceController.reloadRootPageControllers(withNames: ["requestStoryboard"], contexts: nil, orientation: .horizontal, pageIndex: 0)

        }
    }
}

