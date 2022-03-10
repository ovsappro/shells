#!/bin/bash
#STRING should b exact, and ~ /STRING/ should be outside {}
awk -F " " '$3 ~ /Sysadmin/ {
print $0;
}' file6

# the above code can be writter with conditionals
awk -F " " '{
if ($3 == "Manager")
	{print $0;
	}
}' file6
