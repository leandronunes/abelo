#! /usr/bin/env python
import sys
import ConfigParser
from stoqdrivers.devices.serialbase import *
from stoqdrivers.exceptions import *
from stoqdrivers.devices.printers.fiscal import *

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

COMMAND_OK =  1

dict = {
  OutofPaperError: 100,  
  PrinterOfflineError: 101,
  AlmostOutofPaper: 102,
  HardwareFailure: 103,
  PendingReduceZ: 104,
  PendingReadX: 105, 
  CloseCouponError: 106,
  CouponNotOpenError: 107,
  CouponOpenError: 108, 
  AuthenticationFailure: 109,
  CommandParametersError: 110,
  CommandError: 111, 
  ClosedTillError: 112,
  ReduceZError: 113,
  ReadXError: 114,
  CouponTotalizeError: 115,
  PaymentAdditionError: 116,
  CancelItemError: 117,
  InvalidState: 118,
  CapabilityError: 119,
  ItemAdditionError: 120,
  InvalidReply: 121,
  AlreadyTotalized: 122,
  InvalidValue: 123,
  TypeError: 200,
  ValueError: 201,
  DriverError: 202,
}

class Printer:
  _device = ''

  """ Initialization of device """
  def __init__(self, conf):
    self._device = FiscalPrinter(conf.brand(), conf.model(), conf.port())

  def open(self):
    self._device.open()

  def cancel(self):
    self._device.cancel()

  def cancel_item(self, item_id):
    self._device.cancel_item(item_id)

  def close(self):
    self._device.close()

  def totalize(self):
    self._device.totalize()

  def printer_id(self):
    self._device.printer_id()

  def summarize(self):
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
    self._device.close_till()


  def add_item(self, code, description, price, taxcode, quantity, unit, discount, surcharge, unit_desc):
    quantity = Decimal(quantity)
    unit = UNIT_CUSTOM 
    discount = Decimal(discount)
    surcharge = Decimal(surcharge)
    self._device.add_item(code, description, price, taxcode,
                          quantity, unit, discount, surcharge, 
                          unit_desc)

  def add_payment(self):
    self._device.add_payment()

def main():
  command = sys.argv[1]
  parameters = sys.argv[2:]
  printer = Printer(printer_conf)

  def printer_id():
    print 'printer01' 

  def summarize():
    printer.summarize()

  def till_add_cash(): 
    value = parameters[0]
    printer.till_add_cash(value)

  def till_remove_cash(): 
    value = parameters[0]
    printer.till_remove_cash(value)

  def close_till():
    is_today = parameters[0]
    printer.close_till(is_today)

  def open():
    printer.open()

  def cancel():
    printer.cancel()

  def add_item():
    ( code, description, price, taxcode, 
      quantity, unit, discount, surcharge, 
      unit_desc ) = parameters

    printer.add_item(
      code, description, price, taxcode, 
      quantity, unit, discount, surcharge,
      unit_desc)

  def add_payment():
    printer.add_payment()

 
  def errhandler ():
     print "Your command doesn't exist"
 
# set up a dictionary of actions
 
  takeaction = {
    "printer_id": printer_id,
    "summarize": summarize,
    "till_add_cash": till_add_cash,
    "till_remove_cash": till_remove_cash,
    "close_till": close_till,
    "open": open,
    "cancel": cancel,
    "add_item": add_item,
    "add_payment": add_payment,
  }
 
  takeaction.get(command,errhandler)()

try:
  if __name__ == "__main__":
    main()
    print COMMAND_OK
except:
#  sys.exit(dict[sys.exc_type])
  print "SSSSSSSSSSSSSSSSAAAAAAAAAAAAAAAAAAIIIIIIIIIIIIIIIIDDDDDDDDDDDDDDDDAAAAAAAAAAAAAAAAAAAAAAA"
  print dict[sys.exc_type]


