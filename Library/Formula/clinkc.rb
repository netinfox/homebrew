require 'formula'

class Clinkc <Formula
  url 'https://clinkc.svn.sourceforge.net/svnroot/clinkc/trunk'
  homepage ''
  md5 ''
  version 'trunk'

  # depends_on 'cmake'

  def install
    system "./bootstrap"
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    # system "cmake . #{std_cmake_parameters}"
    system "make install"
  end
end
