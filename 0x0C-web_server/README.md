# Web_server

A web server stores website component files and web server software. It receives HTTP requests, finds the requested document, and sends it back to the browser. The main aim of this project is to fammiliarize on the main roles of a web server, server child processes, DNS and HTTP requests.

## Tasks

0. Transfer a file to your server
1. Install nginx web server
2. Setup a domain name
3. Redirection
4. Not found page 404

## Usage

examples
```bash
 sylvain@ubuntu$ ./0-transfer_file
Usage: 0-transfer_file PATH_TO_FILE IP USERNAME PATH_TO_SSH_KEY
sylvain@ubuntu$
sylvain@ubuntu$ ssh ubuntu@8.8.8.8 -i /vagrant/sylvain 'ls ~/'
afile
sylvain@ubuntu$ 
sylvain@ubuntu$ touch some_page.html
sylvain@ubuntu$ ./0-transfer_file some_page.html 8.8.8.8 sylvain /vagrant/private_key
some_page.html                                     100%   12     0.1KB/s   00:00
sylvain@ubuntu$ ssh ubuntu@8.8.8.8 -i /vagrant/private_key 'ls ~/'
afile
some_page.html
sylvain@ubuntu$
```

## Licences

