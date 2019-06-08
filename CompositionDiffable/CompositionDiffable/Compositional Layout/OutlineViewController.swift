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
        
        var isGroup: Bool {
            return self.outlineViewController == nil
        }
        private let identifier = UUID()
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, OutlineItem>! = nil
    var outlineCollectionView: UICollectionView! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Diffable + ComLayout"
        configureCollectionView()
        configureDataSource()
    }
    
    //TODO: For each ViewController finished add it to the subitem param
    private lazy var menuItems: [OutlineItem] = {
        return [
            OutlineItem(title: "Compositional Layout", indentLevel: 0, subitems: [
                OutlineItem(title: "Getting Started", indentLevel: 1, subitems: [
                    OutlineItem(title: "List", indentLevel: 2, viewController: ListViewController.self),
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
        collectionView.delegate = self
        collectionView.register(OutlineItemCellCollectionViewCell.self, forCellWithReuseIdentifier: OutlineItemCellCollectionViewCell.reuseIdentifier)
        self.outlineCollectionView = collectionView
    }
    
    func configureDataSource() {
        self.dataSource = UICollectionViewDiffableDataSource<Section, OutlineItem>(collectionView: outlineCollectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, menuItem: OutlineItem) ->
                UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(
                                                                withReuseIdentifier: OutlineItemCellCollectionViewCell.reuseIdentifier,
                                                                for: indexPath) as? OutlineItemCellCollectionViewCell
            else {
                fatalError("Could not create a new cell")
            }
            cell.label.text = menuItem.title
            cell.indentLevel = menuItem.indentLevel
            cell.isGroup = menuItem.isGroup
            cell.isExpanded = menuItem.isExpanded
            return cell
        }
        updateUI()
    }
    
    func snapshotForCurrentState() -> NSDiffableDataSourceSnapshot<Section, OutlineItem> {
        let snapshot = NSDiffableDataSourceSnapshot<Section, OutlineItem>()
        snapshot.appendSections([Section.main])
        func addItems(_ menuItem: OutlineItem) {
            snapshot.appendItems([menuItem])
            if menuItem.isExpanded {
                menuItem.subitems.forEach { addItems($0) }
            }
        }
        menuItems.forEach { addItems($0) }
        return snapshot
    }
    
    func updateUI() {
        let snapshot = snapshotForCurrentState()
        dataSource.apply(snapshot, animatingDifferences: true)
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

extension OutlineViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        guard let menuItem = self.dataSource.itemIdentifier(for: indexPath) else {
            return
        }
        
        collectionView.deselectItem(at: indexPath, animated: true)
        if menuItem.isGroup {
            menuItem.isExpanded.toggle()
            if let cell = collectionView.cellForItem(at: indexPath) as? OutlineItemCellCollectionViewCell {
                UIView.animate(withDuration: 0.3) {
                    cell.isExpanded = menuItem.isExpanded
                    self.updateUI()
                }
            }
        } else {
            if let viewController = menuItem.outlineViewController {
                let navController = UINavigationController(rootViewController: viewController.init())
                present(navController, animated: true)
            }
        }
    }
}

