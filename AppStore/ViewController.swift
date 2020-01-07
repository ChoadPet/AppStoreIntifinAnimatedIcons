//
//  ViewController.swift
//  AppStore
//
//  Created by Vetaliy Poltavets on 12/28/19.
//  Copyright © 2019 vpoltave. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private let identifier = String(describing: DummyCollectionViewCell.self)
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        /// Loading custom `nib`
        let nib = UINib(nibName: identifier, bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        /// Starting animation
        startAutoScrollCardsCollectionView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        /// Remove timer from `RunLoop` object
        timer?.invalidate()
        timer = nil // just in case
    }
    
    private func startAutoScrollCardsCollectionView() {
        
        /// This method start timer and fire it immediately
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [unowned self] _ in
            let currentOffset = self.collectionView.contentOffset
            self.collectionView.setContentOffset(CGPoint(x: currentOffset.x + 5, y: currentOffset.y), animated: true)
        }
    }
}

// MARK: - UICollectionViewDataSource extension

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1_000_000
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout extension

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 110)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
    }
}
