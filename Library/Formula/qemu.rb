require 'formula'

class Qemu < Formula
  url 'http://wiki.qemu.org/download/qemu-0.15.0.tar.gz'
  homepage 'http://www.qemu.org/'
  md5 'dbc55b014bcd21b98e347f6a90f7fb6d'

  depends_on 'jpeg'
  depends_on 'gnutls'

  fails_with_llvm "Segmentation faults occur at run-time with LLVM"

  def patches
    DATA
  end

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--disable-darwin-user",
                          "--enable-cocoa",
                          "--disable-bsd-user",
                          "--disable-guest-agent"
    system "make install"
  end
end

__END__
--- a/net/tap-bsd.c  2011-08-09 02:28:42.000000000 +0800
+++ b/net/tap-bsd.c  2011-12-24 07:23:13.000000000 +0800
@@ -43,7 +43,7 @@
     char *dev;
     struct stat s;

-#if defined(__FreeBSD__) || defined(__FreeBSD_kernel__) || defined(__OpenBSD__)
+#if defined(__FreeBSD__) || defined(__FreeBSD_kernel__) || defined(__OpenBSD__) || defined(__APPLE__)
     /* if no ifname is given, always start the search from tap0/tun0. */
     int i;
     char dname[100];
