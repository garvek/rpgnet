#!/bin/bash
sudo docker-compose --env-file .env.local $@
exit $?