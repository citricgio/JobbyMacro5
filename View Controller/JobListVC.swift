//
//  JobListViewController.swift
//  JobTrackMacro5
//
//  Created by Giovanna Micher on 17/05/24.
//

import UIKit

class JobListVC: UIViewController, UISearchBarDelegate, UISearchControllerDelegate {

    let coreDataController = CoreDataController.shared
    var collectionViewDelegate: CollectionViewDelegate = CollectionViewDelegate()
    var collectionViewDataSource: CollectionViewDataSource?
    lazy var context = coreDataController.persistentContainer.viewContext
    var jobs: [Job]?
    var filteredJobs = [Job]()
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchJob()
        
        configureViewController()
        collectionViewDataSource = CollectionViewDataSource(jobs: jobs)
        
        collectionView.delegate = collectionViewDelegate
        collectionView.dataSource = collectionViewDataSource
        collectionViewDelegate.dataSource = collectionViewDataSource
        collectionViewDelegate.controller = self
    
        collectionView.register(JobCell.self, forCellWithReuseIdentifier: JobCell.reuseID)
        
        setCollection()
        //configureSearchBar()
        
        // Binary Data
//        let image = UIImageView()
//        let dadoImagem = image.image?.pngData()
//        UIImage(data: dadoImagem!)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchJob()
        collectionViewDataSource?.jobs = jobs
    }
    
    func setCollection() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemGray5
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func fetchJob() {
        do {
            self.jobs = nil
            collectionViewDataSource?.jobs = nil
            jobs = try context.fetch(Job.fetchRequest())
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        } catch {
            print("deu errado")
        }
    }

    func configureViewController() {
        view.backgroundColor = .systemBackground
        self.navigationItem.title = "Jobs"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(pushFormVC))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "trash"), style: .plain, target: self, action: #selector(deleteAllJobs))
    }

    @objc func deleteAllJobs() {
        guard let jobs = jobs else { return }
        
        for job in jobs {
            self.context.delete(job)
        }
        
        do {
            try context.save()
        } catch {
            print("erro")
        }
        fetchJob()
    }
    
    @objc func pushFormVC() {
        let formVC = FormVC()
        formVC.title = "Create Job"
        navigationController?.pushViewController(formVC, animated: true)
    }
    
//    func configureSearchBar() {
//        let search = UISearchController(searchResultsController: nil)
//        search.delegate = self
//        search.searchBar.delegate = self
//        self.navigationItem.searchController = search
//
//    }
    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        filteredJobs = jobs?.filter {
//            $0.name?.lowercased().hasPrefix(searchText.lowercased()) ?? false
//        } ?? []
//    }

}
