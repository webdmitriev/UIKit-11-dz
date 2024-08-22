//
//  PostCell.swift
//  UIKit - 11 - dz
//
//  Created by Олег Дмитриев on 22.08.2024.
//

import UIKit

class PostCell: UICollectionViewCell {
    
    static var reuseID: String = "PostCell"
    
    private let appBuilder = UIBuilder()
    private lazy var cellWidth: CGFloat = UIScreen.main.bounds.width
    
    // MARK: - Header post
    private lazy var headerStack: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.alignment = .center
        $0.distribution = .fill
        $0.spacing = 20
        $0.addArrangedSubview(userAvatar)
        $0.addArrangedSubview(userName)
        return $0
    }(UIStackView())
    private lazy var userAvatar: UIImageView = appBuilder.addImage(image: "avatar-01", brs: 22)
    private lazy var userName: UILabel = appBuilder.addLabel(text: "", fontS: 20, fontW: .bold, line: 1)
    
    // MARK: - Content post
    private lazy var postThumbnail: UIImageView = appBuilder.addImage(image: "post-01")
    private lazy var postDate: UILabel = appBuilder.addLabel(text: "", fontS: 14, fontW: .regular, color: .appGrayText)
    private lazy var postTitle: UILabel = appBuilder.addLabel(text: "", fontS: 22, fontW: .bold)
    private lazy var postExcerpt: UILabel = appBuilder.addLabel(text: "", fontS: 16, fontW: .regular)
    
    // MARK: - Footer post
    private lazy var footerStack: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.widthAnchor.constraint(equalToConstant: 208).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 8
        
        $0.addArrangedSubview(buttonLike)
        $0.addArrangedSubview(buttonComment)
        $0.addArrangedSubview(buttonForward)
        
        return $0
    }(UIStackView())

    private lazy var buttonLike: UIButton = appBuilder.addIconBtn(image: .heartWhite, text: "")
    private lazy var buttonComment: UIButton = appBuilder.addIconBtn(image: .commentWhite, text: "")
    private lazy var buttonForward: UIButton = appBuilder.addIconBtn(image: .forwardWhite)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [headerStack, postThumbnail, postDate, postTitle, postExcerpt, footerStack].forEach {
            contentView.addSubview($0)
        }
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(item: NewsData) {
        userAvatar.image = UIImage(named: item.userAvatar)
        userName.text = item.userName
        
        postThumbnail.image = UIImage(named: item.postThumbnail)
        postDate.text = item.postDate
        postTitle.text = item.postTitle
        postExcerpt.text = item.postExcerpt
        
        buttonLike.setTitle(" \(item.postLike)", for: .normal)
        buttonComment.setTitle(" \(item.postComments)", for: .normal)
        
        constraintsUI()
    }
    
    
    private func setupUI() {
        userAvatar.widthAnchor.constraint(equalToConstant: 44).isActive = true
        userAvatar.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    private func constraintsUI() {
        let hAnchorThumbnail = postThumbnail.heightAnchor.constraint(equalTo: postThumbnail.widthAnchor, multiplier: (postThumbnail.image?.getRatio())!)
        hAnchorThumbnail.priority = .defaultHigh
        
        NSLayoutConstraint.activate([
            // MARK: - Header post
            headerStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            headerStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            headerStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            // MARK: - Content post
            postThumbnail.topAnchor.constraint(equalTo: userAvatar.bottomAnchor, constant: 16),
            postThumbnail.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postThumbnail.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postThumbnail.widthAnchor.constraint(equalToConstant: cellWidth - 40),
            hAnchorThumbnail,
            
            postDate.topAnchor.constraint(equalTo: postThumbnail.bottomAnchor, constant: 14),
            postDate.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            postDate.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),

            postTitle.topAnchor.constraint(equalTo: postDate.bottomAnchor, constant: 5),
            postTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            postTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),

            postExcerpt.topAnchor.constraint(equalTo: postTitle.bottomAnchor, constant: 10),
            postExcerpt.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            postExcerpt.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            // MARK: - Footer post
            footerStack.topAnchor.constraint(equalTo: postExcerpt.bottomAnchor, constant: 16),
            footerStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
//            footerStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            footerStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),

        ])
    }
    
}


private extension UIImage {
    func getRatio() -> CGFloat? {
        self.size.height / self.size.width
    }
}
