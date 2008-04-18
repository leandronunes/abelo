#!/usr/bin/python
import gtk
import gtkmozembed
from subprocess import *


def destroy(self):
    Popen(["/home/smurf/projetos/abelo/lib/pyro_deamon/pyro_server.py", "shutdown"])
    gtk.main_quit()

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

if __name__ == '__main__':
  TinyGecko()
  gtk.main()

