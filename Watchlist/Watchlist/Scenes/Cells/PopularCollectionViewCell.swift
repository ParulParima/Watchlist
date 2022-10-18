//
//  PopularCollectionViewCell.swift
//  Hope
//
//  Created by Tnluser on 28/08/22.
//

import UIKit
import SDWebImage

class PopularCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PopularCollectionViewCell"
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    static func nib() -> UINib {
        return UINib(nibName: "PopularCollectionViewCell", bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    func setup(model: ResultsEntity) {
        
        title.text = model.title ?? model.name
        if model.releaseDate != nil &&  model.releaseDate != "" {
            date.text = model.releaseDate?.dateExtraction()
        }
        else if model.firstAirDate != nil && model.firstAirDate != "" {
            date.text = model.firstAirDate?.dateExtraction()
        }
        else {
            date.text = ""
        }
        
        guard let url = URL(string:  "https://image.tmdb.org/t/p/w500/\(model.posterPath ?? "")") else { return }
        posterImage.contentMode = .scaleAspectFit
        posterImage.clipsToBounds = true
        posterImage.sd_setImage(with: url)
        
    }
    func setupTV(model: TVEventEntity) {
        
        title.text = model.name ?? " "
       if model.firstAirDate != nil && model.firstAirDate != "" {
            date.text = model.firstAirDate?.dateExtraction()
        }
        else {
            date.text = ""
        }
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterPath ?? " ")") else { return }
        posterImage.clipsToBounds = true
        posterImage.contentMode = .scaleAspectFit
        posterImage.sd_setImage(with: url, placeholderImage: UIImage(named: "dummy"))

    }
    func setupMovie(model: MovieEventEntity) {
        
        title.text = model.title ?? " "
        if model.releaseDate != nil &&  model.releaseDate != "" {
            date.text = model.releaseDate?.dateExtraction()
        }
        else {
            date.text = ""

        }
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterPath ?? " ")") else { return }
        posterImage.clipsToBounds = true
        posterImage.contentMode = .scaleAspectFit
        posterImage.sd_setImage(with: url,  placeholderImage: UIImage(named: "dummy"))
        
    }

}
