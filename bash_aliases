JANUS_DIR="/tmp/janus"
SRC_DIR_C="/opt/sandbox/janus-ex-streaming/janus-streaming-c/src"

function _link_c_plugin {
  ln -sf "$SRC_DIR_C/janus_streaming.c" "$JANUS_DIR/plugins/janus_streaming.c"
}

function _install_c_plugin {
  cd $JANUS_DIR \
    && make \
    && make install
}

alias link_c_plugin=_link_c_plugin
alias install_c_plugin=_install_c_plugin
