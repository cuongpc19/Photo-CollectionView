//
//  ImageViewController.swift
//  demoCollectionView
//
//  Created by AgribankCard on 2/17/17.
//  Copyright © 2017 cuongpc. All rights reserved.
//

import UIKit
import PhotosUI
import Photos
import CoreImage

class ImageViewController: UIViewController {
    var asset: PHAsset!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateImage()
        
    }
    var targetSize: CGSize {
        let scale = UIScreen.main.scale
        return CGSize(width: imageView.bounds.width * scale,
                      height: imageView.bounds.height * scale)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateImage() {
        let options = PHImageRequestOptions()
        options.deliveryMode = .highQualityFormat
        options.isNetworkAccessAllowed = true
        
        PHImageManager.default().requestImage(for: asset, targetSize: targetSize, contentMode: .aspectFit, options: options, resultHandler: { image, _ in
            // If successful, show the image view and display the image.
            guard let image = image else { return }
            // Now that we have the image, show it.           
            self.imageView.isHidden = false
            self.imageView.image = image
        })
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func editImageAction(_ sender: AnyObject) {
        let options = PHImageRequestOptions()
        options.version = .original
        options.isSynchronous = true
        
        // Request the image data and UTI type for the image.
        PHImageManager.default().requestImageData(for: asset, options: options) { imageData, dataUTI, _, _ in
            guard let imageData = imageData, let dataUTI = dataUTI else { return }
            let context = CIContext()                                           // 1
            let filter = CIFilter(name: "CISepiaTone")!                         // 2
            filter.setValue(0.8, forKey: kCIInputIntensityKey)
            let image = CIImage(data: imageData)
            let cropRect = CGRect(x: 350, y: 350, width: 150, height: 150)
            //let croppedImage = image?.cropping(to: cropRect)
            //self.imageView.image = UIImage(ciImage: croppedImage!)
            
            
            
        
        }
        
        
    }
    
}

