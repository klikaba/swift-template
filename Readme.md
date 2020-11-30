[![Build status](https://build.appcenter.ms/v0.1/apps/dec0333b-e254-4bc9-a2ce-65237640e84a/branches/dev/badge)](https://appcenter.ms)

# Swift template

A starting point for new iOS projects at Klika.

## Setup

### Dependencies

- Overcommit

```
$ make install_dependencies
```
this script will:

- install overcommit

## Adding third-party dependencies with Swift Package Manager
1. In Xcode, go to File > Swift packages > Add new package dependency
2. Enter package repository URL and click next
3. Choose version options and click next
4. Select desired dependency targets and click finish

### Configuration

For any environment specific configuration use `\(schemeName).xcconfig` specific configuration file which will handle configuration per specific scheme

## Getting started

Use Klika quality guidelines for general development references.

### Swift styleguides

A tool to enforce Swift style and conventions, loosely based on [GitHub's Swift Style Guide.](https://github.com/github/swift-style-guide)

### certificate handling
Currently done manually.

### Build scripts
We are currently using only one script:
* runSwiftlint.sh | Runs swiftlint in debug configuration only

Scripts are located under BuildScripts folder at the root of the project.

## Adding new build scripts
1. Add script file to BuildScripts folder
2. Use "chmod u+x [filePath]" to give script permission to be executed. E.g. chmod u+x BuildScripts/runSwiftlinth.sh
3. In the Xcode file navigator, select .xcodeproj file and select "Build phases" tab
4. Click on the plus icon and add new run script build phase. A new run script entry should appear at the end of the build phases list
5. Expand newly added run script phase
6. In the script editor, type out the path to script file. E.g. $SRCROOT/BuildScripts/runSwiftlint.sh. $SRCROOT refers to the root directory of the project.

Repeat steps 4, 5 and 6 for other targets from which you want to run the script.

### New feature

Use [GitFlow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow) development workflow with controller tests and documentation included.

### Pull request quality gates

- no conflicts with target branch
- pass Microsoft AppCenter tests (optional at the moment due to very long build time)
- code review approval

## Tools

### Networking with Alamofire
Networking is implemented via [Alamofire](https://github.com/Alamofire/Alamofire) that enables easy parsing of response to ApI Models inside app together with Swift Codable protocol.

### Bond
Simplify ViewController ViewModel binding using [Bond](https://github.com/DeclarativeHub/Bond)

### Quality gates

This project will run static code analyser on every commit.

### Static code analyser
This template us using [SwiftLint](https://github.com/realm/SwiftLint) for static code analysis. All SwiftLint offenses are automatically tracked and prevented on every commit. This feature is handled by [Overcommit](https://github.com/brigade/overcommit) git hook manager.

### Testing
TBD

### Continuous Integration
Microsoft AppCenter

## Maintainers

- [Haris Dizdarevic](https://github.com/haris-dizdarevic), [Zaharije Pasalic](https://github.com/zpasal)
