# Install Go
cd ~/
# Define the download URL for the latest stable Go version for Linux AMD64
DOWNLOAD_URL="https://go.dev/$(curl -s https://go.dev/dl/ | grep -o -m 1 'dl/go[0-9.]*.linux-amd64.tar.gz')"
echo $DOWNLOAD_URL

# Extract the version number from the download URL
VERSION=$(echo "$DOWNLOAD_URL" | grep -o -m 1 'go[0-9.]*.linux-amd64.tar.gz' | cut -c 3- | rev | cut -c 20- | rev)
echo $VERSION
echo "go$VERSION.linux-amd64.tar.gz"

# Download the Go package
wget "$DOWNLOAD_URL"

# Install Go
# need to add checking for existing go directory
# and removing first if it exists
sudo tar -C /usr/local -xzf go$VERSION.linux-amd64.tar.gz
rm go$VERSION.linux-amd64.tar.gz

# Set Go environment variables
echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.profile
echo "export GOPATH=\$HOME/go" >> ~/.profile
source ~/.profile

# Verify the installation
go version
