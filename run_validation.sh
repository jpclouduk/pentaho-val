# export PDI_HOME=/hsbc/pentaho-fin/client/data-integration

DIR="$( cd "$( dirname "$0" )" && pwd )"

export KETTLE_HOME=$DIR
export PENTAHO_DI_JAVA_OPTIONS="-Xmx2048m -XX:MaxPermSize=256m -DPENTAHO_METASTORE_FOLDER=$DIR"

echo "KETTLE_HOME=$KETTLE_HOME"
echo "PENTAHO_DI_JAVA_OPTIONS=$PENTAHO_DI_JAVA_OPTIONS"

if [ -n "$PDI_HOME" ]; then
  echo "PDI_HOME=$PDI_HOME"
else
  echo "Please define the PDI_HOME variable pointing to Pentaho Data Integration folder."
fi

echo "Executing ETL validation tasks..."

cd $PDI_HOME
./kitchen.sh -file=$KETTLE_HOME/validation_tests.kjb -level=Basic
