require 'formula'

class Rasterview < Formula
  url 'http://www.easysw.com/~mike/rasterview/rasterview-1.3.tar.gz'
  homepage ''
  md5 '8f615b5ef5e6e512aec25dc745bb330f'

  depends_on 'fltk'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    # system "cmake . #{std_cmake_parameters}"
    system "make install"
  end
end
