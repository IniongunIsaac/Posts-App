//
//  UsersViewController.swift
//  Posts App
//
//  Created by Isaac Iniongun on 31/01/2020.
//

import UIKit

class UsersViewController: BaseViewController {
    
    @IBOutlet weak var usersTableView: UITableView!
    var usersViewModel: IUsersViewModel?
    
    override func getViewModel() -> BaseViewModel {
        return usersViewModel as! BaseViewModel
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Users"
    }
    
    override func setChildClassObservers() {
        bindUsers()
    }
    
    fileprivate func bindUsers() {
        usersViewModel?.users.bind(to: usersTableView.rx.items) { [weak self] (tableView, index, element) in
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "usersTableViewCell")!
            
            cell.textLabel?.text = element.username
            cell.detailTextLabel?.text = element.email
            cell.imageView?.image = UIImage(systemName: "person.circle.fill")
            cell.imageView?.tintColor = appColor
            cell.imageView?.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                (cell.imageView?.heightAnchor.constraint(equalToConstant: CGFloat(45)))!,
                (cell.imageView?.widthAnchor.constraint(equalToConstant: CGFloat(45)))!,
                (cell.imageView?.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 6))!,
                (cell.imageView?.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 6))!
            ])
            
            return cell
            
        }.disposed(by: disposeBag)
    }

}
