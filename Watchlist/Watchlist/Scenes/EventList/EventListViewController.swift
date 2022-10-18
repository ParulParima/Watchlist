//
//  EventListViewController.swift
//  YouCanDoIt
//
//  Created by Tnluser on 27/08/22.
//

import UIKit
import SkeletonView

class EventListViewController: UIViewController{
    
    var viewModel: EventListViewModel!
    @IBOutlet weak var fetchTVButton: UIButton!
    @IBOutlet weak var fetchMovieButton: UIButton!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var popularStackView: UIStackView!
    weak var navigator : EventListCoordinator?
    
    init(viewModel: EventListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "EventListViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        setupInterface()  
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.eventType == .movie ?  movieSelected() :   TVSelected()
        popularCollectionView.isSkeletonable = true
        popularCollectionView.prepareSkeleton { (_) in
            self.popularCollectionView.showAnimatedGradientSkeleton()
            self.viewModel.viewLoaded()
        }    }
    
    
    private
    func setupBindings() {
        self.viewModel.reloadPopularMovieData += PropertyObserver(uniqueTarget: self, callback: { [weak self] reload in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.popularCollectionView.hideSkeleton(reloadDataAfter: false)
                self.popularCollectionView.reloadData()
            }
        })
        self.viewModel.reloadPopularTVData += PropertyObserver(uniqueTarget: self, callback: { [weak self] reload in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.popularCollectionView.hideSkeleton(reloadDataAfter: false)
                self.popularCollectionView.reloadData()
            }
        })
    }
    
    func setupInterface() {
        
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        popularCollectionView.register(PopularCollectionViewCell.nib(), forCellWithReuseIdentifier: PopularCollectionViewCell.identifier)
        popularCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        popularCollectionView.showsVerticalScrollIndicator = false
        fetchTVButton.setTitle("TV", for: .normal)
        fetchTVButton.clipsToBounds = true
        fetchTVButton.layer.cornerRadius = 16
        fetchMovieButton.setTitle("Movie", for: .normal)
        fetchMovieButton.clipsToBounds = true
        fetchMovieButton.layer.cornerRadius = 16
        popularStackView.clipsToBounds = true
        popularStackView.layer.cornerRadius = 16
        popularStackView.layer.borderWidth = 4
        popularStackView.layer.borderColor = UIColor.black.cgColor
        
    }
    private
    func TVSelected(){
        fetchTVButton.backgroundColor = UIColor.red
        fetchTVButton.setTitleColor(UIColor.white, for: .selected)
        fetchMovieButton.setTitleColor(UIColor.black, for: .normal)
        fetchMovieButton.backgroundColor = UIColor.white
    }
    
    private
    func movieSelected(){
        fetchMovieButton.backgroundColor = UIColor.red
        fetchMovieButton.setTitleColor(UIColor.white, for: .selected)
        fetchTVButton.backgroundColor = UIColor.white
        fetchTVButton.setTitleColor(UIColor.black, for: .normal)
    }
    
    @IBAction func fetchTVTapped(sender: UIButton) {
        TVSelected()
        viewModel.fetchTVEvent()
    }
    @IBAction func fetchMovieTapped(sender: UIButton) {
        movieSelected()
        viewModel.fetchMovieEvent()
    }
    @IBAction func playListTapped(sender: UIButton) {
        navigator?.showSavedData()
    }
    
    private
    func showDetails(id: String, eventType: EventType) {
        navigator?.showDetails(id: id, eventType: eventType)
    }
    
}

extension EventListViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = viewModel.popularData[indexPath.row]
        showDetails(id: String(model.id), eventType: EventType(rawValue: model.mediaType) ?? EventType.movie)
    }
}


extension EventListViewController : SkeletonCollectionViewDataSource {
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        PopularCollectionViewCell.identifier
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.popularData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.identifier, for: indexPath) as? PopularCollectionViewCell else {
            return UICollectionViewCell()
        }
        let model = viewModel.popularData[indexPath.row]
        print(model)
        cell.setup(model: model)
        return cell
    }
    
}

//MARK: - UICollectionViewDelegateFlowLayout Methods
extension EventListViewController: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width/2 - 20,
                      height: 340)
    }
}
