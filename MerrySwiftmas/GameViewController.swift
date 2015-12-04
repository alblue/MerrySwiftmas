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
		let scnView = self.view as! SCNView

		// set the scene to the view
		scnView.scene = scene

		// allows the user to manipulate the camera
		scnView.allowsCameraControl = true

		// get the root node from the scene
		let rootNode = scene.rootNode

		// add a forest by moving x and z position
		for x in 0.stride(to:100, by:10) {
			for z in 0.stride(to:100, by:10) {

				// create a ChristmasTree
				let tree = ChristmasTree()
				tree.position.x = Float(x)
				tree.position.z = Float(z)
				tree.rotation.y = 1
				tree.rotation.w = Float(M_PI) * Float(arc4random_uniform(180)) / Float(180)

				// and add it to the root node as before
				rootNode.addChildNode(tree)
			}
		}

		// and enable automatic lighting for the scene
		scnView.autoenablesDefaultLighting = true
	}

	override func prefersStatusBarHidden() -> Bool {
		return true
	}

	override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
		if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
			return UIInterfaceOrientationMask.AllButUpsideDown
		} else {
			return UIInterfaceOrientationMask.All
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Release any cached data, images, etc that aren't in use.
	}
}
