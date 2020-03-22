//
//  ViewController.swift
//  Kanjay
//
//  Created by Andika Banuraga on 26/04/19.
//  Copyright © 2019 Andika Banuraga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startButton.applyDesign()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

}

extension UIButton {
    
    func applyDesign(){
        
        self.layer.cornerRadius = self.frame.height / 2
        
    }
    
}
