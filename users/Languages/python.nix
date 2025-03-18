{ pkgs, ... }: {
  home.packages = with pkgs;
    [
      # Instead of python3Full, use python311 with withPackages
      (python311.withPackages (p:
        with p; [
          pandas
          scipy
          matplotlib
          numpy
          seaborn
          django
          tensorflow
          # pytorch typically needs special handling
        ]))

      # If pytorch is needed, add it separately
      # pytorch
    ];
}
