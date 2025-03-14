{lib,config,...}:

{
  programs.nixvim = {
    plugins.nvim-jdtls ={
    enable= true;
    data = "${config.home.homeDirectory}/.cache/jdtls/workspace";
    };
  }; 
  home.activation.createJdtlsWorkspace = lib.hm.dag.entryAfter ["writeBoundary"] ''
    mkdir -p "${config.home.homeDirectory}/.cache/jdtls/workspace"
    echo "JDTLS workspace directory: ${config.home.homeDirectory}/.cache/jdtls/workspace"
  '';
}
