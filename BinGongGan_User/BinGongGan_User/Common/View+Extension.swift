//
//  View+Extension.swift
//  BinGongGan_User
//
//  Created by 윤지호 on 2023/09/06.
//

import Foundation
import SwiftUI

struct TabBarAccessor: UIViewControllerRepresentable {
    var callback: (UITabBar) -> Void
    private let proxyController = ViewController()

    func makeUIViewController(context: UIViewControllerRepresentableContext<TabBarAccessor>) -> some UIViewController {
        proxyController.callback = callback
        return proxyController
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    private class ViewController: UIViewController {
        var callback: (UITabBar) -> Void = { _ in }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            if let tabBar = self.tabBarController {
                self.callback(tabBar.tabBar)
            }
        }

    }
}


extension View {
    func setTabBarVisibility(isHidden: Bool) -> some View {
        background(TabBarAccessor { tabBar in
            tabBar.isHidden = isHidden
        })
    }
}
