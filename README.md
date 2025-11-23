# autossh plugin for homeassistant.

It can be useful if you have a linux server on the internet which you can access via ssh. This way you run autossh -R8123:localhost:8123 user@server.com and then you can connect to the server with ssh -L8123:localhost:8123 user@server.com to open homeassistant in web-browser with http://localhost:8123.

The addon should generate an ssh keypair and you can expoort the public key to add to /home/user/.ssh/authorized_keys
