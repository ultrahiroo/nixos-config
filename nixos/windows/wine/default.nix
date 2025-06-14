{ pkgs, ... }:
{
  nixpkgs.config.packageOverrides = pkgs: {
    wine64 = pkgs.wine64.override {
      wineRelease = "stable";
      wineBuild = if pkgs.stdenv.hostPlatform.system == "x86_64-linux" then "wineWow" else "wine32";
      gettextSupport = true;
      fontconfigSupport = true;
      alsaSupport = true;
      gtkSupport = true;
      openglSupport = true;
      tlsSupport = true;
      gstreamerSupport = true;
      cupsSupport = true;
      dbusSupport = true;
      openclSupport = true;
      cairoSupport = true;
      odbcSupport = true;
      netapiSupport = true;
      cursesSupport = true;
      vaSupport = true;
      pcapSupport = true;
      v4lSupport = true;
      saneSupport = true;
      gphoto2Support = true;
      krb5Support = true;
      pulseaudioSupport = true;
      udevSupport = true;
      xineramaSupport = true;
      vulkanSupport = true;
      sdlSupport = true;
      usbSupport = true;
      mingwSupport = pkgs.stdenv.hostPlatform.isDarwin;
      waylandSupport = true;
      x11Support = true;
      embedInstallers = true;
    };
  };
  boot.binfmt.registrations."x86_64-windows".interpreter = pkgs.wine64;
  environment.systemPackages =
    (with pkgs; [
      samba
      winetricks
      wine64
    ])
    ++ (with pkgs.wine64Packages; [
      fonts
      stableFull
      waylandFull
      yabridge
    ]);
  environment.sessionVariables = {
    WINE_BIN = "${pkgs.wine64}/bin/wine";
    WINESERVER_BIN = "${pkgs.wine64}/bin/wineserver";
  };
}
