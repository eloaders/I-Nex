#!/usr/bin/make -f
# -*- mode: makefile-gmake; coding: utf-8 -*-

PN                       ::= i-nex
APP_NAME                 ::= $(PN)
ARCH                     ::= $(shell uname -m)
CC                        ?= gcc
CFLAGS                    ?= -g -Wall
COMPRESS                 ::= gzip -9
DOCSDIR                  ::= /share/doc/i-nex
GBA                      ::= gba3
GBC                      ::= /usr/bin/gbc3
GBCOPTS                  ::= -eagtpm
INSTALL_D                ::= install -d
INSTALL_M                ::= install -m
INSTALL_DM               ::= install -Dm
LSB_CS                   ::= $(shell lsb_release -cs)
MANDIR                   ::= /share/man/man1
MKDIR_P                  ::= mkdir -p
PREFIX                    ?= /usr
PWD                      ::= $(shell pwd)
RM                       ::= rm -f
RMDIR_OPT                ::= -R
STATIC                   ::= true
UDEV_RULES_DIR           ::= /usr/lib/udev/rules.d

bindir                   ::= $(PREFIX)/bin
sysconfdir               ::= /etc

ifeq ($(ARCH),x86)
	additional_confflags ::= --disable-sse2
endif
ifeq ($(ARCH),x86_64)
	additional_confflags ::= -O2
endif

NO_COLOR                 ::= \033[0m
OK_COLOR                 ::= \033[32m
ERROR_COLOR              ::= \033[91m
WARN_COLOR               ::= \033[93m
ACTION_COLOR             ::= \033[95m
OK_BGCOLOR               ::= \033[1;32m
OK_STRING                ::= $(OK_COLOR)✔$(NO_COLOR)
ERROR_STRING             ::= $(ERROR_COLOR)✖$(NO_COLOR)
WARN_STRING              ::= $(WARN_COLOR)⚑$(NO_COLOR)

DATABASE_CPU_LOGOS_DIR   ::= ../Database/Logos
DATABASE_CPU_LOGOS       ::= $(wildcard $(DATABASE_CPU_LOGOS_DIR)/*.gif)
DATABASE_DIST_LOGOS_DIR  ::= ../Database/Distlogos
DATABASE_DIST_LOGOS      ::= $(wildcard $(DATABASE_DIST_LOGOS_DIR)/*.png)
DATABASE_CPU_JSON_DIR    ::= ../Database
DATABASE_CPU_JSON        ::= $(wildcard $(DATABASE_CPU_JSON_DIR)/*.json)
DATABASE_I2C_JSON_DIR    ::= ../Database/i2c
DATABASE_I2C_JSON        ::= $(wildcard $(DATABASE_I2C_JSON_DIR)/*.json)
DATABASE_SIV_DIR         ::= ../SIV
DATABASE_SIV             ::= $(wildcard $(DATABASE_SIV_DIR)/*.txt)
