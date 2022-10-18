//
//  SavedTableViewCell.swift
//  Hope
//
//  Created by Tnluser on 07/09/22.
//

import UIKit

class SavedTableViewCell: UITableViewCell {
    
    var viewModel: SavedEventViewModel!
    
    @IBOutlet weak var eventCollectionView: UICollectionView!
    static let identifier = "SavedTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        eventCollectionView.dataSource = self
        eventCollectionView.delegate = self
        eventCollectionView.register(PopularCollectionViewCell.nib(), forCellWithReuseIdentifier: PopularCollectionViewCell.identifier)
        eventCollectionView.register(PopularFooterCollectionReusableView.nib(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: PopularFooterCollectionReusableView.identifier)
        let layout = UICollectionViewFlowLayout()
        eventCollectionView.collectionViewLayout = layout
        layout.scrollDirection = .horizontal
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    static func nib() -> UINib {
        return UINib(nibName: "SavedTableViewCell", bundle: nil)
    }
    
}
extension SavedTableViewCell: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
        return  viewModel.savedMovieEvent.count
        }
            else {
            return viewModel.savedTVEvent.count
        }

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.identifier, for: indexPath) as? PopularCollectionViewCell else {
            return UICollectionViewCell()
        }
        collectionView.tag == 0 ? cell.setupMovie(model: viewModel.savedMovieEvent[indexPath.item]) : cell.setupTV(model: viewModel.savedTVEvent[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionFooter {
                let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: PopularFooterCollectionReusableView.identifier, for: indexPath) as! PopularFooterCollectionReusableView

            if collectionView.tag == 0 {
                if viewModel.savedMovieEvent.count == 0 {
                    footerView.setup(with: "No element is present")
            }
            }
            else {
                if viewModel.savedTVEvent.count == 0 {
                    footerView.setup(with: "No element is present")
                }
            }
                return footerView
        }
        return  UICollectionReusableView()
    
}
}


//MARK: - UICollectionViewDelegateFlowLayout Methods
extension SavedTableViewCell: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width/2 - 20,
                      height:360)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if collectionView.tag == 0 {
            return  viewModel.savedMovieEvent.count == 0 ? CGSize(width: collectionView.frame.width, height: 40) : CGSize(width:0, height: 0)
        }
        else {
            return  viewModel.savedTVEvent.count == 0 ? CGSize(width: collectionView.frame.width, height: 40) : CGSize(width:0, height: 0)
        }
    }
}

extension SavedTableViewCell : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}
