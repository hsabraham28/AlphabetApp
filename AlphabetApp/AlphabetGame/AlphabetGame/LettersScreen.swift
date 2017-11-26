//
//  ViewController.swift
//  AlphabetGame
//
//  Created by Hannah Abraham on 11/26/17.
//  Copyright © 2017 Hannah Abraham. All rights reserved.
//

import UIKit
import SceneKit
import ARKit


class LettersScreen: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
            
             func random0to1() -> Double {
                let arc4randomMax = Double(UInt32.max)
                return  (Double(arc4random_uniform(UInt32(5.0 - -5.0 + 5.0))) + -5.0) * Double(arc4random()) / arc4randomMax
            }
        
        
        var letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
       // let text = SCNText(string: "Testing", extrusionDepth: 1)
        
        for i in 0..<letters.count {
            let alph = SCNText(string: letters[i], extrusionDepth: 1)
            
            let material = SCNMaterial()
            material.diffuse.contents = UIColor.green
            alph.materials = [material]
            
            let node = SCNNode()
            node.position = SCNVector3(x: Float(random0to1()), y: Float(random0to1()), z: Float(random0to1()))
            node.scale = SCNVector3(x: 0.03, y: 0.03, z: 0.03)
            node.geometry = alph
            
            sceneView.scene.rootNode.addChildNode(node)
            sceneView.autoenablesDefaultLighting = true
        }
        
//        let material = SCNMaterial()
//        material.diffuse.contents = UIColor.green
//        text.materials = [material]
//
//        let node = SCNNode()
//        node.position = SCNVector3(x: -3.0, y: 0.0, z: -2.0)
//        node.scale = SCNVector3(x: 0.01, y: 0.01, z: 0.01)
//        node.geometry = text
//
//        sceneView.scene.rootNode.addChildNode(node)
//        sceneView.autoenablesDefaultLighting = true
        
        
        
        
        // Show statistics such as fps and timing information
   //     sceneView.showsStatistics = true
        
        // Create a new scene
    //    let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
    //    sceneView.scene = scene
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
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
