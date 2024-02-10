//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Tousif on 2024-02-10.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        getRandomPhoto()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(x: 30, y: view.frame.size.height-150-view.safeAreaInsets.bottom, width: view.frame.size.width-60, height: 55)
    }
    @objc func didTapButton(){
        getRandomPhoto()
    }

    func getRandomPhoto() {
        let urlString = "https://source.unsplash.com/random/600x600"
        guard let url = URL(string: urlString) else {
            print("Invalid URL string.")
            return
        }

        guard let data = try? Data(contentsOf: url) else {
            print("Failed to fetch data from URL.")
            return
        }
        
        imageView.image = UIImage(data: data)
    }

}

