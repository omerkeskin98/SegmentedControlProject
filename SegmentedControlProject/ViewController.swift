//
//  ViewController.swift
//  SegmentedControlProject
//
//  Created by Omer Keskin on 12.07.2024.
//


import UIKit

class ViewController: UIViewController {
    
    var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        segmentedControl = UISegmentedControl(items: ["Neon Academy 2023", "Neon", "Apps"])

        segmentedControl.backgroundColor = UIColor.black
        segmentedControl.tintColor = UIColor.white
        
        segmentedControl.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)
        ], for: .normal)
        
        segmentedControl.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15)
        ], for: .selected)
        
        segmentedControl.setBackgroundImage(imageWithColor(color: UIColor.lightGray), for: .normal, barMetrics: .default)
        
        segmentedControl.frame = CGRect(x: 10, y: 200, width: 300, height: 40)
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        view.addSubview(segmentedControl)
    }
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            segmentedControl.frame.size.width = 510
            segmentedControl.setBackgroundImage(imageWithColor(color: UIColor.purple), for: .selected, barMetrics: .default)
        case 1:
            segmentedControl.frame.size.width = 250
            segmentedControl.setBackgroundImage(imageWithColor(color: UIColor.green), for: .selected, barMetrics: .default)
        case 2:
            segmentedControl.frame.size.width = 150
            segmentedControl.setBackgroundImage(imageWithColor(color: UIColor.red), for: .selected, barMetrics: .default)
        default:
            break
        }
    }
    

    func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
