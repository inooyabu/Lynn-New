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
    
    @IBOutlet weak var showDrink: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {self.setupVideoPreview()})
       
        
        videoCapture.predictor.delegate = self
        
      //  label.text = "Bayam"
    }
    private func setupVideoPreview(){
        
        videoCapture.startCaptureSession()
        previewLayer = AVCaptureVideoPreviewLayer(session: videoCapture.captureSession)


        guard let previewLayer = previewLayer else {return}
        
        view.layer.addSublayer(previewLayer)
        previewLayer.frame = view.frame
        
        //video orientation
        previewLayer.connection?.videoOrientation = transformOrientation(orientation: UIInterfaceOrientation(rawValue: UIApplication.shared.statusBarOrientation.rawValue)!)
        
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
                self.moveToGame()
            }
        }
            else {
               
            }
        
    }
    
    func moveToGame(){
        let shareNutrition = storyboard?.instantiateViewController(identifier: "animasi minum") as! UIViewController
        shareNutrition.modalPresentationStyle = .fullScreen

        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromBottom
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        view.window!.layer.add(transition, forKey: kCATransition)
        present(shareNutrition, animated: false, completion: nil)
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
    
    //Nah, kalau di kodingan ini, jika kita mulai dari starting page, kameranya bisa berbagai orientation dan tidak flip
    //Tapi kalau run dari detect drink, kameranya flip.
    //Lawak kan? Berarti salahnya dimana? :v
    func transformOrientation(orientation: UIInterfaceOrientation) -> AVCaptureVideoOrientation {
            switch orientation {
            case .landscapeLeft:
                return .landscapeLeft
            case .landscapeRight:
                return .landscapeRight
            case .portraitUpsideDown:
                return .portraitUpsideDown
            default:
                return .portrait
            }
    }
  
    
    //Di kodingan ini, kalau kita run mulai dari Starting Page, kameranya tidak full dan orientation portrait.
    //Tapi, kalau di run dari Detect Drink, kameranya full, tapi flip
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        if let connection = self.previewLayer?.connection {
//            let currentDevice: UIDevice = UIDevice.current
//            let orientation: UIDeviceOrientation = currentDevice.orientation
//            let previewLayerConnection : AVCaptureConnection = connection
//
//            if (previewLayerConnection.isVideoOrientationSupported) {
//                    switch (orientation) {
//                    case .portrait:
//                        previewLayerConnection.videoOrientation = AVCaptureVideoOrientation.portrait
//                    case .landscapeRight:
//                        previewLayerConnection.videoOrientation = AVCaptureVideoOrientation.landscapeRight
//                    case .landscapeLeft:
//                        previewLayerConnection.videoOrientation = AVCaptureVideoOrientation.landscapeLeft
//                    case .portraitUpsideDown:
//                        previewLayerConnection.videoOrientation = AVCaptureVideoOrientation.portraitUpsideDown
//
//                    default:
//                        previewLayerConnection.videoOrientation = AVCaptureVideoOrientation.landscapeLeft
//                    }
//                }
//            }
//    }
    
    
}
