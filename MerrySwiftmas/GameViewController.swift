//  Copyright (c) 2014 Alex Blewitt. All rights reserved.
//  Licensed under the MIT License. See LICENSE for more details.

import UIKit
import SceneKit

class GameViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		// create a new scene
		let scene = SCNScene()

		// retrieve the SCNView
		let scnView = self.view as SCNView

		// set the scene to the view
		scnView.scene = scene

		// allows the user to manipulate the camera
		scnView.allowsCameraControl = true

		// get the root node from the scene
		let rootNode = scene.rootNode

		// create a ChristmasTree
		let tree = ChristmasTree()
		// and add it to the root node as before
		rootNode.addChildNode(tree)

		// and enable automatic lighting for the scene
		scnView.autoenablesDefaultLighting = true
	}

	override func prefersStatusBarHidden() -> Bool {
		return true
	}

	override func supportedInterfaceOrientations() -> Int {
		if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
			return Int(UIInterfaceOrientationMask.AllButUpsideDown.rawValue)
		} else {
			return Int(UIInterfaceOrientationMask.All.rawValue)
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Release any cached data, images, etc that aren't in use.
	}
}
