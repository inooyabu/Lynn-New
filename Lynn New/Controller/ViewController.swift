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
    
    var bgSoundURI: URL?
    var backgroundSound = AVAudioPlayer()
   
    var backgroundImageArray = [UIImage(named: "1"), UIImage(named: "2"),
                                UIImage(named: "3"), UIImage(named: "4"),
                                UIImage(named: "5"), UIImage(named: "6"),
                                UIImage(named: "7"), UIImage(named: "8"),
                                UIImage(named: "9"), UIImage(named: "10"),
                                UIImage(named: "11")]
    
    var voice = ["stortel1", "stortel2", "stortel3 new", "stortel4", "stortel5", "stortel6", "stortel7", "stortel8", "stortel9", "stortel10", "stortel11"]
                                
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        pageController.numberOfPages = backgroundImageArray.count
        playSound(number: 0)
        print("Play Sound on viewDidLoad")
        
//        pageController.subviews.forEach {
//            $0.transform = CGAffineTransform(scaleX: 2, y: 2)
//        }
        
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
        cell.loadData(item: backgroundImageArray[indexPath.row]!)
        
        return cell
     }
}

extension ViewController : UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        let w = scrollView.bounds.size.width
        let currentPage = Int(ceil(x/w))
        self.pageController.currentPage = currentPage
//        self.pageController.subviews.forEach {
//            $0.transform = CGAffineTransform(scaleX: 2, y: 2)
//        }
        
//        for dot in self.pageController.subviews{
//            dot.transform = CGAffineTransform.init(scaleX: 2, y: 2)
//        }
//
//        playSound(number: currentPage)
        switch self.pageController.currentPage {
        case 0:
            playSound(number: 0)
            print("Current Page \(currentPage), Array Sound = \(0)")
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
    
    //Spacing antar dot di page controller belum tau caranya
    override func viewDidLayoutSubviews() {
        pageController.subviews.forEach {
            $0.transform = CGAffineTransform(scaleX: 2, y: 2)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.frame.size.width
        let itemHeight = (collectionView.frame.size.height)
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

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