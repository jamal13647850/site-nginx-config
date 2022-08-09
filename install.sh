echo "please enter your the domain name:(eg: example)"
read domainName

echo "please enter your the top level domain (TLD):(eg: com)"
read TLD

find . -type f | xargs sed -i  's/example/'$domainName'/g'
find . -type f | xargs sed -i  's/'$domainName.com'/'$domainName.$TLD'/g'
mv -f examplehelper {$domainName}helpers
mv example.com-http $domainName.$TLD-http
mv example.com-https $domainName.$TLD-https