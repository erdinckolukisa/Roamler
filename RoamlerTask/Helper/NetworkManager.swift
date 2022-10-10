//
//  NetworkManager.swift
//  RoamlerTask
//
//  Created by Erdinc Kolukisa on 10/7/22.
//

import Foundation
import Reachability

class NetworkManager {
	var reachability: Reachability!
	
	static let sharedInstance: NetworkManager = {
		return NetworkManager()
	}()
	
	init() {
		// Initialise reachability
		reachability = try? Reachability()
		// Register an observer for the network status
		NotificationCenter.default.addObserver(
			self,
			selector: #selector(networkStatusChanged(_:)),
			name: .reachabilityChanged,
			object: reachability
		)
		do {
			// Start the network status notifier
			try reachability.startNotifier()
		} catch {
			print("Unable to start notifier")
		}
	}
	
	@objc func networkStatusChanged(_ notification: Notification) {
		// Do something globally here!
	}
	static func stopNotifier() -> Void {
		do {
			// Stop the network status notifier
			try (NetworkManager.sharedInstance.reachability).startNotifier()
		} catch {
			print("Error stopping notifier")
		}
	}
	
	// Network is reachable
	static func isReachable(completed: @escaping (NetworkManager) -> Void) {
		if (NetworkManager.sharedInstance.reachability).connection != .unavailable {
			completed(NetworkManager.sharedInstance)
		}
	}
	// Network is unreachable
	static func isUnreachable(completed: @escaping (NetworkManager) -> Void) {
		if (NetworkManager.sharedInstance.reachability).connection == .unavailable {
			completed(NetworkManager.sharedInstance)
		}
	}
	// Network is reachable via WWAN/Cellular
	static func isReachableViaWWAN(completed: @escaping (NetworkManager) -> Void) {
		if (NetworkManager.sharedInstance.reachability).connection == .cellular {
			completed(NetworkManager.sharedInstance)
		}
	}
	// Network is reachable via WiFi
	static func isReachableViaWiFi(completed: @escaping (NetworkManager) -> Void) {
		if (NetworkManager.sharedInstance.reachability).connection == .wifi {
			completed(NetworkManager.sharedInstance)
		}
	}
}
