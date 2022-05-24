//
//  MovieViewController.swift
//  NaverSeriesonMainClone
//
//  Created by 박현우 on 2022/05/24.
//

import UIKit

class MovieViewController: UIViewController {
    @IBOutlet weak var HeaderView: UIView!
    @IBOutlet weak var ScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
    }
}

extension MovieViewController {
    // MARK: - 레이아웃 설정
    private func setupLayout() {
        self.view.backgroundColor = UIColor(named: "BackgroundColor")
        
        // HeaderView 하단 border 추가
        addBottomBorder(HeaderView)
        
        // ScrollView 당겨서 새로고침
        ScrollView.refreshControl = UIRefreshControl()
        ScrollView.refreshControl?.tintColor = .white
        ScrollView.refreshControl?.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
    }
    
    // MARK: - 하단 border 추가
    private func addBottomBorder(_ view: UIView) {
        let thickness = 0.5
        let y = self.HeaderView.frame.size.height - thickness
        let width = self.HeaderView.frame.size.width
        let border = CALayer()
        border.frame = CGRect(x: 0.0, y: y, width: width, height: thickness)
        border.backgroundColor = UIColor.darkGray.cgColor
        view.layer.addSublayer(border)
    }
    
    @objc private func handleRefresh() {
        ScrollView.refreshControl?.endRefreshing()
    }
}
