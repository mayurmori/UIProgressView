//
//  ViewController.swift
//  UIProgressView
//
//  Created by Mayur Mori on 17/09/19.
//  Copyright © 2019 Mayur Mori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOUTLET -
    @IBOutlet weak var lblProgress: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    // MARK: - PROPERTIES -
    let progress = Progress(totalUnitCount: 10)
    
    // MARK: - IB ACTIONS -
    @IBAction func btnStart_Clicked(_ sender: UIButton) {
        progressView.progress = 0.0
        progress.completedUnitCount = 0
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            guard self.progress.isFinished == false else {
                timer.invalidate()
                return
            }
            self.progress.completedUnitCount += 1
            self.progressView.setProgress(Float(self.progress.fractionCompleted), animated: true)
            self.lblProgress.text = "\(Int(self.progress.fractionCompleted * 100)) %"
        }
    }
}
