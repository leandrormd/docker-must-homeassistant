#!/bin/bash
#
# Simple script to register the MQTT topics when the container starts for the first time...

MQTT_SERVER=`cat /app/mqtt.json | jq '.server' -r`
MQTT_PORT=`cat /app/mqtt.json | jq '.port' -r`
MQTT_TOPIC=`cat /app/mqtt.json | jq '.topic' -r`
MQTT_DEVICENAME=`cat /app/mqtt.json | jq '.devicename' -r`
MQTT_USERNAME=`cat /app/mqtt.json | jq '.username' -r`
MQTT_PASSWORD=`cat /app/mqtt.json | jq '.password' -r`

registerTopic () {
    mosquitto_pub \
        -h $MQTT_SERVER \
        -p $MQTT_PORT \
        -u "$MQTT_USERNAME" \
        -P "$MQTT_PASSWORD" \
        -t "$MQTT_TOPIC/sensor/"$MQTT_DEVICENAME"_$1/config" \
        -m "{
            \"name\": \""$MQTT_DEVICENAME"_$1\",
            \"unit_of_measurement\": \"$2\",
            \"state_topic\": \"$MQTT_TOPIC/sensor/"$MQTT_DEVICENAME"_$1\",
            \"icon\": \"mdi:$3\"
        }"
}

registerInverterRawCMD () {
    mosquitto_pub \
        -h $MQTT_SERVER \
        -p $MQTT_PORT \
        -u "$MQTT_USERNAME" \
        -P "$MQTT_PASSWORD" \
        -t "$MQTT_TOPIC/sensor/$MQTT_DEVICENAME/config" \
        -m "{
            \"name\": \""$MQTT_DEVICENAME"\",
            \"state_topic\": \"$MQTT_TOPIC/sensor/$MQTT_DEVICENAME\"
        }"
}

registerTopic   "WorkStateNo"                              ""        "state-machine"
registerTopic   "AcVoltageGrade"                           "V"       "current-ac"
registerTopic   "RatedPower"                               "VA"      "lightbulb-outline"
registerTopic   "BatteryVoltage"                           "V"       "current-dc"
registerTopic   "InverterVoltage"                          "V"       "current-ac"
registerTopic   "GridVoltage"                              "V"       "current-ac"
registerTopic   "BusVoltage"                               "V"       "cog-transfer-outline"
registerTopic   "ControlCurrent"                           "A"       "current-ac"
registerTopic   "InverterCurrent"                          "A"       "current-ac"
registerTopic   "GridCurrent"                              "A"       "current-ac"
registerTopic   "LoadCurrent"                              "A"       "current-ac"
registerTopic   "PInverter"                                "W"       "cog-transfer-outline"
registerTopic   "PGrid"                                    "W"       "transmission-tower"
registerTopic   "PLoad"                                    "W"       "lightbulb-on-outline"
registerTopic   "LoadPercent"                              "%"       "progress-download"
registerTopic   "SInverter"                                "VA"      "cog-transfer-outline"
registerTopic   "SGrid"                                    "VA"      "transmission-tower"
registerTopic   "SLoad"                                    "VA"      "lightbulb-on-outline"
registerTopic   "QInverter"                                "VA"      "cog-transfer-outline"
registerTopic   "QGrid"                                    "VA"      "transmission-tower"
registerTopic   "QLoad"                                    "VA"      "lightbulb-on-outline"
registerTopic   "InverterFrequency"                        "Hz"      "sine-wave"
registerTopic   "GridFrequency"                            "Hz"      "sine-wave"
registerTopic   "InverterMaxNumber"                        ""        "format-list-numbered"
registerTopic   "CombineType"                              ""        "format-list-bulleted-type"
registerTopic   "InverterNumber"                           ""        "format-list-numbered"
registerTopic   "AcRadiatorTemp"                           "ºC"      "thermometer"
registerTopic   "TransformerTemp"                          "ºC"      "thermometer"
registerTopic   "DcRadiatorTemp"                           "ºC"      "thermometer"
registerTopic   "InverterRelayStateNo"                     ""        "electric-switch"
registerTopic   "GridRelayStateNo"                         ""        "electric-switch"
registerTopic   "LoadRelayStateNo"                         ""        "electric-switch"
registerTopic   "NLineRelayStateNo"                        ""        "electric-switch"
registerTopic   "DcRelayStateNo"                           ""        "electric-switch"
registerTopic   "EarthRelayStateNo"                        ""        "electric-switch"
registerTopic   "Error1"                                   ""        "alert-circle-outline"
registerTopic   "Error2"                                   ""        "alert-circle-outline"
registerTopic   "Error3"                                   ""        "alert-circle-outline"
registerTopic   "Warning1"                                 ""        "alert-outline"
registerTopic   "Warning2"                                 ""        "alert-outline"
registerTopic   "BattPower"                                "W"       "car-battery"
registerTopic   "BattCurrent"                              "A"       "current-dc"
registerTopic   "BattVoltageGrade"                         "V"       "current-dc"
registerTopic   "RatedPowerW"                              "W"       "certificate"
registerTopic   "CommunicationProtocalEdition"             ""        "barcode"
registerTopic   "ArrowFlag"                                ""        "state-machine"
registerTopic   "ChrWorkstateNo"                           ""        "state-machine"
registerTopic   "MpptStateNo"                              ""        "electric-switch"
registerTopic   "ChargingStateNo"                          ""        "electric-switch"
registerTopic   "PvVoltage"                                "V"       "current-dc"
registerTopic   "ChrBatteryVoltage"                        "V"       "current-dc"
registerTopic   "ChargerCurrent"                           "A"       "current-dc"
registerTopic   "ChargerPower"                             "W"       "car-turbopower"
registerTopic   "RadiatorTemp"                             "ºC"      "thermometer"
registerTopic   "ExternalTemp"                             "ºC"      "thermometer"
registerTopic   "BatteryRelayNo"                           ""        "electric-switch"
registerTopic   "PvRelayNo"                                ""        "electric-switch"
registerTopic   "ChrError1"                                ""        "alert-circle-outline"
registerTopic   "ChrWarning1"                              ""        "alert-outline"
registerTopic   "BattVolGrade"                             "V"       "current-dc"
registerTopic   "RatedCurrent"                             "A"       "current-dc"
registerTopic   "AccumulatedDay"                           "day"     "calendar-day"
registerTopic   "AccumulatedHour"                          "hour"    "clock-outline"
registerTopic   "AccumulatedMinute"                        "min"     "timer-outline"

# Register composite topics manually for now

registerTopic "BatteryPercent"                             "%"       "battery"

registerTopic "AccumulatedChargerPower"                    "kWh"     "chart-bell-curve-cumulative"
registerTopic "AccumulatedDischargerPower"                 "kWh"     "chart-bell-curve-cumulative"
registerTopic "AccumulatedBuyPower"                        "kWh"     "chart-bell-curve-cumulative"
registerTopic "AccumulatedSellPower"                       "kWh"     "chart-bell-curve-cumulative"
registerTopic "AccumulatedLoadPower"                       "kWh"     "chart-bell-curve-cumulative"
registerTopic "AccumulatedSelfusePower"                    "kWh"     "chart-bell-curve-cumulative"
registerTopic "AccumulatedPvsellPower"                     "kWh"     "chart-bell-curve-cumulative"
registerTopic "AccumulatedGridChargerPower"                "kWh"     "chart-bell-curve-cumulative"
registerTopic "AccumulatedPvPower"                         "kWh"     "chart-bell-curve-cumulative"

# Register topic for push commands
registerInverterRawCMD
