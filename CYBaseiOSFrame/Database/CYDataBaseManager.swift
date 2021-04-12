//
//  CYDataBaseManager.swift
//  CYBaseiOSFrame
//
//  Created by Jade on 2018/7/30.
//  Copyright © 2018年 Jade. All rights reserved.
//

import Foundation
import RealmSwift

class CYDatabaseManager: NSObject {
    /// 配置数据库
    public class func configRealm() {
        /// 如果要存储的数据模型属性发生变化,需要配置当前版本号比之前大
        let dbVersion : UInt64 = 2
        let docPath:String! = documentsDir
        let dbPath = docPath.appending(CY_DB_NAME)
        let config = Realm.Configuration(fileURL: URL.init(string: dbPath), inMemoryIdentifier: nil, syncConfiguration: nil, encryptionKey: nil, readOnly: false, schemaVersion: dbVersion, migrationBlock: { (migration, oldSchemaVersion) in
            
        }, deleteRealmIfMigrationNeeded: false, shouldCompactOnLaunch: nil, objectTypes: nil)
        Realm.Configuration.defaultConfiguration = config
        let realm = try! Realm(configuration: config)

        Realm.asyncOpen { (realm, error) in
            if let _ = realm {
                log.info("Realm 服务器配置成功!")
            }else if let error = error {
                log.info("Realm 数据库配置失败：\(error.localizedDescription)")
            }
        }
    }
    
    private class func getDB() -> Realm {
        let docPath:String! = documentsDir
        let dbPath = docPath.appending(CY_DB_NAME)
        /// 传入路径会自动创建数据库
        let defaultRealm = try! Realm(fileURL: URL.init(string: dbPath)!)
        return defaultRealm
    }
    
}

extension CYDatabaseManager {
    
    public class func insertUser(by user : CYUser) -> Void {
        let defaultRealm = self.getDB()
        try! defaultRealm.write {
            defaultRealm.add(user, update: .all)
        }
    }
    
    public class func getUserByPhone(_ phone: String) -> Results<CYUser> {
        let defaultRealm = self.getDB()
        let predicate = NSPredicate(format: "phone = '%s'", phone)
        let results = defaultRealm.objects(CYUser.self)
        return  results.filter(predicate)
    }
    
}
