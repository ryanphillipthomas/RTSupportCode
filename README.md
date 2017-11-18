# RTSupportCode

RTSupportCode provides great use for any iOS application. What it does is enables the user to unlock functionality on an application but doing in a way that is not publicly visible. For example it can be used to switch an app from the live server to the development server, enable logging of analytic events, display screen touches in an app for demos, etc.. RTSupportCodeFramework can allow all these things without the need for a developer to update the app.

## Installation

RTSupportCode is designed to be installed using Carthage or Cocoapods

## Carthage
[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate RTSupportCode into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
git "git@github.com:ryanphillipthomas/RTSupportCode.git" ~> 1.9
```

Run `carthage` to build the framework and drag the built `RTSupportCode.framework` into your Xcode project.

carthage update --platform iOS


## Cocoapods

[![CI Status](http://img.shields.io/travis/ryanphillipthomas/RTSupportCode.svg?style=flat)](https://travis-ci.org/ryanphillipthomas/RTSupportCode)
[![Version](https://img.shields.io/cocoapods/v/RTSupportCode.svg?style=flat)](http://cocoapods.org/pods/RTSupportCode)
[![License](https://img.shields.io/cocoapods/l/RTSupportCode.svg?style=flat)](http://cocoapods.org/pods/RTSupportCode)
[![Platform](https://img.shields.io/cocoapods/p/RTSupportCode.svg?style=flat)](http://cocoapods.org/pods/RTSupportCode)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

RTSupportCode is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'RTSupportCode'
```

## How To Use RTSupportCode
---

## AppDelegate
Update the application delegate with the process and setup methods as shown below. You can setup RTSupportCode with as many support codes as you wish.

```
func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
RTSupportCode.process(url:url)
return true
}

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
// Override point for customization after application launch.
RTSupportCodeConfiguration.setup(codes: ["QAMODE"])
return true
}
```

## Detecting an active code
```
override func viewDidLoad() {
super.viewDidLoad()
// Do any additional setup after loading the view, typically from a nib.
if RTSupportCode.matches(code: "QAMODE") {
view.backgroundColor = UIColor.red
}
}
```

## Triggering Support Code
You can trigger support code entry many ways. Either via a deeplink that you provide in an email to users, via a button action or even throu a tap gesture recognizer. The RTSupportCodeSample app demonstrates all three of these examples.

If you choose to implement the deeplink approach, you can trigger support code two ways either a normal support code deeplink for example: [RTSupportCodeSampleApp://SupportCode](RTSupportCodeSampleApp://SupportCode)

or a pre-filled deeplink: [RTSupportCodeSampleApp://SupportCode/QAMODE](RTSupportCodeSampleApp://SupportCode/QAMODE) which will pass the support code into the text entry for the user.

Additionally you have access to show the Support Code Entry view via either a button or a tap gesture. Simply implement the public display function as shown below.
```
@IBAction func enterSupportCodeButtonSelected(_ sender: Any) {
RTSupportCode.displaySupportCodeAlertView()
}

```

## Responding to successful support code entry
You might want to know when a support code was entered successfully. Perhaps you have an application that uses core data and you need to logout the user and delete the database, so that they restart fresh. For cases like this you can assign yourself as a delegate to RTSupportCode and listen to the supportCodeEnteredSuccessfully callback as displayed below:

```
extension ViewController:RTSupportCodeDelegate {
func supportCodeEnteredSuccessfully() {
print("successfully entered support code")

if RTSupportCode.matches(code: "QAMODE") {
print("code matches qamode!")
}
}
}

```

## Author

ryanphillipthomas, ryanphillipthomas@mac.com

## License

RTSupportCode is available under the MIT license. See the LICENSE file for more info.
