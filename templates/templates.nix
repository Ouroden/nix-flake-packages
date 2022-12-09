rec {
  article = {
    path = ./article;
    description = ''
      A template for an article repository
    '';
  };

  flake = {
    path = ./flake;
    description = ''
      A template to use as a flake starting point
    '';
  };

  default = flake;
}
