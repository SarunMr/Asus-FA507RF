{ lib, config, ... }:

{
  programs.nixvim = {
    plugins.jdtls = {
      enable = true;
      settings.cmd = [
        "jdtls"
        "-data"
        "${config.home.homeDirectory}/.cache/jdtls/workspace"
      ];
    };
  };
  home.activation.createJdtlsWorkspace =
    lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      mkdir -p "${config.home.homeDirectory}/.cache/jdtls/workspace"
      echo "JDTLS workspace directory: ${config.home.homeDirectory}/.cache/jdtls/workspace"
    '';
}
