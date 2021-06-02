//
//  PlanetCollectionViewCell.swift
//  CodePlanets
//
//  Created by Ben Gohlke on 4/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class PlanetCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "PlanetCell"
    
    private var imageView = UIImageView()
    private var nameLabel = UILabel()
    
    var planet: Planet? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Initialization
    
    // This init method is required, but since we're not going to use it
    // (mostly used by storyboard), we'll warn others not to use it by adding
    // the fatalError call (which intentionally crashes the app).
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }
    
    // MARK: - Private
    
    private func updateViews() {
        guard let planet = planet else { return }
        imageView.image = planet.image
        nameLabel.text = planet.name
    }
    
    private func setUpSubviews() {
        // Image View
        // 1. Create/configure
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        // 2. Add to view hierarchy
        self.addSubview(imageView)
        
        // 3. Create/activate constraints
        //For Y position
        NSLayoutConstraint(item: imageView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .top,
                           multiplier: 1,
                           constant: 4).isActive = true
        //For X position
        NSLayoutConstraint(item: imageView,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 4).isActive = true
        //For Width
        NSLayoutConstraint(item: imageView,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -4).isActive = true
        
        //For Height
        NSLayoutConstraint(item: imageView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: imageView,
                           attribute: .width,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        
        
        // Label
        // 1. Create/configure
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textAlignment = .center
        
        // 2. Add to view hierarchy
        self.addSubview(nameLabel)
        
        // 3. Create/activate constraints
        
        //For Y position
        nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4).isActive = true
        
        //For X position
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4).isActive = true
        
        //For Width position
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2).isActive = true
    
        //For Height position is not needed because iis set base on the font type
        
    }
}
