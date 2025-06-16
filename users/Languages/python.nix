{ pkgs, ... }: {
  home.packages = with pkgs;
    [
      (python313.withPackages (p:
        with p; [
          pandas
          scipy
          matplotlib
          numpy
          seaborn
          django
          # tensorflow
          # pytorch typically needs special handling
        ]))
    ];
}
