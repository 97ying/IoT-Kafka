#!/bin/sh

# Set the zookeeper connect string
zk_connect="localhost:2181"
if [ ! -z "$ZK_CONNECT" ]; then
    zk_connect=$ZK_CONNECT
fi
echo "zookeeper connect string: $zk_connect"

# Set the topic to be created
kafka_topic="iot-devices-topic"
if [ ! -z "$KAFKA_TOPIC" ]; then
    kafka_topic=$KAFKA_TOPIC
fi
echo "kafka topic: $kafka_topic"

# Wait for zookeeper and kafka startup
echo "sleep 10 seconds, wait for zookeeper and kafka startup"
/bin/sleep 10

# Create topic
echo "generate topic: $kafka_topic"
response=$(bin/kafka-topics.sh --create --zookeeper $ZK_CONNECT --replication-factor 1 --partitions 1 --topic $kafka_topic)

if [[ $response == *"already exists"* ]] || [[ $response == *"Created topic"* ]]
then
  exit 0;
fi
