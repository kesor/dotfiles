{ pkgs, ... }:

{
  config = {
    home.packages = with pkgs; [

      cascadia-code
      clarity-city
      dejavu_fonts
      fantasque-sans-mono
      fira-sans
      gelasio
      jetbrains-mono
      line-awesome
      maple-mono-autohint
      mona-sans
      noto-fonts
      noto-fonts-emoji
      open-sans
      quicksand
      symbola
      terminus_font
      terminus_font_ttf
      ttf_bitstream_vera
      ttf-indic
      ubuntu-sans
      ubuntu-sans-mono

      fira-code-nerdfont
      inconsolata-nerdfont
      inter-nerdfont
      terminus-nerdfont
    ];
  };
}

# ii  fonts-droid-fallback                       1:6.0.1r16-1.1build1                            all          handheld device font with extensive style and language support (fallback)
# ii  fonts-font-awesome                         5.0.10+really4.7.0~dfsg-4.1                     all          iconic font designed for use with Twitter Bootstrap
# ii  fonts-freefont-ttf                         20120503-10build1                               all          Freefont Serif, Sans and Mono Truetype fonts
# ii  fonts-lato                                 2.0-2.1                                         all          sans-serif typeface family font
# ii  fonts-liberation                           1:1.07.4-11                                     all          Fonts with the same metrics as Times, Arial and Courier
# ii  fonts-liberation2                          2.1.5-1                                         all          Fonts with the same metrics as Times, Arial and Courier (v2)
# ii  fonts-lmodern                              2.004.5-6.1                                     all          OpenType fonts based on Computer Modern
# ii  fonts-mathjax                              2.7.9+dfsg-1                                    all          JavaScript display engine for LaTeX and MathML (fonts)
# ii  fonts-opensymbol                           4:102.12+LibO24.2.6-0ubuntu0.24.04.1~bpo22.04.1 all          OpenSymbol TrueType font
# ii  fonts-povray                               1:3.7.0.10-1                                    all          Persistence of vision raytracer (3D renderer) fonts
# ii  fonts-unifont                              1:14.0.01-1                                     all          TrueType version of GNU Unifont
# ii  fonts-urw-base35                           20200910-1                                      all          font set metric-compatible with the 35 PostScript Level 2 Base Fonts
# ii  fonts-wine                                 6.0.3~repack-1                                  all          Windows API implementation - fonts
# ii  fonts-xfree86-nonfree                      4.2.1-8                                         all          non-free TrueType fonts from XFree86
