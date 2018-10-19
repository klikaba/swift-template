[![Build status](https://build.appcenter.ms/v0.1/apps/dec0333b-e254-4bc9-a2ce-65237640e84a/branches/dev/badge)](https://appcenter.ms)

# Swift Tmeplate

This template provides starting point for Swift iOS app, following Klika quality guidelines,  with implemented authentication following OAuth2 standard.

## Setup

### Dependencies

- Cocoapods
- Overcommit

```
$ make install_dependencies
```
this script will:

- install cocoapods
- install overcommit
- run pod install

### Configuration

For any environment specific configuration use `\(schemeName).xcconfig` specific configuration file which will handle configuration per specific scheme

## Getting started

Use Klika quality guidelines for general development references.

### Swift styleguides

A tool to enforce Swift style and conventions, loosely based on [GitHub's Swift Style Guide.](https://github.com/github/swift-style-guide)

### Cerfificate handling
TBD

### New feature

Use [GitFlow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow) development workflow with controller tests and documentation included.

### Pull request quality gates

- no conflicts with target branch
- pass AppCentar tests
- code review approval

## Tools

### Networking with Alamofire
Networking is implemented via [Alamofire](https://github.com/Alamofire/Alamofire) that enables easy parsing of response to Api Models inside app together with [AlamofireObjectMapper](https://github.com/tristanhimmelman/AlamofireObjectMapper) and [ObjectMapper](https://github.com/Hearst-DD/ObjectMapper)

### Bond
Simplify ViewController ViewModel binding using [Bond](https://github.com/DeclarativeHub/Bond)

### Quality gates

This project will run static code analyser on every commit and.

### Static code analyser
This template us using [SwiftLint](https://github.com/realm/SwiftLint) for static code analysis. All SwiftLint offenses are automatically tracked and prevented on every commit. This feature is handled by [Overcommit](https://github.com/brigade/overcommit) git hook manager.

### Testing
TBD

### Continuous Integration
AppCentar

## Maintainers

- [Haris Dizdarevic](https://github.com/haris-dizdarevic), [Zaharije Pasalic](https://github.com/zpasal)
