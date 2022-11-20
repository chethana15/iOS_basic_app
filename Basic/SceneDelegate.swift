//
//  SceneDelegate.swift
//  Basic
//
//  Created by Cumulations Technologies Private Limited on 19/11/22.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        //MARK: - here make sure to direct ur app to particular screen
        //check if user is already signed in. If yes direct to home screen else to sign in screen
        let userdefaults = UserDefaults.standard
        let islogin = userdefaults.bool(forKey: "logIn")
        if (islogin) {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            
            let navigationController = UINavigationController()
            let rootViewController = storyBoard.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
            navigationController.viewControllers = [rootViewController]
            self.window?.rootViewController = navigationController
        }else{
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            
            let navigationController = UINavigationController()
            let rootViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            navigationController.viewControllers = [rootViewController]
            self.window?.rootViewController = navigationController
        }
        print("willConnectTo")
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
        
        print("sceneDidDisconnect")
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        print("sceneDidBecomeActive")
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        print("sceneWillResignActive")
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        print("sceneWillEnterForeground")
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        //MARK: - Try to make app screen blur when in background
        print("sceneDidEnterBackground")
    }


}

