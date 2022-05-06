//
//  ProfileDataModel.swift
//  Instagram-CloneCoding
//
//  Created by EUNJU on 2022/05/06.
//

import Foundation
import UIKit

struct ProfileDataModel {
    let profileImgName: String
    let userName: String

    func makeProfileImg() -> UIImage? {
        return UIImage(named: profileImgName)
    }
}

extension ProfileDataModel {
    static let dummyData: [ProfileDataModel] = [
        ProfileDataModel(profileImgName: "planet1", userName: "eunjuzzoo"),
        ProfileDataModel(profileImgName: "planet2", userName: "zuuxian"),
        ProfileDataModel(profileImgName: "planet3", userName: "kingbadayo"),
        ProfileDataModel(profileImgName: "planet4", userName: "hello_zo0"),
        ProfileDataModel(profileImgName: "planet5", userName: "janechoi"),
        ProfileDataModel(profileImgName: "planet6", userName: "suvera"),
        ProfileDataModel(profileImgName: "planet7", userName: "2_jh_c"),
        ProfileDataModel(profileImgName: "planet8", userName: "berrymerryuuu"),
    ]
}
