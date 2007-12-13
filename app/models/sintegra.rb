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
    string_register_10 << cnpj.to_s.rjust(14,'0')
    # 3. State registration 14 A; nao tem!!!
    string_register_10 << state_registration.ljust(14)
    # 4. Organization name 35 A; Razao social???
    string_register_10 << name.ljust(35)
    # 5. city 30 A; nao tem!!!
    string_register_10 << city.ljust(30)
    # 6. Federation Unite 2 A; 
    string_register_10 << federation_unit.ljust(2)
    # 7. Fax 10 N;
    string_register_10 << fax.to_s.rjust(10,'0')
    # 8. Inital Date 8 N;
    string_register_10 << initial_date.to_s.rjust(8,'0')
    # 9. Final Date 8 N;
    string_register_10 << final_date.to_s.rjust(8,'0')
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
    string = ''
    # 1. Type 2 N;
    string << "10"
    # 2. Public Parck (Addres) 34 A;
    string << public_park.ljust(34)
    # 3. Number 5 N;
    string << number.to_s.rjust(5,'0')
    # 4. Complement 22 A;
    string << complement.ljust(22)
    # 5. Quarter 15 A;
    string << quarter.ljust(15)
    # 6. Zip Code (CEP) 8 N;
    string << zip_code.to_s.rjust(8,'0')
    # 7. Contact Name 28 A;
    string << contact_name.ljust(28)
    # 8. Phone 12 N.
    string << phone.to_s.rjust(12,'0')
    return string
  end

  # Register 60 - Master (60M): Equipament Identifier 
  def generate_register_60M( issue_date, serial_numer, equipment_code, 
                             fiscal_model, document_first_number,
                             document_last_number, reduction_count_number,
                             operation_restart_count, raw_sale_value,
                             total_value, blanks )
    # Field name, field length and format numeric or alphanumeric:
    string = ''
    # 1. Type 2 N;
    string << "60"
    # 2. Subtype 1 A;
    string << 'M'
    # 3. Issue date 8 N;
    string << issue_date.to_s.delete('-')
    # 4. Equipment Serial Number of Manufacturing 20 A;
    string << serial_numer.to_s.ljust(20)
    # 5. Number Attributed by The Organization to the Equipment 3 N;
    string << equipment_code.to_s.rjust(3,'0')
    # 6. Model Code of Fiscal Document 2 A;
    string << fiscal_model.to_s.ljust(2)
    # 7. Number of The First Fiscal Document at the Day 6 N;
    string << document_first_number.to_s.rjust(6,'0')
    # 8. Number of The Last Fiscal Document at the Day 6 N;
    string << document_last_number.to_s.rjust(6,'0')
    # 9. Counter's Number of Z Reduction (CRZ) 6 N;
    string << reduction_count_number.to_s.rjust(6,'0')
    # 10. Counter of Accumulated Value of Operation of Restart (CRO) 3 N;
    string << operation_restart_count.to_s.rjust(3,'0')
    # 11. Accumulated Value in the Totalizer of Raw Sale 16 N;
    string << raw_sale_value.to_s.rjust(16,'0')
    # 12. Accumulated Value in the General Totalizer 16 N;
    string << total_value.to_s.rjust(16,'0')
    # 13. Blanks 37 A;
    string << "".ljust(37,' ')
    return string
  end

  # Register 60 - Analytical (60A): Identifier of each Tax Situation in the 
  # End of Day of each Fiscal Sender Equipment of Fiscal Coupom 
  def generate_register_60A(issue_date, equipment_serie, tax_identifier, value)
    # Field name, field length and format numeric or alphanumeric:
    # 1. Type 2 N;
    string = "60" 
    # 2. Subtype 1 A;
    string << "A"
    # 3. Issue Date of Fiscal Documents 8 N;
    string << issue_date.to_s.delete('-')
    # 4. Equipment Serial Number of Manufacturing 20 A;
    string << equipment_serie.to_s.ljust(20)
    # 5. Identifier of Tax Situation 4 A;
    string << tax_identifier.to_s.ljust(4)
    # 6. Accumulated Value in the end of Day in the Totalizer of Tax Situation 12 N;
    string << value.to_s.rjust(12,'0')
    # 7. Blanks 79 A;
    string << "".ljust(79,' ')
    return string
  end

  # Register 60 - Monthly Summary (60R)
  def generate_register_60R( issue_date, product, product_amount, 
                             product_value, icms, product_tax )
    # Field name, field length and format numeric or alphanumeric:
    # 1. Type 2 N;
    string = "60"
    # 2. Subtype 1 A;
    string << "A"
    # 3. Issue Date of Fiscal Documents 8 N;
    string << issue_date.to_s.delete('-')
    # 4. Product/Service Code of Organization 14 A;
    string << product.to_s.ljust(14)
    # 5. Product Amount in the month (with three decimals) 16 N;
    string << product_amount.to_s.rjust(16,'0')
    # 6. Liquid Value of Product (with two decimals) 16 N;
    string << product_value.to_s.rjust(16,'0')
    # 7. Base of Calc ICMS - accumaleted value (with two decimals) 16 N; 
    string << icms.to_s.rjust(16,'0')
    # 8. Tax Situation of Product (with two decimals) 4 A;
    string << product_tax.to_s.ljust(4)
    # 9. Blanks 54 A;
    string << "".ljust(54,' ')
    return string
  end

  # Register 50 - Fiscal Note
  def generate_register_50( cnpj, state_registration, issue_date, uf, model, 
                            serie, number, code_op, sender, total, base_icms,
                            icms, tax, others, aliquot, situation ) 
    # Field name, field length and format numeric or alphanumeric:
    # 1. Type 2 N;
    string = "50"
    # 2. CNPJ 14 N;
    string << cnpj.to_s.rjust(14,'0')
    # 3. State Registration 14 A;
    string << state_registration.ljust(14)
    # 4. Issue or Receiver Date 8 N;
    string << issue_date.to_s.rjust(8,'0')
    # 5. Federation Unit 2 A;
    string << uf
    # 6. Fiscal Note Model 2 N;
    string << model.to_s.rjust(2,'0')
    # 7. Serie of Fiscal Note 3 A;
    string << serie.ljust(3)
    # 8. Number of Fiscal Note 6 N;
    string << number.to_s.rjust(6,'0')
    # 9. Fiscal Code of Operation 4 N;
    string << code_op.to_s.rjust(4,'0')
    # 10. Fiscal Note Sender (P-proprio/T-terceiro) 1 A;
    string << sender.to_s
    # 11. Total Value of Fiscal Note (with two decimals) 13 N;
    string << total.to_s.rjust(13,'0')
    # 12. Calc Base of ICMS (with two decimals) 13 N;
    string << base_icms.to_s.rjust(13,'0')
    # 13. ICMS Value (with two decimals) 13 N;
    string << icms.to_s.rjust(13,'0')
    # 14. Exempt or not Taxed 13 N;
    string << tax.to_s.rjust(13,'0')
    # 15. Others (with two decimals) 13 N;
    string << others.to_s.rjust(13,'0')
    # 16. Aliquot of ICMS 4 N;
    string << aliquot.to_s.rjust(4,'0')
    # 17. Fiscal Note Situation 1 A;
    string << situation.to_s
    return string
  end

  # Register 54 - Product 
  def generate_register_54( cnpj, note_model, note_serie, note_number, 
                            fiscal_code, tax, item, product_code, 
                            product_amount, product_value, discount, icms,
                            icms_subst, ipi )
    # Field name, field length and format numeric or alphanumeric:
    # 1. Type 2 N;
    string = "54"
    # 2. CNPJ 14 N;
    string << cnpj.to_s.rjust(14,'0')
    # 3. Model Code of Fisca Note 2 N;
    string << note_model.to_s.rjust(2,'0')
    # 4. Fiscal Note Serie 3 A;
    string << note_serie.to_s.ljust(3)
    # 5. Number of Fiscal Note 6 N;
    string << note_number.to_s.rjust(6,'0')
    # 6. Fiscal Code of Operation 4 N;
    string << fiscal_code.to_s.rjust(4,'0')
    # 7. Tax Situation Code 4 N;
    string << tax.to_s.rjust(4,'0')  
    # 8. Order Number of Item 3 N;
    string << item.to_s.rjust(3,'0')
    # 9. Product Code of Organizaton 14 A;
    string << product_code.ljust(14)
    # 10. Product Amount (with three decimals) 12 N;
    string << product_amount.to_s.rjust(12,'0')
    # 11. Product Value (with two decimals) 12 N;
    string << product_value.to_s.rjust(12,'0')
    # 12. Value of Discount (with two decimals) 12 N;
    string << discount.to_s.rjust(12,'0')
    # 13. Calc Base of ICMS (with two decimals) 12 N;
    string << icms.to_s.rjust(12,'0')
    # 14. Calc Base of ICMS for substituition (with two decimals) 12 N;
    string << icms_subst.to_s.rjust(12,'0')
    # 15. IPI Value (with two decimals) 4 N;
    string << ipi.to_s.rjust(4,'0')
    return string
  end

  # Register 75 - Product or Service Code
  def generate_register_75( initial_date, final_date, product_code, 
                            nomenclature, product_description, unit, ipi, icms,
                            reduction_icms, base_icms )
    # Field name, field length and format numeric or alphanumeric:
    # 1. Type 2 N; 
    string = "74"
    # 2. Initial Date 8 N;
    string << initial_date.to_s.delete('-')
    # 3. Final Date 8 N;
    string << final_date.to_s.delete('-')
    # 4. Product Code 14 A;
    string << product_code.to_s.ljust(14)
    # 5. Codification of Nomenclature in Mercosul 8 A;
    string << nomenclature.to_s.ljust(8)
    # 6. Product Description 53 A;
    string << product_description.ljust(53)
    # 7. Unit of Measure of Commercialization 6 A;
    string << unit.to_s.ljust(6)
    # 8. IPI Aliquot 5 N;
    string << ipi.to_s.rjust(5,'0')
    # 9. ICMS Aliquot 4 N;
    string << icms.to_s.rjust(4,'0')
    # 10. Reduction of Calc Base of ICMS 5 N;
    string << reduction_icms.to_s.rjust(5,'0')
    # 11. Calc Base of ICMS of Tax Substitution 13 N;
    string << base_icms.to_s.rjust(13,'0')
    return string
  end

  # Register 90 - File Totalization 
  def generate_register_90( cgc, registration, type, total, number )  
    # Field name, field length and format numeric or alphanumeric:
    # 1. Type 2 N; 
    string = "90"
    # 2. Organization CGC 14 N;
    string << cgc.to_s.rjust(14,'0')
    # 3. State Registration 14 A;
    string << registrarion.to_s.ljust(14)
    # 4. Type for totalize 2 N;
    string << type.to_s.rjust(2,'0')
    # 5. Total of Registers 8 N;
    string << total.to_s.rjust(8,'0')
    # 6. Number of Type 90 Register 1 N; 
    string << number.to_s
    return string
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



