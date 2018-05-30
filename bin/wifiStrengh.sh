#!/bin/sh
iwconfig $1 | grep Quality | cut -d = -f2 | cut -d \  -f1
