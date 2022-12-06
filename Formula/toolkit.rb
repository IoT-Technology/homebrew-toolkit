# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Toolkit < Formula
  desc "Toolkit is a IoT protocol client CLI for IoT developer and learners. CoAP and MQTT protocol are currently supported. It supports colors, autocompletion, internationalization(chinese, english and german…) and multi-platforms"
  homepage "https://github.com/IoT-Technology/IoT-Toolkit"
  url "https://github.com/IoT-Technology/IoT-Toolkit/releases/download/0.5.0/toolkit-0.5.0-osx-x86_64.zip"
  sha256 "501b99d338b43568306a714773d529ae9be7bc4892970f25ced6ea58dd11f291"
  license "Apache-2.0"
  version "0.5.0"

  # depends_on "cmake" => :build

  def install
    bash_completion.install "completion/toolkit_completion" => "toolkit"
    zsh_completion.install "completion/zsh/_toolkit" => "_toolkit"

    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/toolkit"
  end

  test do
    output = shell_output("#{bin}/toolkit --version")
    assert_match "toolkit/0.5.0", output
  end
end
