class Dicedb < Formula
  desc "DiceDB engine – fast, reactive, in-memory database"
  homepage "https://github.com/DiceDB/dice"
  url "https://github.com/DiceDB/dice/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "1c613e44c8136d67dec73e92e084d38f39710d286fd1880998960891eb798a02"
  license "BSD-3-Clause"

  depends_on "go@1.24" => :build

  def install
    ENV["GOPROXY"] = "direct"
    ENV["GOSUMDB"] = "off"
    ENV.prepend_path "PATH", Formula["go@1.24"].opt_bin

    system "go", "build", "-o", bin/"dicedb"

    # Ensure VERSION file is co-located with the binary
    cp "VERSION", bin/"VERSION"
  end

  def caveats
    <<~EOS
      The DiceDB engine has been installed as 'dicedb'.

      To start the server:
        ln -s /opt/homebrew/share/dicedb/VERSION ./VERSION
        dicedb

      The server listens on port 7379 by default.

      NOTE: If you see an error about a missing VERSION file,
      set DICEDB_VERSION_PATH:
        export DICEDB_VERSION_PATH=#{opt_pkgshare}/VERSION

      For more info, visit: https://github.com/DiceDB/dice
    EOS
  end

  test do
    assert_match "DiceDB", shell_output("#{bin}/dicedb --help")
  end
end
