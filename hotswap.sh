foo=$1
if grep -o $1: /etc/nginx/nginx.conf
then echo "no need to change"
exit 1
fi
sed -i '/.*6379;$/c \   server '$foo':6379;' /etc/nginx/nginx.conf
/usr/sbin/nginx -s reload