//
//  PostDataModel.swift
//  Instagram-CloneCoding
//
//  Created by EUNJU on 2022/05/06.
//

import Foundation
import UIKit

struct PostDataModel {
    let userName: String
    let profileImgName: String
    let postImageName: String
    let like: Int
    let content: String
    let comment: Int
    
    func makePostImg() -> UIImage? {
        return UIImage(named: postImageName)
    }
    
    func makelikeData() -> String {
        return "좋아요 \(like)개"
    }
    
    func makeCommentData() -> String {
        return "댓글 \(comment)개 모두 보기"
    }
}

extension PostDataModel {
    static let dummyData: [PostDataModel] = [
        PostDataModel(userName: "eunjuzzoo", profileImgName: "planet1", postImageName: "postImage1", like: 5, content: "🌱 기회는 일어나는 것이 아니라 만들어내는 것이다.🌱 기회는 일어나는 것이 아니라 만들어내는 것이다.🌱 기회는 일어나는 것이 아니라 만들어내는 것이다.🌱 기회는 일어나는 것이 아니라 만들어내는 것이다.🌱 기회는 일어나는 것이 아니라 만들어내는 것이다.🌱 기회는 일어나는 것이 아니라 만들어내는 것이다.🌱 기회는 일어나는 것이 아니라 만들어내는 것이다.🌱 기회는 일어나는 것이 아니라 만들어내는 것이다.🌱 기회는 일어나는 것이 아니라 만들어내는 것이다.🌱 기회는 일어나는 것이 아니라 만들어내는 것이다.", comment: 13),
        PostDataModel(userName: "janechoi", profileImgName: "planet2", postImageName: "postImage1", like: 3, content: "🌱 기회는 일어나는 것이 아니라 만들어내는 것이다.", comment: 7),
        PostDataModel(userName: "kingbadayo", profileImgName: "planet3", postImageName: "postImage1", like: 2, content: "🌱 기회는 일어나는 것이 아니라 만들어내는 것이다.", comment: 11),
        PostDataModel(userName: "hello_zo0", profileImgName: "planet4", postImageName: "postImage1", like: 8, content: "🌱 기회는 일어나는 것이 아니라 만들어내는 것이다.", comment: 4),
        PostDataModel(userName: "suvera", profileImgName: "planet5", postImageName: "postImage1", like: 7, content: "🌱 기회는 일어나는 것이 아니라 만들어내는 것이다.", comment: 2),
        PostDataModel(userName: "2_jh_c", profileImgName: "planet6", postImageName: "postImage1", like: 5, content: "🌱 기회는 일어나는 것이 아니라 만들어내는 것이다.", comment: 6),
        PostDataModel(userName: "berrymerryuuu", profileImgName: "planet8", postImageName: "postImage1", like: 6, content: "🌱 기회는 일어나는 것이 아니라 만들어내는 것이다.", comment: 7)
    ]
}
