//
//  Toast.swift
//  Keynote
//
//  Created by Dmitrii Voronin on 16.12.2020.
//

import Foundation
import UIKit

class ToastFactory {
    enum VerticalPosition {
        case top
        case bottom
        case miidle
    }
    
    static func show(message: String,
                     view: UIView,
                     position: VerticalPosition,
                     fontSize: CGFloat = 14,
                     backgroundColor: UIColor = .gray,
                     textColor: UIColor = .white
    ) {
        let kToastVerticalConstraint: CGFloat = 30
        let kToastHorizontalConstraint: CGFloat = 15
        let kLabelVerticalConstraint: CGFloat = 20
        let kLabelHorizontalConstrant: CGFloat = 10
        
        let toast = UIView(frame: CGRect())
        toast.backgroundColor = backgroundColor
        toast.alpha = 0.0
        toast.layer.cornerRadius = 15
        toast.clipsToBounds = true
        
        let toastLabel = UILabel(frame: CGRect())
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center
        toastLabel.font.withSize(fontSize)
        toastLabel.text = message
        toastLabel.clipsToBounds = true
        toastLabel.numberOfLines = 0
        
        toast.addSubview(toastLabel)
        view.addSubview(toast)
        
        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        toast.translatesAutoresizingMaskIntoConstraints = false
        
        toastLabel.leadingAnchor.constraint(equalTo: toast.leadingAnchor, constant: kLabelVerticalConstraint).isActive = true
        toastLabel.trailingAnchor.constraint(equalTo: toast.trailingAnchor, constant: -kLabelVerticalConstraint).isActive = true
        toastLabel.topAnchor.constraint(equalTo: toast.topAnchor, constant: kLabelHorizontalConstrant).isActive = true
        toastLabel.bottomAnchor.constraint(equalTo: toast.bottomAnchor, constant: -kLabelHorizontalConstrant).isActive = true
        
        switch position {
        case .top:
            toast.topAnchor.constraint(equalTo: view.topAnchor, constant: kToastVerticalConstraint).isActive = true
        case .bottom:
            toast.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -kToastVerticalConstraint).isActive = true
        case .miidle:
            toast.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        }
        toast.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: kToastHorizontalConstraint).isActive = true
        toast.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -kToastHorizontalConstraint).isActive = true
        
        
        toast.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        UIView.animate(withDuration: 0.7, delay: 0.0, options: .curveEaseIn, animations: {
            toast.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: 0.7, delay: 2.5, options: .curveEaseOut, animations: {
                toast.alpha = 0.0
            }, completion: { _ in
                toast.removeFromSuperview()
            })
        })
    }
    
}
