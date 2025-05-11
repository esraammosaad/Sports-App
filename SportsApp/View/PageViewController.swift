//
//  PageViewController.swift
//  SportsApp
//
//  Created by Esraa Mohammed Mosaad on 11/05/2025.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    var arrContainer = [UIViewController]()
    var pageControl = UIPageControl()
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = arrContainer.firstIndex(of: viewController)
        else{
            return nil
        }
        
        let prevIndex = currentIndex - 1
        
        guard prevIndex >= 0 else{
            
            return nil
        }
        
        return arrContainer[prevIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = arrContainer.firstIndex(of: viewController)
        else{
            return nil
        }
        
        let nextIndex = currentIndex + 1
        
        guard nextIndex < arrContainer.count else{
            
         
            
            
            return nil
        }
        
        return arrContainer[nextIndex]
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let v1 = self.storyboard?.instantiateViewController(withIdentifier: "v1")
        let v2 = self.storyboard?.instantiateViewController(withIdentifier: "v2")
        let v3 = self.storyboard?.instantiateViewController(withIdentifier: "v3")
        
        arrContainer.append(v1!)
        arrContainer.append(v2!)
        arrContainer.append(v3!)
        
        delegate = self
        dataSource = self
        
        if let v1 = arrContainer.first{
            
            setViewControllers([v1], direction: .forward, animated: true)
        }
        
        
        setupPageControl()

       
    }
    
    
    func setupPageControl(){
        
        pageControl = UIPageControl(frame: CGRect(x: 0 , y: UIScreen.main.bounds.maxY - 100, width: UIScreen.main.bounds.width, height: 40))
        
        pageControl.numberOfPages = arrContainer.count
        pageControl.currentPage = 0
        pageControl.tintColor = UIColor.white
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.white
        
        self.view.addSubview(pageControl)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        
        self.pageControl.currentPage = arrContainer.firstIndex(of: pageContentViewController)!
    }
    


}
