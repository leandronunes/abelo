#!/usr/bin/python
import gtk
import gtkmozembed
from subprocess import *


def destroy(self):
    Popen(["/home/smurf/projetos/abelo/lib/pyro_deamon/pyro_server.py", "shutdown"])
    gtk.main_quit()

#def save_uri(self, uri, data=''):
#    link = self.get_link_message()
#    self.get_location()
#    print 'leandro'
#    print uri
#    if link:
#        u = opener.open(link)
#        h = u.info()
#        print h
##      print h.getheader('content-type')
#        f = open('testing_file', 'w+')
#        f.write(string.join(u.readlines(), ''))
#    return False

class TinyGecko:
    def __init__(self):
        self.moz = gtkmozembed.MozEmbed()
        win = gtk.Window()
        win.set_title('Abelo')
        win.set_position(gtk.WIN_POS_CENTER)
        win.connect('destroy', destroy)
        win.add(self.moz)
        win.show_all()
        b = self.moz.load_url('http://localhost:3000')
        self.moz.set_size_request(800,600)
        Popen(["/home/smurf/projetos/abelo/lib/pyro_deamon/pyro_server.py"])
#        self.moz.connect('open-uri', save_uri)

if __name__ == '__main__':
  TinyGecko()
  gtk.main()

