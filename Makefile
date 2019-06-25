install_dependencies:
	gem install cocoapods
	gem install overcommit
	overcommit --install
	overcommit --sign
	overcommit --sign pre-commit
	pod install --repo-update

