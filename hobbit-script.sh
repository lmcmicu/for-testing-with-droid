#!/usr/bin/env bash

echo "Content-Type: text/html"
echo "Status: 200"
echo


if [[ $REQUEST_METHOD == "POST" ]]
then
    echo "Reading ${CONTENT_LENGTH} bytes ..."
    message=$(read -r -n${CONTENT_LENGTH})
    echo "Thanks for posting with \"${message}\""
elif [[ $REQUEST_METHOD == "GET" ]]
then
    echo "Thanks for getting with \"${QUERY_STRING}\""
fi

#while IFS= read -r line; do
#  printf '%s\n' $(urlencode -d $line)
#done
