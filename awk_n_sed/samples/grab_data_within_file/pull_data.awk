# pull group name and disbursement mid and descriptor from data file
# for only Affinion groups


# this doesn't really pull meaningful data because there are lots of spaces
# in the data text, but it shows how it can be done.  There's better ways
# to use regular expressions to pull what you want...which could be investigated.
{
    if ($2 == "AFFINION")
    {
        print $4 " " $8 " " $9;
    }
}

