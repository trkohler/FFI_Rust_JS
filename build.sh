#!/bin/bash

WABT_BIN=/usr/local/Cellar/wabt/1.0.19_1/bin
BINARYEN_BIN=/usr/local/Cellar/binaryen/98/bin
TARGET=wasm32-unknown-unknown
NAME=hello_raw
BINARY=./target/$TARGET/release/$NAME.wasm

cargo build --target $TARGET --release
$WABT_BIN/wasm-strip $BINARY
# mkdir -p www
$BINARYEN_BIN/wasm-opt -o www/$NAME.wasm -Oz $BINARY