//
//  HomeScreenViewController.swift
//  Lynn New
//
//  Created by Tenti Atika Putri on 25/07/21.
//

import UIKit
import AVFoundation

class HomeScreenViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var profilImageView: UIImageView!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var namaTextField: UITextField!
    @IBOutlet weak var simpanButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    
    let profilGif = UIImage.gif(name: "Profil")
    var bgSoundURI: URL?
    var backgroundSound = AVAudioPlayer()
    var nama: String = ""
    
    var activeTextField : UITextField? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        namaTextField.delegate = self
        profilImageView.image = profilGif

        namaTextField.placeholder = "Masukkan namamu"
        
        let main = MainMenuScene()
        playSound()
        
        //Dismiss keyboard when tap anywhere
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self, selector: #selector(HomeScreenViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(HomeScreenViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            
            return
        }
        
        var shouldMoveViewUp = false
        
        let bottomTextField = namaTextField.convert(namaTextField.bounds, to: self.view).maxY;
        let topOfKeyboard = self.view.frame.height - keyboardSize.height
        
        if bottomTextField > topOfKeyboard {
            shouldMoveViewUp = true
        }
        
        if shouldMoveViewUp {
            self.view.frame.origin.y = 55 - keyboardSize.height
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y = 0
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      textField.resignFirstResponder()
      return true
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
        nama = namaTextField.text ?? "Empty"
        
        if (nama.isEmpty) == true || (nama == "Masukkan namamu") {
            displayMyAlertMessage(userMessage: "Masukkan namamu dulu ya 😀")
            return
        }
        
        print("Button simpan tapped || Hi \(nama)")
      
        let homeScreen2 = storyboard?.instantiateViewController(identifier: "Home Screen 2") as! HomeScreen2ViewController
        homeScreen2.namaInput = nama
        homeScreen2.modalPresentationStyle = .fullScreen
        

        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        present(homeScreen2, animated: false, completion: nil)
        
    }
    
    func displayMyAlertMessage(userMessage: String){
        
        let myAlert = UIAlertController(title: "Oopss...", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Oke", style: UIAlertAction.Style.default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
}
