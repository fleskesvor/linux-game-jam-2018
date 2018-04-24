#!/usr/bin/env sh

# Note: Since GameJolt release tags use semver, replace $TRAVIS_TAG with a valid version if not built from a Git tag.

./gjpush -t $GAMEJOLT_API_TOKEN -g $GAMEJOLT_GAME_ID -p $GAMEJOLT_PACKAGE -r $TRAVIS_TAG -b "${GAME_NAME}-html5.zip"
./gjpush -t $GAMEJOLT_API_TOKEN -g $GAMEJOLT_GAME_ID -p $GAMEJOLT_PACKAGE -r $TRAVIS_TAG "${GAME_NAME}-linux.zip"
./gjpush -t $GAMEJOLT_API_TOKEN -g $GAMEJOLT_GAME_ID -p $GAMEJOLT_PACKAGE -r $TRAVIS_TAG "${GAME_NAME}-mac.zip"
./gjpush -t $GAMEJOLT_API_TOKEN -g $GAMEJOLT_GAME_ID -p $GAMEJOLT_PACKAGE -r $TRAVIS_TAG "${GAME_NAME}-windows.zip"
