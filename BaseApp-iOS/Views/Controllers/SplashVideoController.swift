//
//  SplashVideoController.swift
//  BaseApp-iOS
//
//  Created by Syesoftware on 11/04/17.
//  Copyright © 2017 BaseCompany. All rights reserved.
//

import AVFoundation
import UIKit
import AVKit

class SplashVideoController: AVPlayerViewController {
    private var endCallback: (() -> Void)?
    private var closeView = UIView()
    
    override func viewDidLayoutSubviews() {
        closeView.frame = view.frame
    }
    
    func showSplash(videoFinish: @escaping () -> Void) {
        endCallback = videoFinish
        
        configUI()
        loadPlayer()
    }
    
    private func configUI() {
        showsPlaybackControls = false
        videoGravity = AVLayerVideoGravityResizeAspectFill
        
        let closeTap = UITapGestureRecognizer(target: self, action: #selector(SplashVideoController.stopSplash))
        closeView.isUserInteractionEnabled = true
        closeView.addGestureRecognizer(closeTap)
        view.addSubview(closeView)
    }
    
    private func loadPlayer() {
        if let path = Bundle.main.path(forResource: "splash", ofType: "mp4") {
            let url = NSURL.fileURL(withPath: path)
            player = AVPlayer(url: url)
            
            NotificationCenter.default.addObserver(
                self,
                selector: #selector(SplashVideoController.endSplash),
                name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                object: player?.currentItem
            )
            player?.play()
        }
    }
    
    func stopSplash() {
        endSplash()
    }
    func endSplash() {
        endCallback?()
    }
}
