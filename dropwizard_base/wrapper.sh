#!/bin/bash

java -Ddw.http.port=$PORT0 -Ddw.http.adminPort=$PORT1 -jar app.jar server config.yml
