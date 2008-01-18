import Pyro.core
import sys
from stoqdrivers.exceptions import *

COMMAND_OK =  1
SEPARATOR = ';'

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
  DriverError: 124,
}


# finds object automatically if you're running the Name Server.

def main():
  command = sys.argv[1]
  parameters = ''
  if len(sys.argv) > 2:
    parameters = sys.argv[2].split(SEPARATOR)
  printer = Pyro.core.getProxyForURI("PYRONAME://abelo_printer")

  def printer_id():
    return 'printer01'

  def summarize():
    return printer.summarize()

  def till_add_cash():
    value = parameters[0]
    return printer.till_add_cash(value)

  def till_remove_cash():
    value = parameters[0]
    return printer.till_remove_cash(value)

  def close_till():
    is_today = parameters[0]
    return printer.close_till(is_today)

  def open():
    return printer.open()

  def cancel():
    return printer.cancel()

  def add_item():
    ( code, description, price, taxcode,
      quantity, unit, discount, surcharge,
      unit_desc ) = parameters

    return printer.add_item(
      code, description, price, taxcode,
      quantity, unit, discount, surcharge,
      unit_desc)

  def add_payment():
    (payment_method, description, value ) = parameters
    return printer.add_payment(payment_method, description, value)

  def totalize():
    return printer.totalize()

  def errhandler ():
    return "Your command doesn't exist"

# set up a dictionary of actions

  takeaction = {
    "printer_id": printer_id,
    "summarize": summarize,
    "till_add_cash": till_add_cash,
    "till_remove_cash": till_remove_cash,
    "totalize": totalize,
    "close_till": close_till,
    "open": open,
    "cancel": cancel,
    "add_item": add_item,
    "add_payment": add_payment,
  }

  return takeaction.get(command,errhandler)()

try:
  if __name__ == "__main__":
    a = main()
    print COMMAND_OK
    print a
except: 
  print dict[sys.exc_type]
  print sys.exc_info()[1]
