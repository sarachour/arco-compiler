#!/bin/bash


./gen.sh > env.sh
clear
echo "### Execute the following:"
echo "------------------------------------"
echo "source env.sh"
echo "------------------------------------"
echo ""
echo "### OR add the following to your .bashrc:"
echo "------------------------------------"
cat env.sh
echo "------------------------------------"