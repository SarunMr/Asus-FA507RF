{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [
      { plugin = sensible; }
      { plugin = yank; }
      { plugin = resurrect; }
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '10'
        '';
      }
      {
        plugin = tokyo-night-tmux;
        extraConfig = ''
          set -g @tokyo-night-tmux_theme storm    # storm | day | default to 'night'
          set -g @tokyo-night-tmux_transparent 1
          set -g @tokyo-night-tmux_time_format 12H
        '';
      }
      { plugin = vim-tmux-navigator; }
    ];
    prefix = "C-a";
    baseIndex = 1;
    escapeTime = 10;
    historyLimit = 90000;
    terminal = "screen-256color";
    extraConfig = ''

      #Use default-shell like bash in my case
      set-option -g default-shell /run/current-system/sw/bin/bash
      set-option -g default-command /run/current-system/sw/bin/bash

      #Able to use mouse 
      set -g mouse on

      #Pane Navigation <prefix> q to show index-numbers
      setw -g pane-base-index 1
      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      # Vim-like window splitting
      unbind %
      bind-key | split-window -h -c "#{pane_current_path}"
      unbind '"'
      bind-key - split-window -v -c "#{pane_current_path}"

      # Create new window with current directory
      bind c new-window -c "#{pane_current_path}"

      # Resize panes with Prefix H,J,K,L
      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5

      # Copy mode using 'v' to begin selection like Vim
      bind-key -T copy-mode-vi v send -X begin-selection
      bind-key -T copy-mode-vi y send -X copy-pipe-and-cancel "${pkgs.wl-clipboard}/bin/wl-copy"
    '';
  };
}
