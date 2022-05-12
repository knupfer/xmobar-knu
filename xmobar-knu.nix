{ mkDerivation, base, lib, xmobar }:
mkDerivation {
  pname = "xmobar-knu";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base xmobar ];
  license = lib.licenses.mit;
}
