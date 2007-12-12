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
  def generate_register_60M( issue_date, serial_numer, equipment_code, 
                             fiscal_document_number, document_first_number,
                             document_last_number, reduction_count_number,
                             operation_restart_count, raw_sale_value,
                             total_value, blanks )
    # Field name, field length and format numeric or alphanumeric:
    # 1. Type 2 N;
    # 2. Subtype 1 A;
    # 3. Issue date 8 N;
    # 4. Equipment Serial Number of Manufacturing 20 A;
    # 5. Number Attributed by The Organization to the Equipment 3 N;
    # 6. Model Code of Fiscal Document 2 A;
    # 7. Number of The First Fiscal Document at the Day 6 N;
    # 8. Number of The Last Fiscal Document at the Day 6 N;
    # 9. Counter's Number of Z Reduction (CRZ) 6 N;
    # 10. Counter of Accumulated Value of Operation of Restart (CRO) 3 N;
    # 11. Accumulated Value in the Totalizer of Raw Sale 16 N;
    # 12. Accumulated Value in the General Totalizer 16 N;
    # 13. Blanks 37 A;

  end

  # Register 60 - Analytical (60A): Identifier of each Tax Situation in the 
  # End of Day of each Fiscal Sender Equipment of Fiscal Coupom 
  def generate_register_60A
    # Field name, field length and format numeric or alphanumeric:
    # 1. Type 2 N;
    # 2. Subtype 1 A;
    # 3. Issue Date of Fiscal Documents 8 N;
    # 4. Equipment Serial Number of Manufacturing 20 A;
    # 5. Identifier of Tax Situation
    # 6. Accumulated Value in the end of Day in the Totalizer of Tax Situation 12 N;
    # 7. Blanks 79 A;
  end

  # Register 60 - Monthly Summary (60R)
  def generate_register_60R
    # Field name, field length and format numeric or alphanumeric:
    # 1. Type 2 N;
    # 2. Subtype 1 A;
    # 3. Issue Date of Fiscal Documents 8 N;
    # 4. Product/Service Code of Organization 14 A;
    # 5. Product Amount in the month (with three decimals) 16 N;
    # 6. Liquid Value of Product (with two decimals) 16 N;
    # 7. Base of Calc ICMS - accumaleted value (with two decimals) 16 N; 
    # 8. Tax Situation of Product (with two decimals) 4 A;
    # 9. Blanks 54 A;
  end

  # Register 50 - Fiscal Note
  def generate_register_50
    # Field name, field length and format numeric or alphanumeric:
    # 1. Type 2 N;
    # 2. CNPJ 14 N;
    # 3. State Registration 14 A;
    # 4. Issue or Receiver Date 8 N;
    # 5. Federation Unit 2 A;
    # 6. Fiscal Note Model 2 N;
    # 7. Serie of Fiscal Note 3 A;
    # 8. Number of Fiscal Note 6 N;
    # 9. Fiscal Code of Operation 4 N;
    # 10. Fiscal Note Sender (P-proprio/T-terceiro) 4 N;
    # 11. Total Value of Fiscal Note (with two decimals) 13 N;
    # 12. Calc Base of ICMS (with two decimals) 13 N;
    # 13. ICMS Value (with two decimals) 13 N;
    # 14. Exempt or not Taxed 13 N;
    # 15. Others (with two decimals) 13 N;
    # 16. Aliquot of ICMS 4 N;
    # 17. Fiscal Note Situation 1 A;
  end

  # Register 54 - Product 
  def generate_register_54
    # Field name, field length and format numeric or alphanumeric:
    # 1. Type 2 N;
    # 2. CNPJ 14 N;
    # 3. Model Code of Fisca Note 2 N;
    # 4. Fiscal Note Serie 3 A;
    # 5. Number of Fiscal Note 6 N;
    # 6. Fiscal Code of Operation 4 N;
    # 7. Tax Situation Code 4 N;
    # 8. Order Number of Item 3 N;
    # 9. Product Code of Organizaton 14 A;
    # 10. Product Amount (with three decimals) 12 N;
    # 11. Product Value (with two decimals) 12 N;
    # 12. Value of Discount (with two decimals) 12 N;
    # 13. Calc Base of ICMS (with two decimals) 12 N;
    # 14. Calc Base of ICMS for substituition (with two decimals) 12 N;
    # 15. IPI Value (with two decimals) 4 N;

  end

  # Register 75 - Product or Service Code
  def generate_register_75 
    # Field name, field length and format numeric or alphanumeric:
    # 1. Type 2 N; 
    # 2. Initial Date 8 N;
    # 3. Final Date 8 N;
    # 4. Product Code 14 A;
    # 5. Codification of Nomenclature in Mercosul 8 A;
    # 6. Product Description 53 A;
    # 7. Unit of Measure of Commercialization 6 A;
    # 8. IPI Aliquot 5 N;
    # 9. ICMS Aliquot 4 N;
    # 10. Redution of Calc Base of ICMS 5 N;
    # 11. Calc Base of ICMS of Tax Substitution 13 N;

  end

  # Register 90 - File Totalization 
  def generate_register_75 
    # Field name, field length and format numeric or alphanumeric:
    # 1. Type 2 N; 
    # 2. Organization CGC 14 N;
    # 3. State Register 14 A;
    # 4. Type for totalize 2 N;
    # 5. Total of Registers 8 N;
    # 6. Number of Type 90 Register 1 N; 
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



