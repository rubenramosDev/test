//
//  DishCell.swift
//  Resto
//
//  Created by santos perez edson on 01/02/2021.
//

import UIKit

class DishCell: UITableViewCell {
    
    var dishImageView = RDishImageView(frame: .zero)
    var nameLabel = UILabel()
    var priceLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(dishImageView)
        addSubview(nameLabel)
        //addSubview(priceLabel)
        configureImageView()
        setImageConstraints()
        setLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(dish: Dish){
        dishImageView.downloadImage(from: dish.imageUrl)
        nameLabel.text = dish.name
    }
    
    func configureImageView(){
        dishImageView.layer.cornerRadius = 10
    }
    
    func setImageConstraints(){
        dishImageView.translatesAutoresizingMaskIntoConstraints = false
        dishImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        dishImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        dishImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        dishImageView.widthAnchor.constraint(equalTo: dishImageView.heightAnchor).isActive = true
    }
    
    func setLabelConstraints(){
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: dishImageView.trailingAnchor, constant: 20).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: dishImageView.trailingAnchor, constant: 20).isActive = true
        //priceLabel
    }
    
}
