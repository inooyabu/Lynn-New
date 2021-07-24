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
    var runCount = 0
    
    var backgroundImageArray = [UIImage(named: "#1"), UIImage(named: "#2"),
                                UIImage(named: "#3"), UIImage(named: "#4"),
                                UIImage(named: "#5"), UIImage(named: "#6"),
                                UIImage(named: "#7"), UIImage(named: "#8"),
                                UIImage(named: "#9"), UIImage(named: "#10"),
                                UIImage(named: "#11")]
    
    var voice = ["stortel1", "stortel2", "stortel3 new", "stortel4", "stortel5", "stortel6", "stortel7", "stortel8", "stortel9", "stortel10", "stortel11"]
                                
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        pageController.numberOfPages = backgroundImageArray.count
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
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
        
        
        var number = indexPath.row
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? DataCollectionViewCell else { return UICollectionViewCell() }
        cell.loadData(item: backgroundImageArray[indexPath.row]!)
        
        //Kurang kok ga bisa? 
        bgSoundURI = URL(fileURLWithPath: Bundle.main.path(forResource: voice[number + 1], ofType: "mp3")!)
        do{
            let uri = bgSoundURI
            backgroundSound = try AVAudioPlayer(contentsOf: uri!)
            backgroundSound.play()
            print("Page Sekarang \(indexPath.row), Array Song sekarang \(number + 1)")
        }catch{
            print(error)
        }
        return cell
     }
}

extension ViewController : UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        let w = scrollView.bounds.size.width
        let currentPage = Int(ceil(x/w))
        self.pageController.currentPage = currentPage
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
