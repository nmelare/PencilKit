//
//  ViewController.swift
//  PencilKitTest
//
//  Created by Nathalia Melare on 07/04/20.
//  Copyright © 2020 Nathalia Melare. All rights reserved.
//

import UIKit
import PencilKit

class ViewController: UIViewController {

    lazy var canvasView: PKCanvasView = PKCanvasView(frame: self.view.frame)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(canvasView)
        
        canvasView.backgroundColor = .clear
        canvasView.isOpaque = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let window = view.window, let toolPIcker = PKToolPicker.shared(for: window) else {return}
        toolPIcker.setVisible(true, forFirstResponder: canvasView)
        toolPIcker.addObserver(canvasView)
        canvasView.becomeFirstResponder()
    }

}

