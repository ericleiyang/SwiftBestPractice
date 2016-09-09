# SwiftBestPractice
============
[![BuddyBuild](https://dashboard.buddybuild.com/api/statusImage?appID=562a9aac2492560100211378&branch=master&build=latest)](https://dashboard.buddybuild.com/apps/562a9aac2492560100211378/build/latest)
![Language](https://img.shields.io/badge/language-Swift%202-orange.svg)
![License](https://img.shields.io/github/license/JakeLin/SwiftWeather.svg?style=flat)

## Screenshots
![Screenshots](https://cloud.githubusercontent.com/assets/5039434/18386715/0683b148-76dc-11e6-8ede-d2df6f794287.png)

## Why
There are always some common modules when developing different iOS apps, such as: RESTful API consuming, JSON serialization, authorization, network status monitoring, errors handling, data persistence.
This open source project strives to include most of these common modules and brings convenience to iOS developers while starting a project from scratch.
The demo is an weather app utilizing Swift3.

### What
* Xcode 7
* iOS 9
* Swift 3

## Version 1.0
This version has been upgraded to support iOS 9 and using Swift 3.

## Features
* Swift Programming Language - fully upgraded to version 3
* MVVM design pattern - Observable ViewModels binding with Views
* Best practice of [Alamofire](https://github.com/Alamofire/Alamofire): Alamofire routers
* Best practice of JSON serialization - Utilizing of [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON)
* @IBDesignable and @IBInspectable of UIViews
* Extension of Classes - Adding additional methods to existing Classes
* Icon fonts － Utilizing of [Weather Icons](https://erikflowers.github.io/weather-icons/)
* Core Location Framework - Utilizing of [CLLocation/CLLocationManager](https://developer.apple.com/library/ios/documentation/CoreLocation/Reference/CoreLocation_Framework/index.html#//apple_ref/doc/uid/TP40007123)
* UIStackView
* Text font size fits to label width
* Status bar hidden

## TODO
* Pin auth screen
* [Realm](https://realm.io) - A light-weight mobile database
* Facade design pattern - Local database and API routing
* Some others...

## How to build

1) Clone the repository

```bash
$ git clone https://github.com/ericleiyang/SwiftBestPractice.git
```

2) Install pods

```bash
$ cd SwiftBestPractice
$ pod install
```

3) Open the workspace in Xcode

```bash
$ open "SwiftBestPractice.xcworkspace"
```

5) Compile and run the app in your simulator


# Requirements
* Xcode 7
* iOS 9
