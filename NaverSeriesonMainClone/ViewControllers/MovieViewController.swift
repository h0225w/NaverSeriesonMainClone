//
//  MovieViewController.swift
//  NaverSeriesonMainClone
//
//  Created by 박현우 on 2022/05/24.
//

import UIKit

class MovieViewController: UIViewController {
    // 헤더 뷰
    @IBOutlet weak var HeaderView: UIView!
    
    // 컨텐츠 스크롤 뷰
    @IBOutlet weak var ScrollView: UIScrollView!
    
    // 슬라이드 배너
    @IBOutlet weak var SlideBannerScrollView: UIScrollView!
    @IBOutlet weak var SlideBannerPageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
        setupSlideBanner()
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
    
    // MARK: - 메인 슬라이드 배너 설정
    private func setupSlideBanner() {
        // 슬라이드 배너 Delegate 설정
        SlideBannerScrollView.delegate = self
        
        // 슬라이드 배너 PageControl 좌우패딩 없애
        SlideBannerPageControl.backgroundStyle = .minimal
        SlideBannerPageControl.allowsContinuousInteraction = false
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
    
    // MARK: - 스크롤 뷰 당겼을 때 처리
    @objc private func handleRefresh() {
        ScrollView.refreshControl?.endRefreshing()
    }
    
    // MARK: - 현재 페이지 갱신
    private func setPageControlSelectedPage(currentPage: Int) {
        SlideBannerPageControl.currentPage = currentPage
    }
}

extension MovieViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value = scrollView.contentOffset.x / scrollView.frame.size.width
        setPageControlSelectedPage(currentPage: Int(round(value)))
    }
}
