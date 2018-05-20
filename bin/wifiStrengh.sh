#!/bin/sh

iwconfig wlx00c0ca967db2 | grep Quality | cut -d = -f2 | cut -d \  -f1
