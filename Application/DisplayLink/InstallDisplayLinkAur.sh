#!/bin/sh

pamac build displaylink
sudo systemctl enable displaylink.service
