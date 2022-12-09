{ dockerTools, chord }:

dockerTools.buildImage {
  name = "chord-docker";
  tag = "Jun22";
  contents = [ chord ];
  config = {
    Cmd = [ "${chord}/bin/chord" ];
    WorkingDir = "/data";
    Volumes = { "/data" = { }; };
  };
}
