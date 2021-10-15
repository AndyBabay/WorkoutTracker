//
//  webview.swift
//  WorkoutTracker
//
//  Created by Raj Patel on 5/2/21.
//

import Foundation
import SwiftUI
import WebKit 

struct SwiftUIWebView: UIViewRepresentable {
    let url: URL?
    func makeUIView(context: Context) -> WKWebView {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let config = WKWebViewConfiguration()
        return WKWebView(frame: .zero, configuration: config)
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let myURL = url else {
            return
        }
        let request = URLRequest(url: myURL)
        uiView.load(request)
    }

}
