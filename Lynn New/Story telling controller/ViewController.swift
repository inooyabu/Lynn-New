//
//  ViewController.swift
//  Lynn New
//
//  Created by Tenti Atika Putri on 24/07/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var homeButton: UIButton!
    
    var bgSoundURI: URL?
    var backgroundSound = AVAudioPlayer()
   
    var backgroundImageArray = [UIImage(named: "Background-1"), UIImage(named: "Background-2"),
                                UIImage(named: "Background-3"), UIImage(named: "Background-4"),
                                UIImage(named: "Background-5"), UIImage(named: "Background-6"),
                                UIImage(named: "Background-7"), UIImage(named: "Background-8"),
                                UIImage(named: "Background-9"), UIImage(named: "Background-10"),
                                UIImage(named: "Background-11")]
    
//    var backgroundImageArray = [UIImage(named: "1"), UIImage(named: "2"),
//                                UIImage(named: "3"), UIImage(named: "4"),
//                                UIImage(named: "5"), UIImage(named: "6"),
//                                UIImage(named: "7"), UIImage(named: "8"),
//                                UIImage(named: "9"), UIImage(named: "10"),
//                                UIImage(named: "11")]
    
//    var backgroundImageArray = [UIImage(named: "#1"), UIImage(named: "#2"),
//                                UIImage(named: "#3"), UIImage(named: "#4"),
//                                UIImage(named: "#5"), UIImage(named: "#6"),
//                                UIImage(named: "#7"), UIImage(named: "#8"),
//                                UIImage(named: "#9"), UIImage(named: "#10"),
//                                UIImage(named: "#11")]
    
    var voice = ["stortel1", "stortel2", "stortel3",
                 "stortel4", "stortel5", "stortel6", "stortel7",
                 "stortel8", "stortel9", "stortel10", "stortel11"]
    
    var airgif = [UIImage.gif(name: "Hero Lynn"), UIImage.gif(name: "Superman Not Me"),
                  UIImage.gif(name: "Benefit"), UIImage.gif(name: "Secret"),
                  UIImage.gif(name: "contain New"), UIImage.gif(name: "cry New"),
                  UIImage.gif(name: "weak"), UIImage.gif(name: "Sweat"),
                  UIImage.gif(name: "Presence"), UIImage.gif(name: "Child"),
                  UIImage.gif(name: "more water")]
                                
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        pageController.numberOfPages = backgroundImageArray.count
        playSound(number: 0)
        print("Play Sound on viewDidLoad")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    
    private func playSound(number: Int) {
        bgSoundURI = URL(fileURLWithPath: Bundle.main.path(forResource: voice[number], ofType: "mp3")!)
        do{
            guard let uri = bgSoundURI else {return}
            backgroundSound = try AVAudioPlayer(contentsOf: uri)
            backgroundSound.play()
            
        }catch{
            print(error)
        }
     
    }
    
    @objc func ayoMinum() {
        backgroundSound.stop()
        
        let ayoMinum = storyboard?.instantiateViewController(identifier: "Ayo Minum") as! AyoMinumViewController
        ayoMinum.modalPresentationStyle = .fullScreen
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        present(ayoMinum, animated: false, completion: nil)
    }
    
    
    @IBAction func homeButtonTapped(_ sender: Any) {
        print("Home Button Tapped")
        backgroundSound.stop()
        let startingPage = storyboard?.instantiateViewController(identifier: "Starting Page") as! StartingPageViewController
        startingPage.modalPresentationStyle = .fullScreen
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromBottom
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        present(startingPage, animated: false, completion: nil)
    }
    

}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return backgroundImageArray.count
        backgroundImageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? DataCollectionViewCell
//        cell?.backgroundImage.image = backgroundImageArray[indexPath.row]
//        return cell!
        
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? DataCollectionViewCell else { return UICollectionViewCell() }
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: collectionView.frame.size.width, height: collectionView.frame.size.height))
//        print(imageView.frame.size)
        imageView.contentMode = .scaleAspectFit
        imageView.image = backgroundImageArray[indexPath.row]
        imageView.backgroundColor = .red
        cell.addSubview(imageView)
        
        
        let gifImageView = UIImageView(frame: CGRect(x: 263, y: 8, width: 265, height: 265))
        gifImageView.contentMode = .scaleAspectFit
        gifImageView.image = airgif[indexPath.row]
        cell.addSubview(gifImageView)
        
        print("Sekarang indexPath.row \(indexPath.row)")

        
//        cell.loadData(item: backgroundImageArray[indexPath.row]!)
        
        return cell
     }
}

extension ViewController : UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        let w = scrollView.bounds.size.width
        let currentPage = Int(ceil(x/w))
        self.pageController.currentPage = currentPage
                
        switch self.pageController.currentPage {
        case 0:
            playSound(number: 0)
//            print("Current Page \(currentPage), Array Sound = \(0)")
            
            
        case 1:
            playSound(number: 1)
            print("Current Page \(currentPage), Array Sound = \(1)")
        case 2:
            playSound(number: 2)
            print("Current Page \(currentPage), Array Sound = \(2)")
        case 3:
            playSound(number: 3)
            print("Current Page \(currentPage), Array Sound = \(3)")
        case 4:
            playSound(number: 4)
            print("Current Page \(currentPage), Array Sound = \(4)")
        case 5:
            playSound(number: 5)
            print("Current Page \(currentPage), Array Sound = \(5)")
        case 6:
            playSound(number: 6)
            print("Current Page \(currentPage), Array Sound = \(6)")
        case 7:
            playSound(number: 7)
            print("Current Page \(currentPage), Array Sound = \(7)")
        case 8:
            playSound(number: 8)
            print("Current Page \(currentPage), Array Sound = \(8)")
        case 9:
            playSound(number: 9)
            print("Current Page \(currentPage), Array Sound = \(9)")
        case 10:
            playSound(number: 10)
            print("Current Page \(currentPage), Array Sound = \(10)")
            let image = UIImage(named: "Sefron Kanan") as UIImage?
            let buttonNext = UIButton(frame: CGRect(x: 712,
                                                y: 286,
                                                width: 80,
                                                height: 80))
            buttonNext.setImage(image, for: .normal)
            buttonNext.addTarget(self, action: #selector(ayoMinum), for: .touchDown)
            self.view.addSubview(buttonNext)
            
//            collectionView.isScrollEnabled = false
            //Pas disini, bikin dia stop scroll . Kalau udah bisa, berarti hapus yang case 11
//        case 11:
//            playSound(number: 11)
//            print("Current Page \(currentPage), Array Sound = \(11)")
        default:
            playSound(number: 0)
            print("Default, Current Page \(currentPage), Array Sound = \(0) ")
        }
    }
//
//    //Spacing antar dot di page controller belum tau caranya
//    override func viewDidLayoutSubviews() {
//        pageController.subviews.forEach {
//            $0.transform = CGAffineTransform(scaleX: 2, y: 2)
//        }
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.frame.size.width
        let itemHeight = collectionView.frame.size.height
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}


//Ini kode full screen, tapi masih aneh
//extension ViewController: UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let size = UIScreen.main.bounds
//        return CGSize(width: size.width, height: size.height)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//}
