{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.xrandr;

  innocnFp  = "00ffffffffffff0025e32f900000000022200104b53c22783bf639ac4f47a425104f51356b80d1c0b300a9c08180714f81c08140a940565e00a0a0a029503020350055502100001a000000fd003090a0a03c010a202020202020000000fc0032374731520a20202020202020000000ff003030303030303030303030303001d002032bf14c3f010203040590111213141f23090707830100006d1a000002113090000000000000e305e3019ee00078a0a032501040350055502100001af27f8078703823403020350081494100001ef5bd00a0a0a032502040450055502100001e6138001851a066502028550055502100001e000000000000000000000000b3";
  encoderFp = "00ffffffffffff0010aca4a0000000002219010380351e78e67e75a755529c270f5054a54b00714f8180a9c0a940d1c0010101010101023a801871382d40582c45000f282100001e000000ff00344357583735384b4443594c0a000000fc0044454c4c205532343134480a20000000fd00384c1e5311000a202020202020013502031fc14c9005040302071601141f1213230907078301000065030c001000023a801871382d40582c45000f282100001e011d8018711c1620582c25000f282100009e011d007251d01e206e2855000f282100001e8c0ad08a20e02d10103e96000f282100001800000000000000000000000000000000000000000000000067";

  encoderConfig = {
    enable = true;
    rotate = "normal";
    mode = "1920x1080";
    position = "5120x0";
  };

  innocnConfig = {
    enable = true;
    rotate = "normal";
    mode = "2560x1440";
    rate = "144.00";
    dpi = 109;
  };
  dp0Config = innocnConfig // {
    position = "2560x1440";
  };
  dp2Config = innocnConfig // {
    position = "0x1440";
  };
  dp3Config = innocnConfig // {
    position = "0x0";
    rotate = "inverted";
  };
  dp4Config = innocnConfig // {
    position = "2560x0";
    rotate = "inverted";
  };

  encoderProfile = {
    fingerprint = {
      "DisplayPort-0" = innocnFp;
      "DisplayPort-2" = innocnFp;
      "DisplayPort-3" = innocnFp;
      "DisplayPort-4" = innocnFp;
      "HDMI-A-1" = encoderFp;
    };
    config = {
      "DisplayPort-0" = dp0Config;
      "DisplayPort-2" = dp2Config;
      "DisplayPort-3" = dp3Config;
      "DisplayPort-4" = dp4Config;
      "HDMI-A-1" = encoderConfig;
    };
  };

  defaultProfile = {
    fingerprint = {
      "DisplayPort-0" = innocnFp;
      "DisplayPort-2" = innocnFp;
      "DisplayPort-3" = innocnFp;
      "DisplayPort-4" = innocnFp;
      "HDMI-A-1" = encoderFp;
    };
    config = {
      "DisplayPort-0" = dp0Config;
      "DisplayPort-2" = dp2Config;
      "DisplayPort-3" = dp3Config;
      "DisplayPort-4" = dp4Config;
    };
  };

in {
  options = {
    xrandr.enable = mkEnableOption "xrandr"; 
  };

  config = mkIf cfg.enable {
    services.autorandr.enable = true;
    programs.autorandr = {
      enable = true;
      profiles.default = defaultProfile;
      profiles.encoder = encoderProfile;
    };
    home.packages = [
      pkgs.xorg.xrandr
    ];
  };
}
