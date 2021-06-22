#!/bin/bash -ex

export PATH=$(pwd)/depot_tools:$PATH

GN_ARGS=$(tr "\n" ' ' <<-EOF
is_component_build=false
is_debug=false
target_cpu="x64"
use_custom_libcxx=false
v8_monolithic=true
v8_use_external_startup_data=false
symbol_level=0
exclude_unwind_tables=true
EOF
)

cd v8/v8

gn gen out.gn/release --args="$GN_ARGS"
ninja -C out.gn/release v8_monolith
