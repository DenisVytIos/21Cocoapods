//
//  ViewController.swift
//  21Cocoapods
//
//  Created by Denis on 28.12.2019.
//  Copyright © 2019 Denis. All rights reserved.
//

import UIKit
import Jelly
import LTMorphingLabel

class ViewController: UIViewController {
    
    var animator: Animator?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let label = LTMorphingLabel(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        label.text = "Hello brather"
        view.addSubview(label)
        NSLayoutConstraint.activate([view.centerXAnchor.constraint(equalTo: label.centerXAnchor, constant: 0), view.centerYAnchor.constraint(equalTo: label.centerYAnchor, constant: 100)])
        view.layoutIfNeeded()
        label.morphingEffect = .burn
        label.morphingEnabled = true
        label.morphingDuration = 3
        label.morphingCharacterDelay = 0.2
        label.start()
        
        
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "VC")
        let interaction = InteractionConfiguration(presentingViewController: self, completionThreshold: 0.5, dragMode: .edge, mode: .dismiss)
        let presentation = SlidePresentation(direction: .right, interactionConfiguration: interaction)
        animator = Animator(presentation: presentation)
        animator?.prepare(presentedViewController: viewController)
    }

    @IBAction func moveToVC() {
        
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "VC")
        
        let slidePresentation = SlidePresentation(direction: .top)
        let animator = Animator(presentation: slidePresentation)
        animator.prepare(presentedViewController: viewController)
        present(viewController, animated: true, completion: nil)
    }
    
}

