//  ViewController.swift
//  PetDotaHerores
//
//  Created by Zhastalap Aldanysh on 5/12/21.

import UIKit

struct HomeCellModel {
    let text: String
}

final class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private var models = [HomeCellModel]()
    private let viewModel: HomeViewModel
    private let tableView = UITableView()

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: .none, bundle: .none)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.frame = view.bounds
    }

    private func bind() {
        viewModel.cellModels.bind { [weak self] models in
            self?.models = models
            self?.tableView.reloadData()
        }
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        models.count
    }

    func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = models[indexPath.row].text
        return cell
    }

    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectAtRow(index: indexPath.row)
    }
}
