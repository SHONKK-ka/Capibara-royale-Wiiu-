# Capibara Royale - Makefile PLANO (sin carpetas src/)
# Funciona con tu repo como esta en la foto

ifeq ($(strip $(DEVKITPRO)),)
$(error "Please set DEVKITPRO - usa Dockerfile")
endif

TARGET := CapibaraRoyale
BUILD := build
SOURCES := .
INCLUDES := .

CFLAGS := -g -O2 -Wall $(shell $(PORTLIBS)/bin/sdl2-config --cflags 2>/dev/null || echo "")
CXXFLAGS := $(CFLAGS) -std=c++17
LDFLAGS := -g $(shell $(PORTLIBS)/bin/sdl2-config --libs 2>/dev/null || echo "") -lSDL2 -lSDL2_mixer -lSDL2_image -lm

CFILES := $(wildcard *.c)
CPPFILES := $(wildcard *.cpp)
OFILES := $(CPPFILES:.cpp=.o) $(CFILES:.c=.o)

include $(DEVKITPRO)/wut/share/wut_rules
