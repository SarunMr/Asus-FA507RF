{ ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      command_timeout = 500;
      continuation_prompt = "[∙](bright-black) ";

      # Format structure:
      # ┌─ Username@Host in Directory
      # ├─ Git, Status, Version Info, Battery
      # └─ Prompt Symbol
      # Modify format to include a proper newline and connecting line
      format = ''
        [┌─](bold green)$username@$hostname in $directory(bold green)$git_branch$git_status$cmd_duration$fill$time $battery
        [╰─](bold green)$character'';

      # Remove right_format since we're now including time in the main format
      scan_timeout = 30;
      fill = { symbol = " "; };
      # Username
      username = {
        format = "[$user]($style)";
        style_user = "bold red";
        style_root = "bold red";
        show_always = true;
      };
      # Hostname
      hostname = {
        format = "[$hostname]($style)";
        style = "bold dimmed red";
        trim_at = "-";
        ssh_only = false;
        disabled = false;
      };
      # Add fill module to push time to the right

      # Directory
      directory = {
        truncation_length = 3;
        truncate_to_repo = true;
        truncation_symbol = "…/";
        style = "bold blue";
      };

      # Git Branch
      git_branch = {
        symbol = "";
        style = "bold green";
      };

      git_status = {
        conflicted = "🏳";
        ahead = "🏎💨";
        behind = "😰";
        diverged = "😵";
        up_to_date = "✓";
        untracked = "🤷";
        stashed = "📦";
        modified = "📝";
        staged = "[++($count)](green)";
        renamed = "👅";
        deleted = "🗑";
      };

      # Battery
      battery = {
        full_symbol = "󰁹 "; # Full battery
        charging_symbol = "󰂄 "; # Charging
        discharging_symbol = "󰂀 "; # Discharging
        disabled = false;
        display = [
          {
            threshold = 15;
            style = "bold red";
          } # Low battery
          {
            threshold = 50;
            style = "bold yellow";
          } # Medium battery
          {
            threshold = 80;
            style = "bold green";
          } # High battery
        ];
      };
      # Time
      time = {
        format = " 🕙 $time($style)";
        time_format = "%I:%M %p";
        style = "bright-white";
        disabled = false;
      };

      cmd_duration = {
        min_time = 1;
        format = " took [$duration]($style)";
        disabled = false;
      };
      # Language Icons
      python = {
        symbol = "";
        style = "bold yellow";
      };
      # Symbols & Language Icons
      aws = { symbol = " "; };
      conda = { symbol = " "; };
      dart = { symbol = " "; };
      docker_context = {
        symbol = " ";
        style = "bold blue";
      };
      elixir = { symbol = " "; };
      elm = { symbol = " "; };
      golang = { symbol = " "; };
      haskell = { symbol = "λ "; };
      java = { symbol = " "; };
      julia = { symbol = " "; };
      memory_usage = { symbol = " "; };
      nim = { symbol = " "; };
      nix_shell = {
        symbol = " ";
        style = "bold blue";
      };
      nodejs = { format = "via [ Node.js $version](bold green) "; };
      package = { symbol = " "; };
      perl = { symbol = " "; };
      php = { symbol = " "; };
      ruby = { symbol = " "; };
      rust = { symbol = " "; };
      scala = { symbol = " "; };
      shlvl = { symbol = " "; };
      swift = { symbol = "ﯣ "; };
      # Night Owl Palette
      palettes = {
        night_owl = {
          blue = "#82AAFF";
          green = "#C3E88D";
          red = "#F07178";
          yellow = "#FFCB6B";
          orange = "#F78C6C";
          purple = "#C792EA";
          cyan = "#89DDFF";
          white = "#D6DEEB";
        };
      };

      # Add palette reference to use the defined palette
      palette = "night_owl";

      # Command prompt symbol
      character = {
        success_symbol = "[❯](bold green) ";
        error_symbol = "[❯](bold red) ";
      };
    };
  };
}
