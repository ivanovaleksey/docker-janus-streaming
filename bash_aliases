JANUS_DIR="/tmp/janus"
SRC_DIR_C="/opt/sandbox/janus-ex-streaming/janus-streaming-c"
SRC_DIR_RS="/opt/sandbox/janus-ex-streaming/janus-streaming-rs"

function _link_c_plugin {
  if [ ! -f "$JANUS_DIR/plugins/janus_streaming.c.bk" ]; then
    cp "$JANUS_DIR/plugins/janus_streaming.c" "$JANUS_DIR/plugins/janus_streaming.c.bk"
  fi

  ln -sf "$SRC_DIR_C/src/janus_streaming.c" "$JANUS_DIR/plugins/janus_streaming.c"
}

function _unlink_c_plugin {
  ln -sf "$JANUS_DIR/plugins/janus_streaming.c.bk" "$JANUS_DIR/plugins/janus_streaming.c"
}

function _install_c_plugin {
  cd $JANUS_DIR \
    && make \
    && make install
}

function _link_rust_plugin {
  ln -sf "$SRC_DIR_RS/target/debug/libjanus_streaming_rs.so" "/opt/janus/lib/janus/plugins/libjanus_streaming.so"
}

alias link_c_plugin=_link_c_plugin
alias unlink_c_plugin=_unlink_c_plugin
alias install_c_plugin=_install_c_plugin
alias link_rust_plugin=_link_rust_plugin
