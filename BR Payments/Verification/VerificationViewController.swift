//
//  VerificationViewController.swift
//  BR Payments
//
//  Created by Max Khan on 7/29/18.
//  Copyright © 2018 Max Khan. All rights reserved.
//

import UIKit
import AgoraRtcEngineKit

class VerificationViewController: BRViewController {
	
	// MARK: - Variables
	
	weak var localVideo: UIView!
	weak var remoteVideo: UIView!
	weak var controlButtons: UIView!
	weak var remoteVideoMutedIndicator: UIImageView!
	weak var localVideoMutedBg: UIImageView!
	weak var localVideoMutedIndicator: UIImageView!
	
	let APP_ID = "950aa431a46c40a59698720ba17ee87b"
	
	var agoraKit: AgoraRtcEngineKit!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupButtons()
		hideVideoMuted()
		initializeAgoraEngine()
		setupVideo()
		setupLocalVideo()
		joinChannel()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	// MARK: - Functions
	
	// Tutorial Step 1
	func initializeAgoraEngine() {
		agoraKit = AgoraRtcEngineKit.sharedEngine(withAppId: APP_ID, delegate: self)
	}
	
	// Tutorial Step 2
	func setupVideo() {
		agoraKit.enableVideo()  // Default mode is disableVideo
		agoraKit.setVideoProfile(.landscape360P, swapWidthAndHeight: false) // Default video profile is 360P
	}
	
	// Tutorial Step 3
	func setupLocalVideo() {
		let videoCanvas = AgoraRtcVideoCanvas()
		videoCanvas.uid = 0
		videoCanvas.view = localVideo
		videoCanvas.renderMode = .adaptive
		agoraKit.setupLocalVideo(videoCanvas)
	}
	
	// Tutorial Step 4
	func joinChannel() {
		agoraKit.joinChannel(byToken: nil, channelId: "demoChannel1", info:nil, uid:0) {[weak self] (sid, uid, elapsed) -> Void in
			// Join channel "demoChannel1"
			if let weakSelf = self {
				weakSelf.agoraKit.setEnableSpeakerphone(true)
				UIApplication.shared.isIdleTimerDisabled = true
			}
		}
	}
	
	// Tutorial Step 6
	func didClickHangUpButton(_ sender: UIButton) {
		leaveChannel()
	}
	
	func leaveChannel() {
		agoraKit.leaveChannel(nil)
		hideControlButtons()   // Tutorial Step 8
		UIApplication.shared.isIdleTimerDisabled = false
		remoteVideo.removeFromSuperview()
		localVideo.removeFromSuperview()
	}
	
	// Tutorial Step 8
	func setupButtons() {
		perform(#selector(hideControlButtons), with:nil, afterDelay:8)
		let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(VerificationViewController.ViewTapped))
		view.addGestureRecognizer(tapGestureRecognizer)
		view.isUserInteractionEnabled = true
	}
	
	@objc func hideControlButtons() {
		controlButtons.isHidden = true
	}
	
	@objc func ViewTapped() {
		if (controlButtons.isHidden) {
			controlButtons.isHidden = false;
			perform(#selector(hideControlButtons), with:nil, afterDelay:8)
		}
	}
	
	func resetHideButtonsTimer() {
		VerificationViewController.cancelPreviousPerformRequests(withTarget: self)
		perform(#selector(hideControlButtons), with:nil, afterDelay:8)
	}
	
	// Tutorial Step 9
	@IBAction func didClickMuteButton(_ sender: UIButton) {
		sender.isSelected = !sender.isSelected
		agoraKit.muteLocalAudioStream(sender.isSelected)
		resetHideButtonsTimer()
	}
	
	// Tutorial Step 10
	@IBAction func didClickVideoMuteButton(_ sender: UIButton) {
		sender.isSelected = !sender.isSelected
		agoraKit.muteLocalVideoStream(sender.isSelected)
		localVideo.isHidden = sender.isSelected
		localVideoMutedBg.isHidden = !sender.isSelected
		localVideoMutedIndicator.isHidden = !sender.isSelected
		resetHideButtonsTimer()
	}
	
	func hideVideoMuted() {
		remoteVideoMutedIndicator.isHidden = true
		localVideoMutedBg.isHidden = true
		localVideoMutedIndicator.isHidden = true
	}
	
	// Tutorial Step 11
	@IBAction func didClickSwitchCameraButton(_ sender: UIButton) {
		sender.isSelected = !sender.isSelected
		agoraKit.switchCamera()
		resetHideButtonsTimer()
	}
}

extension VerificationViewController: AgoraRtcEngineDelegate {
	// Tutorial Step 5
	func rtcEngine(_ engine: AgoraRtcEngineKit, firstRemoteVideoDecodedOfUid uid:UInt, size:CGSize, elapsed:Int) {
		if (remoteVideo.isHidden) {
			remoteVideo.isHidden = false
		}
		let videoCanvas = AgoraRtcVideoCanvas()
		videoCanvas.uid = uid
		videoCanvas.view = remoteVideo
		videoCanvas.renderMode = .adaptive
		agoraKit.setupRemoteVideo(videoCanvas)
	}
	
	// Tutorial Step 7
	internal func rtcEngine(_ engine: AgoraRtcEngineKit, didOfflineOfUid uid:UInt, reason:AgoraUserOfflineReason) {
		self.remoteVideo.isHidden = true
	}
	
	// Tutorial Step 10
	func rtcEngine(_ engine: AgoraRtcEngineKit, didVideoMuted muted:Bool, byUid:UInt) {
		remoteVideo.isHidden = muted
		remoteVideoMutedIndicator.isHidden = !muted
	}
	
}
