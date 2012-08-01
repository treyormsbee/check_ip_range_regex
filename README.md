check_ip_range_regex
====================

perl script for verifying ip ranges matchs in a regular expression,  Useful for apache regular expressions dealing with ip ranges.

example:
./check_ip_regex.pl "10.10.0.0/25" "^10\.10\.0\.((([1-9]|[1-9][0-9])|1[01][0-9])|12[0-8])$"
IP = 10.10.0.0
NET = 25
NUMIPS = 128
REGEX = ^10\.10\.0\.((([1-9]|[1-9][0-9])|1[01][0-9])|12[0-8])$
matches = 128

