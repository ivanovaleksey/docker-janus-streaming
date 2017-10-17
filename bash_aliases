JANUS_DIR="/opt/janus"
JANUS_PLUGIN_DIR="$JANUS_DIR/lib/janus/plugins"
SRC_DIR="/opt/sandbox/janus-ex-echotest/janus-echotest"

function _link_c_plugin {
  ln -sf "$JANUS_PLUGIN_DIR/libjanus_echotest.so.0.0.0" "$JANUS_PLUGIN_DIR/libjanus_echotest.so"
}
function _link_rust_plugin {
  ln -sf "$SRC_DIR/target/debug/libjanus_echotest.so" "$JANUS_PLUGIN_DIR/libjanus_echotest.so"
}

alias link_c_plugin=_link_c_plugin
alias link_rust_plugin=_link_rust_plugin
