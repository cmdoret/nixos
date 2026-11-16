{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "kubectl-encrypted-kubeconfig";
  version = "1.0.2";

  src = fetchFromGitHub {
    owner = "n4-de";
    repo = "kubectl-encrypted-kubeconfig";
    rev = "v${version}";
    # paste on update
    hash = "sha256-oIyqhY60OGpAGfMngRoPUq7WvJ7cHU1GZKHsltNKJAU="; 
  };

  # paste on update, differs from hash
  vendorHash = "sha256-7TAGVVl1bhoniUoVbKshK0W7mafrGoIUNTyh68uitsA=";

  ldflags = let p = "github.com/n4-de/kubectl-encrypted-kubeconfig/cmd"; in [
    "-s" "-w"
    "-X ${p}.version=${version}"
    "-X ${p}.version_name=${pname}"
  ];

  postInstall = ''
      ln -s $out/bin/kubectl-encrypted-kubeconfig $out/bin/kubectl-encrypted_kubeconfig
    '';

  meta = {
    description = "kubectl plugin that decrypts kubeconfig tokens via the system keyring";
    homepage = "https://github.com/n4-de/kubectl-encrypted-kubeconfig";
    license = lib.licenses.asl20;
    mainProgram = pname;
  };
}
