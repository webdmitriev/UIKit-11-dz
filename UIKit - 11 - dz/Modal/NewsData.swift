//
//  CollectionData.swift
//  UIKit - 11 - dz
//
//  Created by Олег Дмитриев on 22.08.2024.
//

import Foundation

struct NewsData {
    let userAvatar: String
    let userName: String
    
    let postDate: String
    let postThumbnail: String
    let postTitle: String
    let postExcerpt: String
    let postLike: String
    let postComments: String
    
    static func mockData() -> [NewsData] {
        [
            NewsData(userAvatar: "avatar-01", userName: "Joan Tolaresa 1", postDate: "23 апреля 2024",
                     postThumbnail: "post-01", postTitle: "Ut enim ad minim veniam", postExcerpt: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", postLike: "12", postComments: "3"),
            NewsData(userAvatar: "avatar-02", userName: "Joan Tolaresa 2", postDate: "19 апреля 2024",
                     postThumbnail: "post-02", postTitle: "Ut enim ad minim veniam eiusmod tempor", postExcerpt: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore", postLike: "8", postComments: "1"),
            NewsData(userAvatar: "avatar-03", userName: "Joan Tolaresa 3", postDate: "17 апреля 2024",
                     postThumbnail: "post-03", postTitle: "Ut enim ad minim veniam tempor", postExcerpt: "Lorem ipsum dolor sit amet, consectetur adipisicing elit", postLike: "6", postComments: "0"),
        ]
    }
}
