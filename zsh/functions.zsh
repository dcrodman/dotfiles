function shidden() {
	defaults write com.apple.finder AppleShowAllFiles YES
	killall Finder
}

function hhidden() {
	defaults write com.apple.finder AppleShowAllFiles NO
	killall Finder
}