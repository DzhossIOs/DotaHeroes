//  ViewController.swift
//  PetDotaHerores
//
//  Created by Zhastalap Aldanysh on 5/12/21.

import UIKit

struct HomeCellModel {
    let text: String
    let icon: String
}

final class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private var models = [HomeCellModel]()
    private let viewModel: HomeViewModel
    private let tableView = UITableView()

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: .none, bundle: .none)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        bind()
        viewModel.viewDidLoad()
    }
    
    private func setViews() {
        title = "Dota heroes"
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "cellId")
        tableView.frame = view.bounds
    }

    private func bind() {
        viewModel.cellModels.bind { [weak self] models in
            self?.models = models
            self?.tableView.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let urlString = "https://api.opendota.com" + (models[indexPath.row].icon)
        let url = URL(string: urlString)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! HomeTableViewCell
        cell.textHero.text = models[indexPath.row].text
        if let imageUrl = url {
            cell.iconImage.downloaded(from: imageUrl)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectAtRow(index: indexPath.row)
    }
}


