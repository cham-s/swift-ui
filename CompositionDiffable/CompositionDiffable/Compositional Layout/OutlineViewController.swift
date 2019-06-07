//
//  ViewController.swift
//  CompositionDiffable
//
//  Created by chams on 07/06/2019.
//  Copyright © 2019 Chams. All rights reserved.
//

/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 A simple outline view for the sample apps main UI
 */

import UIKit

class OutlineViewController: UIViewController {
    
    enum Section {
        case main
    }
    
    class OutlineItem: Hashable {
        let title: String
        let indentLevel: Int
        let subitems: [OutlineItem]
        let outlineViewController: UIViewController.Type?
        
        var isExpanded = false
        
        init(title: String,
             indentLevel: Int = 0,
             viewController: UIViewController.Type? = nil,
             subitems: [OutlineItem] = []) {
            self.title = title
            self.indentLevel = indentLevel
            self.subitems = subitems
            self.outlineViewController = viewController
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(identifier)
        }
        
        static func == (lhs: OutlineItem, rhs: OutlineItem) -> Bool {
            return lhs.identifier == rhs.identifier
        }
        private let identifier = UUID()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Diffable + ComLayout"
        //configureCollectionView()
        //configureDataSource()
    }
    
    //TODO: For each ViewController finished add it to the subitem param
    private lazy var menuItem: [OutlineItem] = {
        return [
            OutlineItem(title: "Compositional layout", indentLevel: 0, subitems: [
                OutlineItem(title: "Getting Started", indentLevel: 1, subitems: [
                    OutlineItem(title: "List", indentLevel: 2),
                    OutlineItem(title: "Grid", indentLevel: 2),
                    OutlineItem(title: "Inset Item Grid", indentLevel: 2),
                    OutlineItem(title: "Two-Column Grid", indentLevel: 2),
                    OutlineItem(title: "Per-Section Layout", indentLevel: 2, subitems: [
                        OutlineItem(title: "Distinct Sections", indentLevel: 3),
                        OutlineItem(title: "Adaptive Setions", indentLevel: 3)
                    ])
                ]),
                OutlineItem(title: "Advanced Layouts", indentLevel: 1, subitems: [
                    OutlineItem(title: "Supplementary Views", indentLevel: 2, subitems: [
                        OutlineItem(title: "Item Bagdes", indentLevel: 3),
                        OutlineItem(title: "Section Headers/Footers", indentLevel: 3),
                        OutlineItem(title: "Pinned Section Headers", indentLevel: 3)
                    ]),
                    OutlineItem(title: "Section Background Decoration", indentLevel: 2),
                    OutlineItem(title: "Nested Group", indentLevel: 2),
                    OutlineItem(title: "Orthogonal Section", indentLevel: 2, subitems: [
                        OutlineItem(title: "Orthogonal Sections", indentLevel: 3),
                        OutlineItem(title: "Orthogonal Section Behaviors", indentLevel: 3)
                    ])
                ]),
                OutlineItem(title: "Conference App", indentLevel: 1, subitems: [
                    OutlineItem(title: "Videos", indentLevel: 2),
                    OutlineItem(title: "News", indentLevel: 2),
                ])
            ]),
            OutlineItem(title: "Diffable Data Source", indentLevel: 0, subitems: [
                  OutlineItem(title: "Mountains Search", indentLevel: 1),
                  OutlineItem(title: "Settings: Wi-Fi", indentLevel: 1),
                  OutlineItem(title: "Insertions Sort Visualisation", indentLevel: 1)
            ])
        ]
    }()
}

extension OutlineViewController {
    func configureCollectionView() {
        let collectionView = UICollectionView(frame: view.bounds,
                                              collectionViewLayout: generateLayout())
        view.addSubview(collectionView)
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.backgroundColor = .systemBackground
        collectionView.register(, forCellWithReuseIdentifier: <#T##String#>)
    }
    
    func generateLayout() -> UICollectionViewLayout {
        let itemHeightDimension = NSCollectionLayoutDimension.absolute(44)
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: itemHeightDimension)
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: itemHeightDimension)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitem: item,
                                                       count: 1)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                        leading: 10,
                                                        bottom: 0,
                                                        trailing: 10)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

