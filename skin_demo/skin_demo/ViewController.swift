//
//  ViewController.swift
//  skin_demo
//
//  Created by Sun Shijie on 2017/10/10.
//  Copyright © 2017年 Shijie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func changeSkin(_ sender: UIButton) {
        let stringArray: Array<String> = ["red", "blue","yellow","pink"];
        let index = Int(arc4random()%4);
        let newSkin = stringArray[index]
        print("新主题:\(newSkin)")
    }
    
    
}

