# source: https://github.com/apache/spark-docker/blob/master/4.0.0/scala2.13-java21-python3-ubuntu/Dockerfile
FROM spark:4.0.0-scala2.13-java21-python3-ubuntu

USER root

RUN set -ex; \
    apt-get update; \
    apt-get install -y python3 python3-pip; \
    rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install --no-cache-dir ipython
    # chown -R spark:spark /home/spark
    #ipython profile create --profile-dir=/opt/spark/work-dir/.ipython && \
    #chown -R spark:spark /opt/spark/work-dir/.ipython && \

# USER spark

ENV PYSPARK_PYTHON=/usr/bin/python3 \
    PYSPARK_DRIVER_PYTHON=ipython \
    PYSPARK_DRIVER_PYTHON_OPTS="--TerminalInteractiveShell.editing_mode='vi' --colors=Linux" \
    SPARK_HOME=/opt/spark \
    PATH=$SPARK_HOME/bin:$PYTHON_PATH:$PATH

CMD ["pyspark"]