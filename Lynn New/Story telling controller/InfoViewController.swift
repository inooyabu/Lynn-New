//
//  InfoViewController.swift
//  Lynn New
//
//  Created by Tenti Atika Putri on 10/08/21.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var pageController: UIPageControl!
    
    var backgroundImage = UIImage(named: "Background info Copy")
    var imageArray = [UIImage(named: "Lynn Page 1"), UIImage(named: "Drink Parent"),
                      UIImage(named: "minum anak"), UIImage(named: "urine")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        pageController.numberOfPages = imageArray.count

    }
    
    @IBAction func homeButtonTapped(_ sender: Any) {
        print("Home Button Tapped")
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    
}

extension InfoViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as? InfoCollectionViewCell else { return UICollectionViewCell() }
        
        let background = UIImageView(frame: CGRect(x: 0, y: 0, width: collectionView.frame.size.width, height: collectionView.frame.size.height))
        background.contentMode = .scaleAspectFit
        background.image = backgroundImage
        cell2.addSubview(background)
        
        print("Sekarang indexPath.row \(indexPath.row)")
        
        switch indexPath.row {
        case 0:
            let label1 = UILabel()
            label1.text = "Tentang Lynn"
            label1.textColor = UIColor.black
            label1.frame = CGRect(x: 110, y: 59, width: 226, height: 31)
            label1.font = UIFont(name: "Chalkboard SE", size: 22.0)
            label1.font = UIFont.boldSystemFont(ofSize: 22)
            cell2.addSubview(label1)
            
            let label2 = UILabel()
            label2.text = "Aplikasi Lynn adalah aplikasi untuk membantu orang tua mengajak anak-anak mereka untuk minum lebih banyak air melalui bermain game dan story telling yang menarik. Karakter Lynn terinpirasi dari tetesan air dengan design yang lucu sehingga anak-anak tertarik untuk melihatnya. "
            label2.lineBreakMode = .byWordWrapping
            label2.numberOfLines = 7
            label2.frame = CGRect(x: 110, y: 109, width: 336, height: 173)
            label2.font = UIFont(name: "Chalkboard SE", size: 15.0)
            label2.font = UIFont.boldSystemFont(ofSize: 15)
//            label2.textColor = UIColor(red: 0.0, green: 58.0, blue: 50.0, alpha: 100.0)
            cell2.addSubview(label2)
            
            let image2 = UIImageView(frame: CGRect(x: 466, y: 55, width: 265, height: 265))
            image2.contentMode = .scaleAspectFit
            image2.image = imageArray[0]
            cell2.addSubview(image2)
        case 1:
            let label1 = UILabel()
            label1.text = "Tips untuk Orang Tua"
            label1.textColor = UIColor.black
            label1.frame = CGRect(x: 110, y: 59, width: 220.33, height: 31)
            label1.font = UIFont(name: "Chalkboard SE", size: 22.0)
            label1.font = UIFont.boldSystemFont(ofSize: 22)
            cell2.addSubview(label1)
            
            let label2 = UILabel()
            label2.text = "Membiasakan anak minum air putih sangat penting. Orang tua harus menjadi role model untuk minum air putih yang dilakukan sedikit demi sedikit dengan jumlah ± 5 gelas perhari. Gunakan gelas yang menarik atau campur air putih dengan potongan buah kesukaannya. Jadikan pertandingan minum air putih dan berikan si Kecil penghargaan dengan rentang waktu tertentu. Selalu jelaskan dan yakinkan tentang hal baik yang akan didapatnya dengan terbiasa minum air putih. "
            label2.lineBreakMode = .byWordWrapping
            label2.numberOfLines = 9
            label2.frame = CGRect(x: 110, y: 107, width: 404, height: 199)
            label2.font = UIFont(name: "Chalkboard SE", size: 15.0)
            label2.font = UIFont.boldSystemFont(ofSize: 15)
//            label2.textColor = UIColor(red: 0.0, green: 58.0, blue: 50.0, alpha: 100.0)
            cell2.addSubview(label2)
            
            let image2 = UIImageView(frame: CGRect(x: 521, y: 51, width: 233, height: 233))
            image2.contentMode = .scaleAspectFit
            image2.image = imageArray[1]
            cell2.addSubview(image2)
        case 2:
            let label1 = UILabel()
            label1.text = "Ketahui Jumlah yang Tepat"
            label1.textColor = UIColor.black
            label1.frame = CGRect(x: 110, y: 59, width: 277, height: 31)
            label1.font = UIFont(name: "Chalkboard SE", size: 22.0)
            label1.font = UIFont.boldSystemFont(ofSize: 22)
            cell2.addSubview(label1)
            
            let label2 = UILabel()
            label2.text = "Ikatan Dokter Anak Indonesia (IDAI) memberi rekomendasi khusus terhadap asupan cairan anak. Disebutkan bahwa anak 4-8 tahun dengan kebutuhan 1.700 ml atau 6 gelas per hari. Faktor jenis kelamin akan berpengaruh ketika anak bertambah dewasa."
            label2.lineBreakMode = .byWordWrapping
            label2.numberOfLines = 7
            label2.frame = CGRect(x: 110, y: 109, width: 317, height: 156)
            label2.font = UIFont(name: "Chalkboard SE", size: 15.0)
            label2.font = UIFont.boldSystemFont(ofSize: 15)
//            label2.textColor = UIColor(red: 0.0, green: 58.0, blue: 50.0, alpha: 100.0)
            cell2.addSubview(label2)
            
            let image2 = UIImageView(frame: CGRect(x: 466, y: 71, width: 245, height: 245))
            image2.contentMode = .scaleAspectFit
            image2.image = imageArray[2]
            cell2.addSubview(image2)
        case 3:
            let label1 = UILabel()
            label1.text = "Monitor Hidrasi"
            label1.textColor = UIColor.black
            label1.frame = CGRect(x: 110, y: 59, width: 226, height: 31)
            label1.font = UIFont(name: "Chalkboard SE", size: 22.0)
            label1.font = UIFont.boldSystemFont(ofSize: 22)
            cell2.addSubview(label1)
            
            let label2 = UILabel()
            label2.text = "Salah satu cara untuk mengetahui tingkat hidrasi pada anak adalah dengan melihat warna dari urin. Warna urin yang cerah menandakan bahwa anak sudah minum air yang cukup dan terhidrasi dengan baik. Warna urin yang pekat dan gelap menandakan anak kurang terhidrasi dan perlu minum air lebih banyak lagi."
            label2.lineBreakMode = .byWordWrapping
            label2.numberOfLines = 4
            label2.frame = CGRect(x: 110, y: 109, width: 600, height: 93)
            label2.font = UIFont(name: "Chalkboard SE", size: 15.0)
            label2.font = UIFont.boldSystemFont(ofSize: 15)
//            label2.textColor = UIColor(red: 0.0, green: 58.0, blue: 50.0, alpha: 100.0)
            cell2.addSubview(label2)
            
            let image2 = UIImageView(frame: CGRect(x: 97, y: 214.11, width: 626, height: 87.25))
            image2.contentMode = .scaleAspectFit
            image2.image = imageArray[3]
            cell2.addSubview(image2)
        
           
        default:
            print("Default Mode")
        }
        
        return cell2

    }
    
}

extension InfoViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let x = scrollView.contentOffset.x
        let w = scrollView.bounds.size.width
        let currentPage = Int(ceil(x/w))
        self.pageController.currentPage = currentPage
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.frame.size.width
        let itemHeight = collectionView.frame.size.height
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
    
}
