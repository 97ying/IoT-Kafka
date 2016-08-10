#!/bin/sh
# Create topic iot-devices-topic
echo "sleep 30 seconds, wait for zookeeper and kafka startup" > create-topic.log
/bin/sleep 30
echo "generate iot-devices-topic" >> create-topic.log
$KAFKA_HOME/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic iot-devices-topic
