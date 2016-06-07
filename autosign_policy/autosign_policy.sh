#! /bin/bash
#
# This software will check a Puppet CSR for custom attributes
#   If present, returns success (0)
#   else returns another code
#
# There is a single argument passed in - the Subject CN (certname) of the CSR
# The CSR is to be read in by stdin
#   this will be encoded in .pem format
#
# Written by James Forrest - 07/06/2016

#get certificate name as argument
certname=$1

#String to check for
certstring="TooManySecrets"

# dump stdin to $cert variable.
cert=$(cat)

#extract the request from the PEM
certreq=$(cat $cert | openssl req -noout -text)

#kludgy but works
if [ "${certreq/$certstring}" = "${certreq}" ]
then
    return 1
else
    return 0
fi



