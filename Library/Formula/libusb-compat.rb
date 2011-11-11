require 'formula'

class LibusbCompat < Formula
  url 'http://downloads.sourceforge.net/project/libusb/libusb-compat-0.1/libusb-compat-0.1.3/libusb-compat-0.1.3.tar.bz2'
  homepage 'http://www.libusb.org/'
  md5 '570ac2ea085b80d1f74ddc7c6a93c0eb'

  depends_on 'pkg-config' => :build
  depends_on 'libusb'

  def options
    [["--universal", "Build a universal binary."]]
  end

  def install
    ENV.universal_binary if ARGV.build_universal?
    system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
    system "make install"
  end
end
