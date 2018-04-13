#!/usr/bin/env sh

./butler push "${GAME_NAME}-html5.zip" "${ITCH_IO_USER}/${GAME_NAME}:html5"
./butler push "${GAME_NAME}-linux.zip" "${ITCH_IO_USER}/${GAME_NAME}:linux"
./butler push "${GAME_NAME}-mac.zip" "${ITCH_IO_USER}/${GAME_NAME}:osx"
./butler push "${GAME_NAME}-windows.zip" "${ITCH_IO_USER}/${GAME_NAME}:windows"
