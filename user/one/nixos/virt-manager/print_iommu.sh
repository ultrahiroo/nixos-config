#!/bin/sh
lspci -nn | grep -iE '(nvidia|amd)'
