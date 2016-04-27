class Tab < Formula
  desc "General-purpose query language for text files"
  homepage "http://tkatchev.bitbucket.org/tab/"
  url "https://bitbucket.org/tkatchev/tab/get/4.0.tar.gz"
  sha256 "be0298eb600ea1394539352724faf8b7230d330dff5c59377d7e6d6d44e62873"

  head "https://bitbucket.org/tkatchev/tab.git"

  fails_with :clang do
    build 703
    cause "error: thread-local storage is unsupported for the current target"
  end

  def install
    system "make"
    bin.install "tab"
  end

  test do
    assert_equal "2\n", pipe_output("#{bin}/tab '1 + 1'")
  end
end
