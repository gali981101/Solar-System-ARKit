//
//  ViewController.swift
//  SolarSystem
//
//  Created by Terry Jason on 2023/8/31.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    let planetArray = [
        ["earth.png", SCNVector3(0, 0.2, -2)],
        ["mars.png", SCNVector3(5, 3, -7)],
        ["venus", SCNVector3(6, 1, -5)],
        ["moon", SCNVector3(3, 6, -10)],
        ["venus", SCNVector3(5, 8, -9)],
        ["earth-Two", SCNVector3(0.8, 0.4, -1)] as [Any]
    ]
    
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        sceneView.automaticallyUpdatesLighting = true
        
        loopToCreate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}


// MARK: Create Sphere

extension ViewController {
    
    private func loopToCreate() {
        for planet in planetArray {
            createSphere(content: planet[0] as! String, vector: planet[1] as! SCNVector3)
        }
    }
    
    private func createSphere(content: String, vector: SCNVector3) {
        
        let mySphere = SCNSphere(radius: 0.5)
        
        let sphereMaterial = SCNMaterial()
        
        sphereMaterial.diffuse.contents = UIImage(named: "art.scnassets/\(content)")
        
        mySphere.materials = [sphereMaterial]
        
        let node = SCNNode()
        
        node.position = vector
        
        node.geometry = mySphere
        
        sceneView.scene.rootNode.addChildNode(node)
        
    }
    
}
