#
# Copyright Access Development. All rights reserved.
#

{
    if ( NR == 1)
    {
        i = 0;
        while( i++ < NF )
        {
            gsub(/[ \t]+$/,"",$i);
            gsub(/^[ \t]+/,"",$i);
            gsub(/^"+/,"",$i);
            gsub(/"+$/,"",$i);
            if ( "ORGANIZATIONCUSTOMERIDENTIFIER" == toupper($i) )
            {
                ocidColumnNumber = i;
            }
            else
            {
                if ( "PROGRAMCUSTOMERIDENTIFIER" == toupper($i) )
                {
                    pcidColumnNumber = i;
                }
                else
                {
                    if ( "PRODUCTIDENTIFIER" == toupper($i) )
                    {
                        pidColumnNumber = i;
                    }
                }
            }
        }
    }
    else
    {
        
        # trim pcid
        gsub(/[ \t]+$/,"",$pcidColumnNumber);
        gsub(/^[ \t]+/,"",$pcidColumnNumber);
        
        # trim ocid
        gsub(/[ \t]+$/,"",$ocidColumnNumber);
        gsub(/^[ \t]+/,"",$ocidColumnNumber);
        
        # trim pid
        gsub(/[ \t]+$/,"",$pidColumnNumber);
        gsub(/^[ \t]+/,"",$pidColumnNumber);

        stat[ toupper($ocidColumnNumber) "," toupper($pcidColumnNumber) "," $pidColumnNumber]++;
    }
}
END {
    for ( x in stat )
    {
        print x "=" stat[x];
    }
}

