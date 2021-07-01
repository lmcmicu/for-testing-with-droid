#!/usr/bin/env python3

import cgi, cgitb
import os, sys, time

from urllib.parse import unquote_plus

cgitb.enable()

time.sleep(1)

print("Content-Type: text/html")    # HTML is following
print("Status: 200")
print()                             # blank line, end of headers

print("<H4>About this Server</H4>")
print("<HR><PRE>")
print("Server Name:      {}".format(os.environ.get('SERVER_NAME')))
print("Running on Port:  {}".format(os.environ.get('SERVER_PORT')))
print("Server Software:  {}".format(os.environ.get('SERVER_SOFTWARE')))
print()
print()
print("Schmerver Schmotocol:  {}".format(os.environ.get('SERVER_PROTOCOL')))
print()
print("HTTP Accept:     {}".format(os.environ.get('HTTP_ACCEPT')))
print()
print()
print()
print()
print()
print("CGI Revision:     {}".format(os.environ.get('GATEWAY_INTERFACE')))
print("<HR></PRE>")

input_data = cgi.FieldStorage()



if os.environ.get('REQUEST_METHOD') == "GET":
  print("Thanks for sending a GET to me, an elf, with '{}'".format([input_data[key] for key in input_data.keys()]))
else:
  print("You sent a {} to me, an elf, with (among other things) '{}'\n".format(os.environ.get('REQUEST_METHOD'),
                                                                               input_data['cgi-input-py'].value))

# print('''
# <form action="hobbit-script.py" method="POST">
#   <p>Share Goofle Sheet with submitter:</p>
#   <input type="hidden" name="action" value="share">
#   <input type="submit" value="Submit">
# </form>
# ''')

print('''
<p>
  <form action="./hobbit-script.py" method="POST" enctype="multipart/form-data">
    <label for="myfile">Select a file:</label>
    <input type="file" id="myfile" name="myfile">
    <input type="submit" value="Submit">
  </form>
</p>
''')


sys.exit(0)
