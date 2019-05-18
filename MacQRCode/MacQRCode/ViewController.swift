//
//  ViewController.swift
//  MacQRCode
//
//  Created by pencilCool on 2019/5/18.
//  Copyright © 2019 pencilCool. All rights reserved.
//

import Cocoa
import EFQRCode

class ViewController: NSViewController {
    @IBOutlet var textView: NSTextView!
    @IBOutlet weak var qrImageView: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
    }
    
    override var representedObject: Any? {
        didSet {
        }
    }


    @IBAction func generateQRCode(_ sender: NSButton) {
        guard let content = self.textView.textStorage?.string else {
            return
        }
        
        createQRCode(with: content)
        
    }
    
    func createQRCode(with string:String) -> Void {
        guard let cgImage = EFQRCode.generate(content: string) else  {
           return
        }
        let cgSize = CGSize(width: 400, height: 400)
        let size = NSSizeFromCGSize(cgSize)
        qrImageView.image = NSImage.init(cgImage: cgImage, size: size)
        
    }
}

