#!/usr/bin/python
import Pyro.core
import Pyro.naming
import ConfigParser
from stoqdrivers.serialbase import *
from stoqdrivers.printers.fiscal import *
from stoqdrivers.exceptions import * #FIXME Remove this 
import threading
import sys
from stoqdrivers.enum import UnitType #PaymentMethodType, TaxType, 


class PrinterConfiguration:
  _brand = ''
  _model = ''
  _port = ''

  def __init__(self, filename):
    config = ConfigParser.ConfigParser()
    config.readfp(open(filename))
    self._brand = config.get('PRINTER', 'brand')
    self._model = config.get('PRINTER', 'model')
    self._port = config.get('PRINTER', 'port')

  def brand(self):
    return self._brand

  def model(self):
    return self._model

  def port(self):
    return self._port

printer_conf = PrinterConfiguration('/home/smurf/projetos/abelo/lib/fiscal_printer/config')


class Printer(Pyro.core.ObjBase):
#  count  = 0
  _device = ''

  """ Initialization of device """
  def __init__(self, conf):
    Pyro.core.ObjBase.__init__(self)
    self._device = FiscalPrinter(conf.brand(), conf.model(), conf.port())

  def open(self):
    self._device.open()

  def cancel(self):
    self._device.cancel()

  def cancel_item(self, item_id):
    self._device.cancel_item(item_id)

  def close(self):
    self._device.close()

  def get_serial(self):
    return self._device.get_serial()

  def totalize(self):
    self._device.totalize()

  def printer_id(self):
    self._device.printer_id()

  def summarize(self):
    print 'summarize'
#    self.count = self.count + 1
#    if self.count == 1:
#      raise PendingReduceZ
    self._device.summarize()

  def till_add_cash(self, value):
    value = Decimal(value)
    self._device.till_add_cash(value)

  def till_remove_cash(self, value):
    value = abs(Decimal(value))
    self._device.till_remove_cash(value)

  def close_till(self, is_today):
    #FIXME see if the previous day it's usefull
    if is_today == 'false':
      is_previous_day = False
    else:
      is_previous_day = True
#    print 'pqpqpqpqpqpq'
    self._device.close_till()


  def add_item(self, code, description, price, taxcode, quantity, unit, discount, surcharge, unit_desc):
    quantity = Decimal(quantity)
    unit = UnitType.CUSTOM
    price = Decimal(price)
    discount = Decimal(discount)
    surcharge = Decimal(surcharge)
    self._device.add_item(code, description, price, taxcode,
                          quantity, unit, discount, surcharge,
                          unit_desc)

  def add_payment(self, payment_method, value, description = ''):
    value = Decimal(value)
    print payment_method
    print value
    print description
    self._device.add_payment(payment_method, value, description)


if len(sys.argv) == 2 and sys.argv[1] == 'shutdown':
  ns=Pyro.naming.NameServerLocator().getNS()
  ns._shutdown()
else:
  #Init Pyro
  timeout = 10
  Pyro.core.initServer(0)
  Pyro.core.initClient(0)

  # Start Name Server
  ns_host = 'localhost'
  ns_port = 9090
  name_server_starter = Pyro.naming.NameServerStarter()
  name_server_thread = threading.Thread(target = name_server_starter.start, args = (ns_host, ns_port))
  name_server_thread.setDaemon(True)
  name_server_thread.start()
  name_server_starter.waitUntilStarted(timeout) 

  # Locate Name Server
  ns=Pyro.naming.NameServerLocator().getNS()

  # Init Deamon
  daemon=Pyro.core.Daemon()
  daemon.useNameServer(ns)
  uri=daemon.connect(Printer(printer_conf),"abelo_printer")
  daemon.requestLoop()

