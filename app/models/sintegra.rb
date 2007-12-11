class Sintegra < ActiveRecord::Base

 attr_accessor :organization

  def initialize(org, *args)
#   super(*args)
    self.organization = org
  end

  def get_modelo_90()
    sin_file = ''
    sin_file = sin_file + self.organization.cnpj
    puts sin_file
  end

  def get_medelo_10()
    string_register_10 = ''
    # Field name and field length:
    # Type 2;
    string_register_10 << "10"
    # CNPJ/MF 14;
    string_register_10 << self.organization.cnpj.rjust(14,'0')
    # State registration 14; nao tem!!!
    string_register_10 << "2132142".ljust(14)
    # Organization name 35; Razao social???
    string_register_10 << self.organization.name.ljust(35)
    # city 30; nao tem!!!
    string_register_10 << "Salvador".ljust(30)
    # 
  end
  
  # Register 10 - Organization Informations 
  def generate_register_10( cnpj, state_registration, name, city, 
                            federation_unit, fax, initial_date, final_date, 
                            structure_identification_code, 
                            nature_identification_code, purpose_code )   
    string_register_10 = ''
    # Field name, field length and format numeric or alphanumeric:
    # 1. Type 2 N;
    string_register_10 << "10"
    # 2. CNPJ/MF 14 N;
    string_register_10 << cnpj.rjust(14,'0')
    # 3. State registration 14 A; nao tem!!!
    string_register_10 << state_registration.ljust(14)
    # 4. Organization name 35 A; Razao social???
    string_register_10 << name.ljust(35)
    # 5. city 30 A; nao tem!!!
    string_register_10 << city.ljust(30)
    # 6. Federation Unite 2 A; 
    string_register_10 << federation_unit.ljsut(2)
    # 7. Fax 10 N;
    string_register_10 << fax.rjust(10,'0')
    # 8. Inital Date 8 N;
    string_register_10 << initial_date.rjust(8,'0')
    # 9. Final Date 8 N;
    string_register_10 << final_date.rjust(8,'0')
    # 10. Structure Identification Code 1 A;
    string_register_10 << structure_identification_code  
    # 11. Nature Identification Code 1 A;
    string_register_10 << nature_identification_code 
    # 12. Purpose Code 1 A.
    string_register_10 << purpose_code 
    return string_register_10;
  end

  # Register 11 - Organization Additional Inforamtions 
  def generate_register_11( public_park, number, complement, quarter, zip_code,
                            contact_name, phone )
    # Field name, field length and format numeric or alphanumeric:
    # 1. Type 2 N;
    # 2. Public Parck (Addres) 34 A;
    # 3. Number 5 N;
    # 4. Complement 22 A;
    # 5. Quarter 15 A;
    # 6. Zip Code (CEP) 8 N;
    # 7. Contact Name 28 A;
    # 8. Phone 12 N.
    
  end

  # Register 60 - Master (60M): Equipament Identifier 
  def generate_register_60M( issue_date, serial_numer, equipament_code, 
                             fiscal_document_number, document_first_number,
                             document_last_number, reduction_count_number,
                             operation_restart_count, raw_sale_value,
                             total_value, blanks )
    # Field name, field length and format numeric or alphanumeric:


  end

  def generate_sintegra
    puts " -- test --"
    generate_register_10( self.organization.cnpj, 
                          "212313453",
                          self.organization.name, 
                          "Salvador", 
                          "BA",
                          "33312299",
                          "20070125",
                          "20070225", 
                          "1", 
                          "1",
                          '1') 

  end

end



