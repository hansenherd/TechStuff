#!/bin/bash
#
# Used to generate API files for code generated Servs
#
#


#=======================================================
# before running, set these variables appropriately
package='sdp'                     # schema
object='SdpProductionRequest'     # generated object name
keyType='Integer'                 # e.g. Integer/Long

#=======================================================
# set to desired directory where files should be generated
fileDir="/home/steveh/src/amp-common/trunk/amp/java-extra"


#=======================================================
# Script
#
#
resource="${object,}"            # same as $object but with the first letter lowercase
baseServPackage="ad.${package}"
baseApiPackage="ad.api.${package}"
destFile="${fileDir}/${object}Api.java"

#echo $baseServPackage
#echo $baseApiPackage
#echo $destFile
#echo ""
#echo ""
echo "/**" > $destFile
echo " * Copyright Access Development. All rights reserved." >> $destFile
echo " */" >> $destFile
echo "package ${baseApiPackage};" >> $destFile
echo "" >> $destFile
echo "import ad.api.GenericAmpApi;" >> $destFile
echo "import ${baseServPackage}.${object};" >> $destFile
echo "import ${baseServPackage}.${object}Serv;" >> $destFile
echo "" >> $destFile
echo "" >> $destFile
echo "/**" >> $destFile
echo " * The data access interface for ???." >> $destFile
echo " */" >> $destFile
echo "public interface ${object}Api" >> $destFile
echo "    extends  GenericAmpApi<${object}Serv, ${object}, ${keyType}>" >> $destFile
echo "{" >> $destFile
echo "}" >> $destFile


cat $destFile
echo ""
echo ""
destFile="${fileDir}/${object}ApiImpl.java"

echo "/**" > $destFile
echo " * Copyright Access Development. All rights reserved." >> $destFile
echo " */" >> $destFile
echo "package ${baseApiPackage}.impl;" >> $destFile
echo "" >> $destFile
echo "import javax.annotation.Resource;" >> $destFile
echo "import org.springframework.stereotype.Service;" >> $destFile
echo "import ad.api.impl.GenericAmpApiImpl;" >> $destFile
echo "import ${baseApiPackage}.${object}Api;" >> $destFile
echo "import ${baseServPackage}.${object};" >> $destFile
echo "import ${baseServPackage}.${object}Serv;" >> $destFile
echo "" >> $destFile
echo "/**" >> $destFile
echo " *" >> $destFile
echo " */" >> $destFile
echo "@Service(\"${resource}Api\")" >> $destFile
echo "public class ${object}ApiImpl" >> $destFile
echo "    extends GenericAmpApiImpl<${object}Serv, ${object}, ${keyType}> " >> $destFile
echo "    implements ${object}Api" >> $destFile
echo "{" >> $destFile
echo "    private ${object}Serv ${resource}Serv;" >> $destFile
echo "" >> $destFile
echo "    @Resource(name=\"${resource}Serv\")" >> $destFile
echo "    public final void setServ( final ${object}Serv serv )" >> $destFile
echo "    {" >> $destFile
echo "        super.genericService = serv;" >> $destFile
echo "        ${resource}Serv = serv;" >> $destFile
echo "    }" >> $destFile
echo "}" >> $destFile

cat $destFile
