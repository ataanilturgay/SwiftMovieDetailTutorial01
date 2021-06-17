//
//  MovieDetailViewController.swift
//  SwiftTutorial01
//
//  Created by Ata Anil Turgay on 17/06/2021.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet private weak var movieTableView: UITableView!

    private var viewModel: MovieDetailViewModel?
    private var movie: Movie {
        return Bundle.main.decode("movie.json")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 0.114, green: 0.157, blue: 0.259, alpha: 1)
        
        configureTableView()
        syncViewModel()
    }
    
    private func configureTableView() {
        movieTableView.register(UINib(nibName: "MovieImageTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieImageTableViewCell")
        movieTableView.register(UINib(nibName: "MovieInfosTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieInfosTableViewCell")
        movieTableView.register(UINib(nibName: "MovieActionsTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieActionsTableViewCell")
        movieTableView.register(UINib(nibName: "MovieImageTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieImageTableViewCell")

        movieTableView.backgroundColor = UIColor(red: 0.114, green: 0.157, blue: 0.259, alpha: 1)
        movieTableView.separatorStyle = .none
        movieTableView.tableFooterView = UIView()
        movieTableView.delegate = self
        movieTableView.dataSource = self
    }
}

// MARK: - sync view model
extension MovieDetailViewController {
    private func syncViewModel() {
        viewModel = MovieDetailViewModel(movie: self.movie)
        viewModel?.setDataDone = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.movieTableView.reloadData()
            }
        }
        viewModel?.setData()
    }
}

// MARK: - UITableView delegate & dataSource
extension MovieDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel?.movieItems.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.movieItems[section].rowCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = self.viewModel?.movieItems[indexPath.section] else { return UITableViewCell() }
        switch item.type {
        case .image:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieImageTableViewCell", for: indexPath) as? MovieImageTableViewCell else { return UITableViewCell() }
            cell.configure(with: item)
            cell.selectionStyle = .none
            return cell
        case .infos:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieInfosTableViewCell", for: indexPath) as? MovieInfosTableViewCell else { return UITableViewCell() }
            cell.configure(with: item)
            cell.selectionStyle = .none
            return cell
        case .actions:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieActionsTableViewCell", for: indexPath) as? MovieActionsTableViewCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            return cell
        }
    }
}
