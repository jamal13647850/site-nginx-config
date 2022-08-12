echo "please enter your the domain name:(eg: example)"
read domainName

echo "please enter your the top level domain (TLD):(eg: com)"
read TLD

sudo find . -type f | xargs sed -i  's/example/'$domainName'/g'
sudo find . -type f | xargs sed -i  's/'$domainName.com'/'$domainName.$TLD'/g'
sudo mv -f examplehelper ${domainName}helper
sudo mv example.com-http $domainName.$TLD-http
sudo mv example.com-https $domainName.$TLD-https