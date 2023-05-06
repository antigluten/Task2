//
//  ViewController.swift
//  Task2
//
//  Created by va-gusev on 04.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let titles = ["First Button", "Second Medium Button", "Third"]
        var padding: CGFloat = 70
        let buttons = titles.map { title in
            let button = createButton(with: title)
            view.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                button.topAnchor.constraint(equalTo: view.topAnchor, constant: padding)
            ])
            padding += 52
            return button
        }
        
        buttons.last?.addTarget(self, action: #selector(openModal), for: .touchUpInside)
    }
    
    @objc func openModal() {
        let modal = UIViewController()
        modal.view.backgroundColor = .systemBackground
        present(modal, animated: true)
    }
    
    func createButton(with title: String) -> UIButton {
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .large
        config.image = UIImage(systemName: "smallcircle.filled.circle")
        config.contentInsets = .init(top: 10, leading: 14, bottom: 10, trailing: 14)
        config.imagePlacement = .trailing
        config.imagePadding = 8
        let button = UIButton(configuration: config)
        button.setTitle(title, for: .normal)
        button.configurationUpdateHandler = { button in
            UIView.animate(withDuration: 0.1) {
                button.isUserInteractionEnabled = true
                button.transform = button.isHighlighted ? CGAffineTransform(scaleX: 0.85, y: 0.85) : .identity
            }
        }
        return button
    }
}
