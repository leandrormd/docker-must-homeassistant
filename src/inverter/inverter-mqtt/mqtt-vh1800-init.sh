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
            \"unique_id\": \""$MQTT_DEVICENAME"_$1\",
            \"unit_of_measurement\": \"$2\",
            \"state_topic\": \"$MQTT_TOPIC/sensor/"$MQTT_DEVICENAME"_$1\",
            \"icon\": \"mdi:$3\",
            \"device_class\": \"$4\",
            \"state_class\": \"$5\"
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

registerTopic   "WorkStateNo"                              ""                 "state-machine"                ""                   ""                  
registerTopic   "AcVoltageGrade"                           "V"                "current-ac"                   "voltage"            "measurement"       
registerTopic   "RatedPower"                               "VA"               "lightbulb-outline"            "apparent_power"     "measurement"       
registerTopic   "BatteryVoltage"                           "V"                "current-dc"                   "voltage"            "measurement"       
registerTopic   "InverterVoltage"                          "V"                "current-ac"                   "voltage"            "measurement"       
registerTopic   "GridVoltage"                              "V"                "current-ac"                   "voltage"            "measurement"       
registerTopic   "BusVoltage"                               "V"                "cog-transfer-outline"         "voltage"            "measurement"       
registerTopic   "ControlCurrent"                           "A"                "current-ac"                   "current"            "measurement"       
registerTopic   "InverterCurrent"                          "A"                "current-ac"                   "current"            "measurement"       
registerTopic   "GridCurrent"                              "A"                "current-ac"                   "current"            "measurement"       
registerTopic   "LoadCurrent"                              "A"                "current-ac"                   "current"            "measurement"       
registerTopic   "PInverter"                                "W"                "cog-transfer-outline"         "power"              "measurement"       
registerTopic   "PGrid"                                    "W"                "transmission-tower"           "power"              "measurement"       
registerTopic   "PLoad"                                    "W"                "lightbulb-on-outline"         "power"              "measurement"       
registerTopic   "LoadPercent"                              "%"                "progress-download"            "power_factor"       "measurement"       
registerTopic   "SInverter"                                "VA"               "cog-transfer-outline"         "apparent_power"     "measurement"       
registerTopic   "SGrid"                                    "VA"               "transmission-tower"           "apparent_power"     "measurement"       
registerTopic   "SLoad"                                    "VA"               "lightbulb-on-outline"         "apparent_power"     "measurement"       
registerTopic   "QInverter"                                "VA"               "cog-transfer-outline"         "apparent_power"     "measurement"       
registerTopic   "QGrid"                                    "VA"               "transmission-tower"           "apparent_power"     "measurement"       
registerTopic   "QLoad"                                    "VA"               "lightbulb-on-outline"         "apparent_power"     "measurement"       
registerTopic   "InverterFrequency"                        "Hz"               "sine-wave"                    "frequency"          "measurement"       
registerTopic   "GridFrequency"                            "Hz"               "sine-wave"                    "frequency"          "measurement"       
registerTopic   "InverterMaxNumber"                        ""                 "format-list-numbered"         ""                   ""                  
registerTopic   "CombineType"                              ""                 "format-list-bulleted-type"    ""                   ""                  
registerTopic   "InverterNumber"                           ""                 "format-list-numbered"         ""                   ""                  
registerTopic   "AcRadiatorTemp"                           "ºC"               "thermometer"                  "temperature"        "measurement"       
registerTopic   "TransformerTemp"                          "ºC"               "thermometer"                  "temperature"        "measurement"       
registerTopic   "DcRadiatorTemp"                           "ºC"               "thermometer"                  "temperature"        "measurement"       
registerTopic   "InverterRelayStateNo"                     ""                 "electric-switch"              ""                   ""                  
registerTopic   "GridRelayStateNo"                         ""                 "electric-switch"              ""                   ""                  
registerTopic   "LoadRelayStateNo"                         ""                 "electric-switch"              ""                   ""                  
registerTopic   "NLineRelayStateNo"                        ""                 "electric-switch"              ""                   ""                  
registerTopic   "DcRelayStateNo"                           ""                 "electric-switch"              ""                   ""                  
registerTopic   "EarthRelayStateNo"                        ""                 "electric-switch"              ""                   ""                  
registerTopic   "Error1"                                   ""                 "alert-circle-outline"         ""                   ""                  
registerTopic   "Error2"                                   ""                 "alert-circle-outline"         ""                   ""                  
registerTopic   "Error3"                                   ""                 "alert-circle-outline"         ""                   ""                  
registerTopic   "Warning1"                                 ""                 "alert-outline"                ""                   ""                  
registerTopic   "Warning2"                                 ""                 "alert-outline"                ""                   ""                  
registerTopic   "BattPower"                                "W"                "car-battery"                  "power"              "measurement"       
registerTopic   "BattCurrent"                              "A"                "current-dc"                   "current"            "measurement"       
registerTopic   "BattVoltageGrade"                         "V"                "current-dc"                   "voltage"            "measurement"       
registerTopic   "RatedPowerW"                              "W"                "certificate"                  "power"              "measurement"       
registerTopic   "CommunicationProtocalEdition"             ""                 "barcode"                      ""                   ""                  
registerTopic   "ArrowFlag"                                ""                 "state-machine"                ""                   ""                  
registerTopic   "ChrWorkstateNo"                           ""                 "state-machine"                ""                   ""                  
registerTopic   "MpptStateNo"                              ""                 "electric-switch"              ""                   ""                  
registerTopic   "ChargingStateNo"                          ""                 "electric-switch"              ""                   ""                  
registerTopic   "PvVoltage"                                "V"                "current-dc"                   "voltage"            "measurement"       
registerTopic   "ChrBatteryVoltage"                        "V"                "current-dc"                   "voltage"            "measurement"       
registerTopic   "ChargerCurrent"                           "A"                "current-dc"                   "current"            "measurement"       
registerTopic   "ChargerPower"                             "W"                "car-turbopower"               "power"              "measurement"       
registerTopic   "RadiatorTemp"                             "ºC"               "thermometer"                  "temperature"        "measurement"       
registerTopic   "ExternalTemp"                             "ºC"               "thermometer"                  "temperature"        "measurement"       
registerTopic   "BatteryRelayNo"                           ""                 "electric-switch"              ""                   ""                  
registerTopic   "PvRelayNo"                                ""                 "electric-switch"              ""                   ""                  
registerTopic   "ChrError1"                                ""                 "alert-circle-outline"         ""                   ""                  
registerTopic   "ChrWarning1"                              ""                 "alert-outline"                ""                   ""                  
registerTopic   "BattVolGrade"                             "V"                "current-dc"                   "voltage"            "measurement"       
registerTopic   "RatedCurrent"                             "A"                "current-dc"                   "current"            "measurement"       
registerTopic   "AccumulatedDay"                           "day"              "calendar-day"                 ""                   ""                  
registerTopic   "AccumulatedHour"                          "hour"             "clock-outline"                ""                   ""                  
registerTopic   "AccumulatedMinute"                        "min"              "timer-outline"                ""                   ""                  

# Register composite topics manually for now

registerTopic   "BatteryPercent"                             "%"       "battery"                          "battery"      "measurement"

registerTopic   "AccumulatedChargerPower"                    "kWh"     "chart-bell-curve-cumulative"      "energy"       "total_increasing"
registerTopic   "AccumulatedDischargerPower"                 "kWh"     "chart-bell-curve-cumulative"      "energy"       "total_increasing"
registerTopic   "AccumulatedBuyPower"                        "kWh"     "chart-bell-curve-cumulative"      "energy"       "total_increasing"
registerTopic   "AccumulatedSellPower"                       "kWh"     "chart-bell-curve-cumulative"      "energy"       "total_increasing"
registerTopic   "AccumulatedLoadPower"                       "kWh"     "chart-bell-curve-cumulative"      "energy"       "total_increasing"
registerTopic   "AccumulatedSelfusePower"                    "kWh"     "chart-bell-curve-cumulative"      "energy"       "total_increasing"
registerTopic   "AccumulatedPvsellPower"                     "kWh"     "chart-bell-curve-cumulative"      "energy"       "total_increasing"
registerTopic   "AccumulatedGridChargerPower"                "kWh"     "chart-bell-curve-cumulative"      "energy"       "total_increasing"
registerTopic   "AccumulatedPvPower"                         "kWh"     "chart-bell-curve-cumulative"      "energy"       "total_increasing"

# Register topic for push commands
registerInverterRawCMD
