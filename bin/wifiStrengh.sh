#!/bin/sh

iwconfig wlp3s0 | grep Quality | cut -d = -f2 | cut -d \  -f1
