//
//  ViewController.swift
//  MC3PoseEstimation
//
//  Created by Sri Endah Ramurti on 16/07/21.
//

import UIKit
import AVFoundation
import AudioToolbox
import CoreML

class DetectDrink: UIViewController {
    
    let videoCapture = VideoCapture()
    
    var previewLayer: AVCaptureVideoPreviewLayer?
    
    var pointsLayer = CAShapeLayer()
    
    var isMinumdetected = false
    
   
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       setupVideoPreview()
        
        videoCapture.predictor.delegate = self
        
      //  label.text = "Bayam"
    }
    private func setupVideoPreview(){
        
        videoCapture.startCaptureSession()
        previewLayer = AVCaptureVideoPreviewLayer(session: videoCapture.captureSession)


        guard let previewLayer = previewLayer else {return}
        
        view.layer.addSublayer(previewLayer)
        previewLayer.frame = view.frame
        
        view.layer.addSublayer(pointsLayer)
        pointsLayer.frame = view.frame
        pointsLayer.strokeColor = UIColor.red.cgColor
    }

}

extension DetectDrink: PredictorDelegate{
    
    func predictor(_ predictor: Predictor, didLabelAction action: String, with confidence: Double) {
        print(action)
        if action == "Minum" && confidence >= 0.75 && isMinumdetected == false {
           // label.text = "Minum"
            print("Minum")
            
            isMinumdetected = true
        
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.isMinumdetected = false
            }
            DispatchQueue.main.async {
                AudioServicesPlayAlertSound(SystemSoundID(1322) )
                self.isMinumdetected = false
            }
        }
            else {
                label.text = "None"
            }
        
    }
    
    func predictor(_ predictor: Predictor, didFindNewRecognizedPoints points: [CGPoint]) {
        guard let previewLayer = previewLayer else {return}
        
        
        
        let convertedPoints = points.map{
            previewLayer.layerPointConverted(fromCaptureDevicePoint: $0)
        }
        
        let combinedPath = CGMutablePath()
        for point in convertedPoints{
            let dotPath = UIBezierPath(ovalIn: CGRect(x: point.x, y: point.y, width: 10, height: 10))
            combinedPath.addPath(dotPath.cgPath)
        }
        pointsLayer.path = combinedPath
        DispatchQueue.main.async {
            self.pointsLayer.didChangeValue(for: \.path)
        }
    }
}
