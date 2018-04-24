#!/usr/bin/env sh

#./butler push "${GAME_NAME}-html5.zip" "${ITCH_IO_USER}/${GAME_NAME}:html5"
#./butler push "${GAME_NAME}-linux.zip" "${ITCH_IO_USER}/${GAME_NAME}:linux"
./butler push "${GAME_NAME}-mac.zip" "${ITCH_IO_USER}/${GAME_NAME}:osx"
./gjpush -t $GAMEJOLT_API_TOKEN -g $GAMEJOLT_GAME_ID -p $GAMEJOLT_PACKAGE -r 0.1.2 "${GAME_NAME}-mac.zip"
#./butler push "${GAME_NAME}-windows.zip" "${ITCH_IO_USER}/${GAME_NAME}:windows"
