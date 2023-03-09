//
//  CharacterCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Dinmukhamed on 08.03.2023.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "CharacterCVC"
    
    private let characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        makeConstraints()
        setupLayers()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        characterImageView.image = nil
        nameLabel.text = nil
        statusLabel.text = nil
    }
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setupLayers()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeConstraints(){
        contentView.addSubview(statusLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(characterImageView)
        NSLayoutConstraint.activate([
            statusLabel.heightAnchor.constraint(equalToConstant: 30),
            statusLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -7),
            statusLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 7),
            statusLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
            
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -7),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 7),
            nameLabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor),
            
            characterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            characterImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            characterImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            characterImageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -3),
        ])
    }
    private func setupLayers(){
        contentView.layer.shadowColor = UIColor.secondaryLabel.cgColor
        contentView.layer.cornerRadius = 4
        contentView.layer.shadowOffset = CGSize(width: -4, height: 4)
        contentView.layer.shadowOpacity = 0.5
    }
    
    func configure(with viewModel: CharacterCollectionViewCellViewModel){
        nameLabel.text = viewModel.characterName
        statusLabel.text = viewModel.characterStatusText
        viewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.characterImageView.image = image
                }
            case .failure(let error):
                print(String(describing: error))
                break
            }
            
        }
    }
    
    
    
    
}
