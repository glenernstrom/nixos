{ pkgs, ... }:  
  
{  
  home.packages = with pkgs; [
    pymol
    nucleus
    positron-bin
    rWrapper

  # Python 3.13 + Jupyter environment
    (python313.withPackages (ps: with ps; [
      jupyterlab
      ipython
      numpy
      scipy
      pandas
      matplotlib
    ]))
  ];
}
