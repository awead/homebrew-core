class Advancemame < Formula
  desc "MAME with advanced video support"
  homepage "http://www.advancemame.it/"
  url "https://github.com/amadvance/advancemame/releases/download/v3.5/advancemame-3.5.tar.gz"
  sha256 "779b3b43e3fbdf4bb24e97c418499cd4550446494e19f5d576827242b0821814"

  bottle do
    sha256 "8b7b3f32468dfe574ed50d3de41f80b7e0082e872e598bced0ce0886800dfcd5" => :sierra
    sha256 "0f4ca16ef965fdd5f87b2cc3865041e0cea0b18662b98012d076a752e66ebd0d" => :el_capitan
    sha256 "7a00857e5e1381e5e2f1792e24c838d6588c9b0c70fa96c04cf7379ab169b13b" => :yosemite
  end

  depends_on "sdl"
  depends_on "freetype"

  conflicts_with "advancemenu", :because => "both install `advmenu` binaries"

  def install
    ENV.delete "SDKROOT" if MacOS.version == :yosemite
    system "./configure", "--prefix=#{prefix}"
    system "make", "install", "LDFLAGS=#{ENV.ldflags}", "mandir=#{man}", "docdir=#{doc}"
  end

  test do
    system "#{bin}/advmame", "--version"
  end
end
