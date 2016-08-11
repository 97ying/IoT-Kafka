#!/bin/sh

# Wait for zookeeper and kafka startup
echo "zookeeper connect string: $ZK_CONNECT"
echo "sleep 30 seconds, wait for zookeeper and kafka startup"
/bin/sleep 30

# Create topic iot-devices-topic
echo "generate iot-devices-topic"
$KAFKA_HOME/bin/kafka-topics.sh --create --zookeeper $ZK_CONNECT --replication-factor 1 --partitions 1 --topic iot-devices-topic
