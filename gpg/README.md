# Instructions

# Generate GPG Key
1. `gpg --gen-key`

# Update Signing Key for Git
1. `gpg --list-secret-keys --keyid-format LONG`
2. `git config --global user.signingkey {key}`

# Uplaod GPG Key to Github
1. `gpg --armor --export {key} | pbcopy`

