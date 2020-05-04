//
//  SceneDelegate.swift
//  ThinkingInSwiftUI
//
//  Created by David Hart on 26.04.20.
//  Copyright © 2020 David Hart. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        // Chapter 2

//        let remote = Remote<[Photo]>(url: URL(string: "https://picsum.photos/v2/list")!, transform: { data in
//            let decoder = JSONDecoder()
//            let photos = try decoder.decode([Photo].self, from: data)
//            return photos
//        })
//        let contentView = PhotosView(remote: remote)

        // Chapter 3

//        let contentView = KnobController()

        // Chapter 4

        let contentView = Playground()

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
