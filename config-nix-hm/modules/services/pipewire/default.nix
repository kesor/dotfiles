{ pkgs, ... }:
{
  config = {
    # services.dbus.packages = with pkgs; [
    #   pipewire
    #   wireplumber
    # ];
    home.packages = with pkgs; [
      calf
      coppwr # gui for pipewire
      gst_all_1.gst-plugins-base
      gst_all_1.gst-plugins-good
      gst_all_1.gstreamer
      helvum # pw patch bay
      libcamera
      lsp-plugins
      pa-notify # volume notifications
      pasystray
      pavucontrol
      pipecontrol # pw control gui
      pipewire
      pipewire.jack
      pw-viz # pw graph editor
      pw-volume # volume controls
      pwvucontrol # volume control
      qjackctl
      qpwgraph
      sink-rotate # rotate default audio sink
      sonusmix # pw routing
      wireplumber
    ];
  };
}
