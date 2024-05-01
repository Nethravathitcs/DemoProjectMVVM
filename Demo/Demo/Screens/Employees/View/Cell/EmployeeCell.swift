//
//  EmployeeCell.swift
//  Demo
//
//  Created by Nethra on 01/05/24.
//

import UIKit

class EmployeeCell: UITableViewCell {
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var itLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!

    static var identifier: String { return String(describing: self) }
    static var nib: UINib { return UINib(nibName: identifier, bundle: nil) }

    var cellViewModel: EmployeeCellViewModel? {
        didSet {
            idLabel.text = cellViewModel?.userId
            itLabel.text = cellViewModel?.it
            titleLabel.text = cellViewModel?.title
            bodyLabel.text = cellViewModel?.body
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        initView()
    }

    func initView() {
        // Cell view customization
        backgroundColor = .clear

        // Line separator full width
        preservesSuperviewLayoutMargins = false
        separatorInset = UIEdgeInsets.zero
        layoutMargins = UIEdgeInsets.zero
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        idLabel.text = nil
        itLabel.text = nil
        titleLabel.text = nil
        bodyLabel.text = nil
    }
}
