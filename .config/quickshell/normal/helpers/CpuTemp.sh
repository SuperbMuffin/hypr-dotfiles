#!/bin/bash
sensors | awk '/k10temp-pci/ {flag=1} flag && /Tctl:/ {print $2; exit}' | sed 's/+//'
