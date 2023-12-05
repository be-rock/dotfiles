#!/usr/bin/env zsh

function logger() {
    #
    # purpose:
    #   print a message with a date (utc) and log level to stdout
    # usage:
    #   log_msg "custom message here" # <-- default log level is INFO
    #   log_msg "custom message here" ERROR # <-- override default log level to ERROR
    #
    custom_msg=$1
    level="INFO"
    if [ -n "$2" ]; then
        level="$2"
    fi
    full_msg="$(date -u +%Y-%m-%dT%H:%M:%S.%3N%z) | $level | ${custom_msg}"
    echo $full_msg
}

DELTA_VERSION=2.4.0
DEPENDENCIES=(
    io.delta:delta-core_2.12:$DELTA_VERSION
)
VENV_DIR=~/.venv/jupyter

logger "activating python venv $VENV_DIR"
source $VENV_DIR/bin/activate
logger "venv using python version $($(which python) --version)"

export PYSPARK_DRIVER_PYTHON=$(which $(command -v $2)) # ipython | jupyter-lab
export PYSPARK_DRIVER_PYTHON_OPTS="--TerminalInteractiveShell.editing_mode=vi"
export PYSPARK_PYTHON=$(which $(command -v python))
export SPARK_LOCAL_IP="localhost"
export SPARK_HOME="${SPARK_HOME:-$1}"

$SPARK_HOME/bin/$2 \
    --packages $DEPENDENCIES \
    --conf "spark.sql.extensions=io.delta.sql.DeltaSparkSessionExtension" \
    --conf "spark.sql.catalog.spark_catalog=org.apache.spark.sql.delta.catalog.DeltaCatalog" \
    --conf "spark.eventLog.enabled=true" \
    --conf "spark.eventLog.dir=file:///tmp/spark-events" \
    --conf "spark.sql.parquet.compression.codec=snappy" #zstd, lz4, gzip
    #--conf "spark.dynamicAllocation.enabled=true" \
    #--conf "spark.shuffle.service.enabled=true"
