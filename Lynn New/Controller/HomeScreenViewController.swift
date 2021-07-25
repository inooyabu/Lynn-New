//
//  HomeScreenViewController.swift
//  Lynn New
//
//  Created by Tenti Atika Putri on 25/07/21.
//

import UIKit
import AVFoundation

class HomeScreenViewController: UIViewController {

    @IBOutlet weak var profilImageView: UIImageView!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var namaTextField: UITextField!
    @IBOutlet weak var simpanButton: UIButton!
    
    let profilGif = UIImage.gif(name: "Profil")
    var bgSoundURI: URL?
    var backgroundSound = AVAudioPlayer()
    var nama: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profilImageView.image = profilGif
        
        simpanButton.layer.cornerRadius = 15
        
        namaTextField.layer.cornerRadius = 15.0
        namaTextField.layer.borderWidth = 2.0
        namaTextField.layer.borderColor = UIColor(red: 95.0/255.0, green: 28.0/255.0, blue: 53.0/255.0, alpha: 100.0).cgColor
        namaTextField.layer.masksToBounds = true
        namaTextField.placeholder = "Masukkan namamu"
        
        playSound()
        
        //Dismiss keyboard when tap anywhere
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    
   
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func playSound() {
        bgSoundURI = URL(fileURLWithPath: Bundle.main.path(forResource: "home page", ofType: "mp3")!)
        do{
            guard let uri = bgSoundURI else {return}
            backgroundSound = try AVAudioPlayer(contentsOf: uri)
            backgroundSound.play()
            
        }catch{
            print(error)
        }
    }
    
    @IBAction func homeButtonTapped(_ sender: Any) {
        print("Home Button Tapped")
        backgroundSound.stop()
        let startingPage = storyboard?.instantiateViewController(identifier: "Starting Page") as! StartingPageViewController
        startingPage.modalPresentationStyle = .fullScreen
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        present(startingPage, animated: false, completion: nil)
    }
    
    //Besok tambahin alert kalau nama empty
    @IBAction func simpanButtonTapped(_ sender: Any) {
        backgroundSound.stop()
        nama = namaTextField.text ?? "Nama Empty"
        print("Button simpan tapped || Oi \(nama)")
        
        
        
        let homeScreen2 = storyboard?.instantiateViewController(identifier: "Home Screen 2") as! HomeScreen2ViewController
        homeScreen2.modalPresentationStyle = .fullScreen
//        homeScreen2.textGreeting = nama

        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        present(homeScreen2, animated: false, completion: nil)
        
//        let storyTelling = storyboard?.instantiateViewController(identifier: "Story Telling") as! ViewController
//        storyTelling.modalPresentationStyle = .fullScreen
//
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.type = CATransitionType.push
//        transition.subtype = CATransitionSubtype.fromRight
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        view.window!.layer.add(transition, forKey: kCATransition)
//        present(storyTelling, animated: false, completion: nil)
        
    }
    
}

//extension UIColor {
//    public convenience init?(hex: String) {
//        let r, g, b, a: CGFloat
//
//        if hex.hasPrefix("#") {
//            let start = hex.index(hex.startIndex, offsetBy: 1)
//            let hexColor = String(hex[start...])
//
//            if hexColor.count == 8 {
//                let scanner = Scanner(string: hexColor)
//                var hexNumber: UInt64 = 0
//
//                if scanner.scanHexInt64(&hexNumber) {
//                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
//                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
//                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
//                    a = CGFloat(hexNumber & 0x000000ff) / 255
//
//                    self.init(red: r, green: g, blue: b, alpha: a)
//                    return
//                }
//            }
//        }
//
//        return nil
//    }
//}
