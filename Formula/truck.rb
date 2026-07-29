class Truck < Formula
  desc "Rename multiple files based on rule file"
  homepage "https://github.com/muniere/truck"
  url "https://github.com/muniere/truck.git",
      tag:      "1.0.0",
      revision: "98ef51c78ce09f5033be345e60d20ba46bf822cf",
      using:    :git
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.VERSION=#{version}"
    system "go", "build", *std_go_args(ldflags:), "."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/truck --version")
  end
end
