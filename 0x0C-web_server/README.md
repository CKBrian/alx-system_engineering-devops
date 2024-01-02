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
```sh
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

## Contribution Guidelines

This project is an individual assignment and not open for external contributions. It is for educational purposes only, and all work should be completed individually as part of the assignment requirements.

## Licence

This project is for educational purposes and does not require a specific license. It is intended for use as part of an assignment and learning activity and is not open for external distribution or contributions.

