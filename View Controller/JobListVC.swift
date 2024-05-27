//
//  JobListViewController.swift
//  JobTrackMacro5
//
//  Created by Giovanna Micher on 17/05/24.
//

import UIKit

class JobListVC: UIViewController {

    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var collectionViewDelegate: CollectionViewDelegate = CollectionViewDelegate()
    var collectionViewDataSource: CollectionViewDataSource?
    
    var jobsCollectionView: UICollectionView!
    let layout = UICollectionViewFlowLayout()
    var jobs = [Job]() {
        didSet {
            jobsCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        // If portrait orientation else landscape
        if UIScreen.main.bounds.height > UIScreen.main.bounds.width {
            layout.itemSize = CGSize(width: view.frame.width - 45, height: 110)
        } else {
            layout.itemSize = CGSize(width: view.frame.width/2 - 45, height: 110)
        }

        jobsCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    private func configureCollectionView() {
        view.addSubview(jobsCollectionView)
        
        layout.sectionInset = UIEdgeInsets(top: 2, left: 22.5, bottom: 15, right: 22.5)
        jobsCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        jobsCollectionView.register(JobCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        jobsCollectionView.delegate = collectionViewDelegate
        jobsCollectionView.dataSource = collectionViewDataSource
        jobsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        jobsCollectionView.backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            jobsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            jobsCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            jobsCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            jobsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

//    var collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        
//        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        
//        collection.translatesAutoresizingMaskIntoConstraints = false
//        
//        return collection
//    }()
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        fetchJob()
//        
//        configureViewController()
//        collectionViewDataSource = CollectionViewDataSource(jobs: jobs)
//        
//        collectionView.delegate = collectionViewDelegate
//        collectionView.dataSource = collectionViewDataSource
//        collectionViewDelegate.dataSource = collectionViewDataSource
//        collectionViewDelegate.controller = self
//    
//        collectionView.register(JobCollectionViewCell.self, forCellWithReuseIdentifier: JobCollectionViewCell.reuseID)
//        
//        setCollection()
//        configureSearchBar()
//        
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchJob()
        collectionViewDataSource?.jobs = jobs
    }
    
    func fetchJob() {
        do {
            self.jobs = try context.fetch(Job.fetchRequest())
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    func saveCoreDateContext() {
        do {
            try self.context.save()
        } catch let error as NSError {
            print(error)
        }
    }
    
//    func fetchJob() {
//        do {
//            self.jobs = nil
//            collectionViewDataSource?.jobs = nil
//            jobs = try context.fetch(Job.fetchRequest())
//            DispatchQueue.main.async {
//                self.collectionView.reloadData()
//            }
//        } catch {
//            print("deu errado")
//        }
//    }

    func configureViewController() {
        view.backgroundColor = .systemGray5
        self.navigationItem.title = "Jobs"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(pushFormVC))
        //self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "trash"), style: .plain, target: self, action: #selector(deleteAllJobs))
    }

//    @objc func deleteAllJobs() {
//        guard let jobs = jobs else { return }
//        
//        for job in jobs {
//            self.context.delete(job)
//        }
//        
//        do {
//            try context.save()
//        } catch {
//            print("erro")
//        }
//        fetchJob()
//    }
    
    @objc func pushFormVC() {
        let formVC = FormVC()
        formVC.title = "Forms"
        navigationController?.pushViewController(formVC, animated: true)
    }
    
    

}

extension JobListVC: UISearchBarDelegate {
    func configureSearchBar() {
        let search = UISearchController(searchResultsController: nil)
        search.delegate = self
        search.searchBar.delegate = self
        self.navigationItem.searchController = search

    }
}
