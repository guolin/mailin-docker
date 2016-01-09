echo "========================================================================"
echo " The mailin server is runing:"
echo ""
echo " port: $SERVER_PORT webhook: $WEBHOOK  "
echo ""
echo " Gook luck!"
echo "========================================================================"
which mailin


sudo mailin --port $SERVER_PORT --webhook $WEBHOOK 