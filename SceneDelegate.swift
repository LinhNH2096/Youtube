//
//  SceneDelegate.swift
//  YoutubePhake
//
//  Created by Nguyễn Hồng Lĩnh on 27/03/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    //UIResponsder -> UIScene -> UIWindowScence
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScence = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScence)
        let layout = UICollectionViewFlowLayout()
        
        window?.rootViewController = UINavigationController(rootViewController: HomeController(collectionViewLayout: layout))
        //Move window to be in front of any other windows on its level
        window?.makeKeyAndVisible()
       
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        print("Scene - Did disconnect")
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        print("Scene - Did Become Active")
       
    }

    func sceneWillResignActive(_ scene: UIScene) {
        print("Scene - Will Resign Active")
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
       print("Scene - Will Enter Foreground")
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        print("Scene - Did Enter Background")
        
    }


}

