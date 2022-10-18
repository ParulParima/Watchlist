//
//  DetailViewController.swift
//  Hope
//
//  Created by Tnluser on 31/08/22.
//

import UIKit
import SDWebImage
import SkeletonView

class DetailViewController: UIViewController {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var overviewTextView: UITextView!
    @IBOutlet weak var tagLine: UILabel!
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var overview: UILabel!
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    @IBOutlet weak var loadingContainerView: UIView!
    @IBOutlet weak var saveButton: UIButton!
    var navigateBackClosure: ((MovieEventEntity?, TVEventEntity?) -> Void)!
    var viewModel: DetailViewModel!
    var entityTV: TVEventEntity? = nil
    var entityMovie: MovieEventEntity? = nil
    
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "DetailViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewLoaded()
        setupBindings()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        view.isSkeletonable = true
        view.showAnimatedGradientSkeleton()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    override func viewDidLayoutSubviews() {
        view.layoutSkeletonIfNeeded()
    }
    
    private
    func setupBindings() {
        self.viewModel.reloadData += PropertyObserver(uniqueTarget: self, callback: { [weak self] reload in
            guard let self = self else { return }
            DispatchQueue.main.async {
                var v = UIImage()
                if self.viewModel.eventType == .tv {
                    self.setupTVInterface(self.viewModel.TVeventDetails!)
                }
                else {
                    self.setupMovieInterface(self.viewModel.MovieEventDetails!)
                }
                guard let url = URL(string:"\(constant.imageURL)\(self.viewModel.MovieEventDetails?.posterPath ?? self.viewModel.TVeventDetails?.posterPath ?? " ")") else { return }
                if let imageData = try? Data(contentsOf: url) {
                    if let loadedImage = UIImage(data: imageData) {
                        v = loadedImage
                    }
                }
                let colors = v.getColors()
                self.view.backgroundColor = colors?.background
                self.detailsView.backgroundColor = colors?.background
                self.name.textColor = colors?.secondary
                self.genre.textColor = colors?.primary
                self.duration.textColor = colors?.primary
                self.date.textColor = colors?.primary
                self.tagLine.textColor = colors?.secondary
                self.overviewTextView.textColor = colors?.detail
                self.overviewTextView.backgroundColor = colors?.background
                self.overview.textColor = colors?.secondary
                self.stackView.backgroundColor = colors?.background
                self.backButton.tintColor = colors?.secondary
                self.saveButton.tintColor = colors?.background
                self.saveButton.backgroundColor = colors?.primary
                self.saveButton.layer.cornerRadius = 8
                self.overviewTextView.setContentOffset(CGPoint.zero, animated: false)
                self.overviewTextView.isEditable = false
                self.posterImageView.contentMode = .scaleAspectFill
                self.posterImageView.clipsToBounds = true
                self.view.hideSkeleton()
            }
        })
    }
    
    func setupTVInterface(_ details: TVEventEntity) {
        
        self.name.text = details.name
        self.date.text = details.firstAirDate?.dateExtraction()
        self.overviewTextView.text = details.overview
        self.tagLine.text = details.tagline
        self.duration.isHidden = true
        self.date.textAlignment = .center
        guard let url = URL(string:"\(constant.imageURL)\(details.posterPath ?? " ")") else { return
        }
        self.posterImageView.sd_setImage(with: url, completed: nil)
        var s = ""
        for i in  details.genres {
            s = s + (i.name ?? "")  + ", "
        }
        self.genre.text = String(s.dropLast())
    }
    
    func setupMovieInterface(_ details: MovieEventEntity) {
        self.name.text = details.title
        self.date.text = details.releaseDate?.dateExtraction()
        self.overviewTextView.text = details.overview
        let hr = details.runtime! / 60
        let min = details.runtime! % 60
        self.duration.text = String("\(hr) h \(min) m")
        self.tagLine.text = details.tagline
        guard let url = URL(string:"https://www.themoviedb.org/t/p/w600_and_h900_bestv2/\(details.posterPath ?? " ")") else { return
        }
        
        self.posterImageView.sd_setImage(with: url, completed: nil)
        var s = ""
        for i in  details.genres {
            s = s + (i.name ?? "")  + ", "
        }
        self.genre.text = String(s.dropLast())
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.navigateBackClosure(entityMovie, entityTV)
    }
    @IBAction func saveButtonAction(_ sender: Any) {
        if viewModel.eventType == .movie {
            entityMovie = viewModel.MovieEventDetails
        }
        else {
            entityTV = viewModel.TVeventDetails
        }
        let alert = UIAlertController(title: "Alert", message: "Event added to playlist", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
