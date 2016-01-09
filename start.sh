
echo "Configuring spamassassin"

service rsyslog restart

perl -pi -e 's/ENABLED=0/ENABLED=1/g' /etc/default/spamassassin

rm /etc/mail/spamassassin/local.cf

cat << EOF >> /etc/mail/spamassassin/local.cf
rewrite_subject 1
required_hits 5
EOF

/etc/init.d/spamassassin start

echo "fix host bug"
perl -pi -e 's/127.0.0.1/0.0.0.0/g' /usr/lib/node_modules/mailin/lib/mailin.js

echo "========================================================================"
echo " The mailin server is runing:"
echo ""
echo " port: $SERVER_PORT  webhook: $WEBHOOK  "
echo ""
echo " Gook luck!"
echo "========================================================================"


sudo mailin --port $SERVER_PORT --webhook $WEBHOOK 