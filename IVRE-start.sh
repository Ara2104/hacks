# Start Mongo DB
service mongodb start

# Bind localhost to -p8888
# Go go http://127.0.0.1:8888
ivre httpd --bind-address 127.0.0.1 --port 8888

