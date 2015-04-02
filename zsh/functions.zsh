function showhidden {
	defaults write com.apple.finder AppleShowAllFiles YES
	killall Finder
}

function hidehidden {
	defaults write com.apple.finder AppleShowAllFiles NO
	killall Finder
}