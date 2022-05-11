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
        PostDataModel(userName: "eunjuzzoo", profileImgName: "planet1", postImageName: "planet9", like: 5, content: "Saturn’s rings and northern hemisphere glow bright in this representational color photograph taken by Voyager 2. It's a combination of three images, taken through ultraviolet, violet and green filters.", comment: 13),
        PostDataModel(userName: "kingbadayo", profileImgName: "planet3", postImageName: "space", like: 2, content: "A beautiful space butterfly! 🦋", comment: 11),
        PostDataModel(userName: "hello_zo0", profileImgName: "planet4", postImageName: "planet10", like: 8, content: "We’ve had one moon, yes, but what about a second moon? 🍳", comment: 4),
        PostDataModel(userName: "suvera", profileImgName: "planet5", postImageName: "earth", like: 7, content: "Earth, The Blue Planet, Gaia, Terra, The Big Blue Marble 🌎\n\nNo matter what you call it, it will always be home. We here at NASA are celebrating #EarthDay with you. From the depths of the oceans to the tallest peaks, from lush forests to arid deserts, our planet is full of brilliant diversity.", comment: 2),
        PostDataModel(userName: "2_jh_c", profileImgName: "planet6", postImageName: "galaxy", like: 5, content: "Okay, I like it, Picasso! 🖼\n\nThis cosmic portrait—captured with the Hubble Space Telescope’s Wide Field Camera 3–shows a stunning view of a spiral galaxy, which lies approximately 60 million light-years from Earth in the constellation Coma Berenices. This constellation – whose name translates as Bernice’s Hair – was named after an Egyptian queen who lived more than 2,200 years ago.", comment: 6),
        PostDataModel(userName: "berrymerryuuu", profileImgName: "planet8", postImageName: "sun", like: 6, content: "A flare for the dramatic 🎭\n\nOur Sun has been a little extra over the last two weeks with five moderate to strong solar flares – sudden releases of magnetic energy. Since April 19, three of them were classified as strong. The Sun emits solar flares occasionally, though they don’t always impact humans on Earth.", comment: 7)
    ]
}
