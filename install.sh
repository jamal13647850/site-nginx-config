chmod +x ./examplehelper/cloudflare-ip-sync.sh
./nginx/helpers/cloudflare-ip-sync.sh

chmod +x ./examplehelper/arvancloud-ip-sync.sh
./nginx/helpers/arvancloud-ip-sync.sh

echo "please enter your the domain name:(eg: example)"
read domainName

echo "please enter your the top level domain (TLD):(eg: com)"
read TLD

sudo find . -type f | xargs sed -i  's/example/'$domainName'/g'
sudo find . -type f | xargs sed -i  's/'$domainName.com'/'$domainName.$TLD'/g'
sudo mv -f examplehelper ${domainName}helper
sudo mv example.com-http $domainName.$TLD-http
sudo mv example.com-https $domainName.$TLD-https


#ADD CloudFlare And Uptimerobot And Arvacloud to white list:

echoTitle 13 16 'ADD CloudFlare And Uptimerobot to white list'

for i in `curl https://www.cloudflare.com/ips-v4`; do sudo csf -a $i; done

for i in `curl https://www.cloudflare.com/ips-v4`; do sudo echo $i >> /etc/csf/csf.ignore; done

for i in `curl https://www.arvancloud.com/fa/ips.txt`; do sudo csf -a $i; done

for i in `curl https://www.arvancloud.com/fa/ips.txt`; do sudo echo $i >> /etc/csf/csf.ignore; done

curl -s https://uptimerobot.com/inc/files/ips/IPv4andIPv6.txt | while read i; do sudo csf -a $i; done

sudo csf -r