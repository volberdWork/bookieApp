import UIKit

class PreloaderController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet var startButton: UIButton!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var collectionView: UICollectionView!
    
    // MARK: - Properties
    
    private let loaderBase = [
        PreloaderModel(imageName: "logoImage", title: "Your pocket sport & events manager"),
        PreloaderModel(imageName: "logoImage", title: "Your pocket sport & events manager"),
        PreloaderModel(imageName: "logoImage", title: "Your pocket sport & events manager")
    ]

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        configureView()
        configureFlowLayout()
    }
    
    // MARK: - Setup
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        registerCell()
    }
    
    private func registerCell() {
        let cellNib = UINib(nibName: "PreloaderCollectionViewCell", bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "PreloaderCollectionViewCell")
    }
    
    private func configureView() {
        view.backgroundColor = .customDarkGrey
        collectionView.backgroundColor = .clear
        
        startButton.isHidden = true
        startButton.setTitle("START", for: .normal)
        startButton.tintColor = .white
        startButton.backgroundColor = .customYellow
        startButton.layer.cornerRadius = 22
    }
    
    private func configureFlowLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = collectionView.bounds.size
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        collectionView.collectionViewLayout = flowLayout
        collectionView.isPagingEnabled = true
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        let vc = MainViewController() //change this to your class name
        self.present(vc, animated: true, completion: nil)
        
        
    }
    
}

// MARK: - UICollectionViewDataSource

extension PreloaderController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return loaderBase.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PreloaderCollectionViewCell", for: indexPath) as! PreloaderCollectionViewCell
        let model = loaderBase[indexPath.row]
        cell.setupCell(model: model)
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension PreloaderController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
           if indexPath.row == loaderBase.count - 1 {
               startButton.isHidden = false
           } else {
               startButton.isHidden = true
           }
        pageControl.currentPage = indexPath.row
       }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PreloaderController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.width
        return CGSize(width: width, height: height)
    }
}
