export CLANG_MODULE_CACHE_PATH="$(pwd)/.build/clang-module-cache"

swift test \
  --disable-sandbox \
  --cache-path .build/cache \
  --config-path .build/config \
  --security-path .build/security \
  --scratch-path .build \
  --manifest-cache local \
  -Xcc -fmodules-cache-path="$CLANG_MODULE_CACHE_PATH"
