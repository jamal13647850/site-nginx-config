echo "please enter your the domain name:(eg: example)"
read domainName

echo "please enter your the top level domain (TLD):(eg: com)"
read TLD

find . -type f | xargs sed -i  's/example/'$domainName'/g'
find . -type f | xargs sed -i  's/'$domainName.com'/'$domainName.$TLD'/g'