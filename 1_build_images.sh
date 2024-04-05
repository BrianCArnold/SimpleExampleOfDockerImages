#!/usr/bin/env bash
docker build --target frontend -t frontend .
docker build --target backend -t backend .
