#!/bin/bash

scripts/drop.tables.pl
scripts/create.tables.pl

time scripts/populate.sqlite.tables.pl
