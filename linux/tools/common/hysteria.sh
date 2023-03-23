#!/bin/bash

sysctl -w net.core.rmem_max=16777216
sysctl -w net.core.wmem_max=16777216
