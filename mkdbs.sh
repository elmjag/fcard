#!/bin/sh

rm simple.db
cat simple.sql | sqlite3 simple.db

rm uk.db
cat uk.sql | sqlite3 uk.db  
