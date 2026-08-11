 {config, pkgs, ... }:

  {
    home.packages = with pkgs; [
      obs-studio
      gnome-podcasts
      newsflash
      cozy
      foliate
      parabolic
      shortwave
      kooha
      shotcut
      gradia

     # Multimedia framework
      gst_all_1.gstreamer
      gst_all_1.gstreamermm
      gst_all_1.gst-libav
      gst_all_1.gst-plugins-bad
      gst_all_1.gst-plugins-good
      gst_all_1.gst-plugins-ugly
      gst_all_1.gst-rtsp-server

    ];
  }
