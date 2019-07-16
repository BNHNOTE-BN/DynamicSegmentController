//
//  ViewController.swift
//  ScrollSegmentView
//
//  Created by Banyar on 16/7/19.
//  Copyright © 2019 BNH. All rights reserved.
//
//UIColor(red: 24/255, green: 10/255, blue: 36/255, alpha: 1)
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fcImageView: UIImageView!
    @IBOutlet weak var segmentHolderView: UIView!
    
    var segmentArr = ["Chelsea", "Manchester United", "liverpool fc", "manchester city", "Arsenal F C"]
    var fcImageArr = ["che.jpg","mu.jpg","liverpool.png","mancity.png","arsenal.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup(){
        let scrollView = UIScrollView()
        scrollView.frame = CGRect(x: 0, y: 0, width: segmentHolderView.frame.size.width, height: segmentHolderView.frame.size.height)
        scrollView.showsHorizontalScrollIndicator = false
        
        let contentView = UIView()
        
        let teamSegment = UISegmentedControl(items: segmentArr)
        teamSegment.frame = CGRect(x: 0, y: 0, width: (UIWindow().frame.size.width / 2.3) * CGFloat(segmentArr.count), height: 42)
        teamSegment.addTarget(self, action: #selector(didChangeSegment(_:)), for: .valueChanged)
        teamSegment.selectedSegmentIndex = 0
        
        contentView.frame = teamSegment.frame
        contentView.addSubview(teamSegment)
        
        scrollView.contentSize = CGSize(width: contentView.frame.size.width, height: contentView.frame.size.height)
        scrollView.addSubview(contentView)
        
        self.segmentHolderView.addSubview(scrollView)
    }
    
    @objc
    func didChangeSegment(_ sender: UISegmentedControl){
        self.fcImageView.image = UIImage(named: fcImageArr[sender.selectedSegmentIndex])
    }
   
}

