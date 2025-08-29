    # Formula for installing the GitID CLI tool
    class Gitid < Formula
      desc "Git Identity Manager to easily switch between Git identities"
      homepage "https://github.com/Kir-Push/GitID"
      url "https://github.com/Kir-Push/GitID/archive/refs/tags/v0.1.0.tar.gz" 
      sha256 "ae27e95d5ff23650e6afe6c667510a77e8222357374292086814d4f2a7ab8a7f"
      license "MIT" # Or the license you are using

      depends_on "go" => :build

      def install
        system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/gitid"
      end

      test do
        # This is a basic test to ensure the binary was installed correctly.
        assert_match "GitID is a lightweight CLI tool", shell_output("#{bin}/gitid --help")
      end
    end