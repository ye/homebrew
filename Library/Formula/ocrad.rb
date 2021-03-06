require 'formula'

class Ocrad < Formula
  homepage 'http://www.gnu.org/software/ocrad/'
  url 'http://ftpmirror.gnu.org/ocrad/ocrad-0.22.tar.lz'
  mirror 'http://ftp.gnu.org/gnu/ocrad/ocrad-0.22.tar.lz'
  sha1 'cfb3284b9d7387af80bcd795c093624eb40f6d13'

  def patches
    # Patch to compile with libc++ in Mavericks. Reported to list:
    # http://lists.gnu.org/archive/html/bug-ocrad/2013-11/msg00000.html
    "https://gist.github.com/mcs07/7751030/raw/dd3ea738fc9e83adc7b1532a0b2e714e3542c54f/ocrad-mavericks.diff"
  end

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install", "CXXFLAGS=#{ENV.cxxflags}"
  end

  test do
    system "#{bin}/ocrad", "-h"
  end
end
