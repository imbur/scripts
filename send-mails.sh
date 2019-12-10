#!/bin/bash

# Set USER and PASS credentials
. email-credentials.txt

while IFS='' read -r line || [[ -n "$line" ]]; do

	NAME=`echo $line | cut -d' ' -f1`
	MAIL_ADDRESS=`echo $line | cut -d' ' -f2`

	echo "Sending e-mail for $NAME to $MAIL_ADDRESS"
	swaks --to $MAIL_ADDRESS --body emailcontent.txt --from "e@mail.com" --h-From: '"Marton Bur" <e@mail.com>' --server smtp.server.url:port --auth LOGIN --auth-user "$USER" --auth-password "$PASS" -tls --header "Subject:Hello World Subject" --attach myattachment.txt 1>>/dev/null 2>>/dev/null

done < "$1"

echo "All e-mails sent."
