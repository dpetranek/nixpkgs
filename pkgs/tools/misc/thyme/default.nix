{ stdenv, fetchgit, go, buildGoPackage, wmctrl, xdpyinfo, xwininfo }:

buildGoPackage rec {
  name = "thyme-${version}";
  version = "0.2.2";
  
  goPackagePath = "github.com/sourcegraph/thyme"; 

  src = fetchgit  {
    url = "https://github.com/sourcegraph/thyme";
    rev = "7244c955e412a7cc693f5261904f69adf6d1cb9c";
    sha256 = "0ns81g6dal092zbr5sw28ivbl3pdsq36j2k4pn5f0aghil0a42li";
  };

  buildInputs = [ go wmctrl xdpyinfo xwininfo ];

  goDeps = ./deps.json;

  meta = with stdenv.lib; {
    homepage = https://github.com/sourcegraph/thyme;
    description = "Automatically track which applications you use and for how long";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
