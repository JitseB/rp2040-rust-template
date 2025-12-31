#!/bin/bash

# JMB 31Dec2025
# No need to enter passphase if the SSH key is installed
# which can be authorized by running "ssh-copy-id rpzero"
# RTT setup, sector found by running the following in the project dir:
# rust-nm -S target/thumbv6m-none-eabi/debug/myapp | grep SEGGER_RTT
ssh -t rpzero \
    -L 3333:localhost:3333 \
    -L 9090:localhost:9090 \
    'bash -l -c "openocd -f interface/raspberrypi-swd.cfg -f target/rp2040.cfg -c \"init\" -c \"rtt setup 0x20000008 0x30\" -c \"rtt server start 9090 0\" -c \"rtt start\""'
