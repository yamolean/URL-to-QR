//
//  ViewController.swift
//  URL to QR
//
//  Created by 矢守叡 on 2019/11/06.
//  Copyright © 2019 yamolean. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        
    }
    
    fileprivate func setupLayout() {
        
        let qrImageView = UIImageView()
        qrImageView.image = "https://github.com/yamolean".generateQR()
        view.addSubview(qrImageView)
        
        qrImageView.translatesAutoresizingMaskIntoConstraints = false
        qrImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        qrImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
}

extension String {
    
    func generateQR() -> UIImage? {
        guard let data = self.data(using: .utf8) else { return nil }
        guard let qr = CIFilter(name: "CIQRCodeGenerator", parameters: ["inputMessage": data, "inputCorrectionLevel": "M"]) else { return nil }
        let sizeTransform = CGAffineTransform(scaleX: 10, y: 10)
        guard let qrImage = qr.outputImage?.transformed(by: sizeTransform) else { return nil }
        return UIImage(ciImage: qrImage)
    }
}
