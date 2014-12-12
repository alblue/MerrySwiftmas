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

		// create a cylinder to represent the tree trunk
		let cylinder = SCNCylinder(radius:1, height:3)

		// create a tree node to add to the scene
		let tree = SCNNode(geometry: cylinder)

		// and add it to the root node so it is seen
		rootNode.addChildNode(tree)

		// set the cylinder's colour to brown
		cylinder.firstMaterial?.diffuse.contents = UIColor.brownColor()

		// and enable automatic lighting for the scene
		scnView.autoenablesDefaultLighting = true

		// adding three stacked cones
		for i in 1...3 {
			// adding a cone to represent the tree's leaves
			let cone = SCNNode(geometry: SCNCone(topRadius:0, bottomRadius:3, height:3))

			// position the cone up the Y axis at top of trunk
			cone.position.y = 2 * Float(i) + 1

			// give the tree trunk a green colour
			cone.geometry?.firstMaterial?.diffuse.contents = UIColor.greenColor()

			// and add the cone to the tree
			tree.addChildNode(cone)
		}
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
