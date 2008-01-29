class Sintegra < ActiveRecord::Base

  attr_accessor :file_name, :organization


  def initialize(organization, file_name = "sintegra.txt", *args)
    super(*args)
    organization = organization
    self.file_name = file_name
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
    # Field name, field length and format numeric or alphanumeric:
    # 1. Type 2 N;
    string_register_10 = "10"
    # 2. CNPJ/MF 14 N;
    string_register_10 << cnpj.to_s[0..13].rjust(14,'0')
    # 3. State registration 14 A; 
    string_register_10 << state_registration.to_s[0..13].ljust(14)
    # 4. Organization name 35 A;
    string_register_10 << name.to_s[0..34].ljust(35)
    # 5. city 30 A; 
    string_register_10 << city.to_s[0..29].ljust(30)
    # 6. Federation Unit 2 A; 
    string_register_10 << federation_unit.to_s[0..1].ljust(2)
    # 7. Fax 10 N;
    string_register_10 << fax.to_s[0..9].rjust(10,'0')
    # 8. Inital Date 8 N;
    string_register_10 << initial_date.to_s.delete('-')
    # 9. Final Date 8 N;
    string_register_10 << final_date.to_s.delete('-')
    # 10. Identification Code of File Structure 1 A;
    string_register_10 << structure_identification_code.to_s[0]
    # 11. Nature Identification Code 1 A;
    string_register_10 << nature_identification_code.to_s[0] 
    # 12. Purpose Code 1 A.
    string_register_10 << purpose_code[0] << "\n"
    return string_register_10;
  end

  # Register 11 - Organization Additional Inforamtions 
  def generate_register_11( public_park, number, complement, quarter, zip_code,
                            contact_name, phone )
    # Field name, field length and format numeric or alphanumeric:
    # 1. Type 2 N;
    string = "11"
    # 2. Public Parck (Addres) 34 A;
    string << public_park.to_s[0..33].ljust(34)
    # 3. Number 5 N;
    string << number.to_s[0..4].rjust(5,'0')
    # 4. Complement 22 A;
    string << complement.to_s[0..21].ljust(22)
    # 5. Quarter 15 A;
    string << quarter.to_s[0..14].ljust(15)
    # 6. Zip Code (CEP) 8 N;
    string << zip_code.to_s[0..7].rjust(8,'0')
    # 7. Contact Name 28 A;
    string << contact_name.to_s[0..27].ljust(28)
    # 8. Phone 12 N.
    string << phone.to_s[0..11].rjust(12,'0') << "\n"
    return string
  end

  # Register 60 - Master (60M): Equipament Identifier 
  def generate_register_60M( issue_date, serial_numer, equipment_code, 
                             fiscal_model, document_first_number,
                             document_last_number, reduction_count_number,
                             operation_restart_count, raw_sale_value,
                             total_value )
    # Field name, field length and format numeric or alphanumeric:
    # 1. Type 2 N;
    string = "60"
    # 2. Subtype 1 A;
    string << 'M'
    # 3. Issue date 8 N;
    string << issue_date.to_s.delete('-')
    # 4. Equipment Serial Number of Manufacturing 20 A;
    string << serial_numer.to_s[0..19].ljust(20)
    # 5. Number Attributed by The Organization to the Equipment 3 N;
    string << equipment_code.to_s[0..2].rjust(3,'0')
    # 6. Model Code of Fiscal Document 2 A;
    string << fiscal_model.to_s[0..1].ljust(2)
    # 7. Number of The First Fiscal Document at the Day 6 N;
    string << document_first_number.to_s[0..5].rjust(6,'0')
    # 8. Number of The Last Fiscal Document at the Day 6 N;
    string << document_last_number.to_s[0..5].rjust(6,'0')
    # 9. Counter's Number of Z Reduction (CRZ) 6 N;
    string << reduction_count_number.to_s[0..5].rjust(6,'0')
    # 10. Counter of Accumulated Value of Operation of Restart (CRO) 3 N;
    string << operation_restart_count.to_s[0..2].rjust(3,'0')
    # 11. Accumulated Value in the Totalizer of Raw Sale 16 N;
    string << raw_sale_value.to_s[0..15].rjust(16,'0')
    # 12. Accumulated Value in the General Totalizer 16 N;
    string << total_value.to_s[0..15].rjust(16,'0')
    # 13. Blanks 37 A;
    string << "".ljust(37,' ') << "\n"
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
    string << equipment_serie.to_s[0..19].ljust(20)
    # 5. Identifier of Tax Situation 4 A;
    string << tax_identifier.to_s[0..3].ljust(4)
    # 6. Accumulated Value in the end of Day in the Totalizer of Tax Situation 12 N;
    string << value.to_s[0..11].rjust(12,'0')
    # 7. Blanks 79 A;
    string << "".ljust(79,' ') << "\n"
    return string
  end

  # Register 60 - Monthly Summary (60R)
  def generate_register_60R( issue_date, product, product_amount, 
                             product_value, icms, product_tax )
    # Field name, field length and format numeric or alphanumeric:
    # 1. Type 2 N;
    string = "60"
    # 2. Subtype 1 A;
    string << "R"
    # 3. Issue Date of Fiscal Documents 8 N;
    string << issue_date.to_s.delete('-')
    # 4. Product/Service Code of Organization 14 A;
    string << product.to_s[0..13].ljust(14)
    # 5. Product Amount in the month (with three decimals) 16 N;
    string << product_amount.to_s[0..15].rjust(16,'0')
    # 6. Liquid Value of Product (with two decimals) 16 N;
    string << product_value.to_s[0..15].rjust(16,'0')
    # 7. Base of Calc ICMS - accumaleted value (with two decimals) 16 N; 
    string << icms.to_s[0..15].rjust(16,'0')
    # 8. Tax Situation of Product (with two decimals) 4 A;
    string << product_tax.to_s[0..3].ljust(4)
    # 9. Blanks 54 A;
    string << "".ljust(54,' ') << "\n"
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
    string << cnpj.to_s[0..13].rjust(14,'0')
    # 3. State Registration 14 A;
    string << state_registration.to_s[0..13].ljust(14)
    # 4. Issue or Receiver Date 8 N;
    string << issue_date.to_s[0..7].rjust(8,'0')
    # 5. Federation Unit 2 A;
    string << uf.to_s[0..1]
    # 6. Fiscal Note Model 2 N;
    string << model.to_s[0..1].rjust(2,'0')
    # 7. Serie of Fiscal Note 3 A;
    string << serie.to_s[0..2].ljust(3)
    # 8. Number of Fiscal Note 6 N;
    string << number.to_s[0..5].rjust(6,'0')
    # 9. Fiscal Code of Operation 4 N;
    string << code_op.to_s[0..3].rjust(4,'0')
    # 10. Fiscal Note Sender (P-proprio/T-terceiro) 1 A;
    string << sender.to_s[0]
    # 11. Total Value of Fiscal Note (with two decimals) 13 N;
    string << total.to_s[0..12].rjust(13,'0')
    # 12. Calc Base of ICMS (with two decimals) 13 N;
    string << base_icms.to_s[0..12].rjust(13,'0')
    # 13. ICMS Value (with two decimals) 13 N;
    string << icms.to_s[0..12].rjust(13,'0')
    # 14. Exempt or not Taxed 13 N;
    string << tax.to_s[0..12].rjust(13,'0')
    # 15. Others (with two decimals) 13 N;
    string << others.to_s[0..12].rjust(13,'0')
    # 16. Aliquot of ICMS 4 N;
    string << aliquot.to_s[0..3].rjust(4,'0')
    # 17. Fiscal Note Situation 1 A;
    string << situation.to_s[0] << "\n"
    return string
  end

  # Register 54 - Product 
  def generate_register_54( cnpj, note_model, note_serie, note_number, 
                            fiscal_code, tax, item, product_code, 
                            product_amount, product_value, discount, icms_base,
                            icms_subst, ipi, icms )
    # Field name, field length and format numeric or alphanumeric:
    # 1. Type 2 N;
    string = "54"
    # 2. CNPJ 14 N;
    string << cnpj.to_s[0..13].rjust(14,'0')
    # 3. Model Code of Fisca Note 2 N;
    string << note_model.to_s[0..1].rjust(2,'0')
    # 4. Fiscal Note Serie 3 A;
    string << note_serie.to_s[0..2].ljust(3)
    # 5. Number of Fiscal Note 6 N;
    string << note_number.to_s[0..5].rjust(6,'0')
    # 6. Fiscal Code of Operation 4 N;
    string << fiscal_code.to_s[0..3].rjust(4,'0')
    # 7. Tax Situation Code 4 A;
    string << tax.to_s[0..2].rjust(3,'0')  
    # 8. Order Number of Item 3 N;
    string << item.to_s[0..2].rjust(3,'0')
    # 9. Product Code of Organizaton 14 A;
    string << product_code.to_s[0..13].ljust(14)
    # 10. Product Amount (with three decimals) 11 N;
    string << product_amount.to_s[0..10].rjust(11,'0')
    # 11. Product Value (with two decimals) 12 N;
    string << product_value.to_s[0..11].rjust(12,'0')
    # 12. Value of Discount (with two decimals) 12 N;
    string << discount.to_s[0..11].rjust(12,'0')
    # 13. Calc Base of ICMS (with two decimals) 12 N;
    string << icms_base.to_s[0..11].rjust(12,'0')
    # 14. Calc Base of ICMS for substituition (with two decimals) 12 N;
    string << icms_subst.to_s[0..11].rjust(12,'0')
    # 15. IPI Value (with two decimals) 12 N;
    string << ipi.to_s[0..11].rjust(12,'0') 
    # 16. ICMS Aliquot (with two decimals) 4 N;
    string << icms.to_s[0..3].rjust(4,'0') << "\n"
    return string
  end

  # Register 75 - Product or Service Code
  def generate_register_75( initial_date, final_date, product_code, 
                            nomenclature, product_description, unit, ipi, icms,
                            reduction_icms, base_icms )
    # Field name, field length and format numeric or alphanumeric:
    # 1. Type 2 N; 
    string = "75"
    # 2. Initial Date 8 N;
    string << initial_date.to_s.delete('-')
    # 3. Final Date 8 N;
    string << final_date.to_s.delete('-')
    # 4. Product Code 14 A;
    string << product_code.to_s[0..13].ljust(14)
    # 5. Codification of Nomenclature in Mercosul 8 A;
    string << nomenclature.to_s[0..7].ljust(8)
    # 6. Product Description 53 A;
    string << product_description.to_s[0..52].ljust(53)
    # 7. Unit of Measure of Commercialization 6 A;
    string << unit.to_s[0..5].ljust(6)
    # 8. IPI Aliquot 5 N;
    string << ipi.to_s[0..4].rjust(5,'0')
    # 9. ICMS Aliquot 4 N;
    string << icms.to_s[0..3].rjust(4,'0')
    # 10. Reduction of Calc Base of ICMS 5 N;
    string << reduction_icms.to_s[0..4].rjust(5,'0')
    # 11. Calc Base of ICMS of Tax Substitution 13 N;
    string << base_icms.to_s[0..12].rjust(13,'0') << "\n"
    return string
  end

  # Register 90 - File Totalization 
  def generate_register_90( cgc, registration, type, total, number )  
    # Field name, field length and format numeric or alphanumeric:
    # 1. Type 2 N; 
    string = "90"
    # 2. Organization CGC 14 N;
    string << cgc.to_s[0..13].rjust(14,'0')
    # 3. State Registration 14 A;
    string << registration.to_s[0..13].ljust(14)
    # 4. Type for totalize 2 N;
    string << type.to_s[0..1].rjust(2,'0')
    # 5. Total of Registers 8 N;
    string << total.to_s[0..7].rjust(8,'0')
    # 6. Number of Type 90 Registers 1 N; 
    string << number.to_s << "\n"
    return string
  end

  def generate_sintegra_ecf

    # Structure according to "Convenio ICMS 57/95" in the version of "Convenio ICMS 76/03"
    @structure_identification_code = 3
    # 1 Interstates only operations under Tax Replacement
    # 2 Interstates - operations with or without Tax Replacement
    # 3 Totality of the operations of the informant
    @nature_identification_code = 1
    # 1 Normal 
    # 2 Rectification total file: total replacement of information provided by the taxpayer for this period
    # 3 Rectification additive of file: addition of information not included in files already submitted
    # 5 Undoment file of information relating to transactions / services not effective. In this case, the file should contain, in addition to the record type 10 and type 90, only the records relating to operations / benefits not effective.
    @purpose_code = 1



    sintegra = generate_register_10( self.organization.cnpj, 
                          "444444444",
                          self.organization.name, 
                          "Salvador", 
                          "BA",
                          "33312299",
                          @initial_date,
                          @final_date, 
                          "1", 
                          "1",
                          '1')

  end

  def generate_sintegra
    puts " -- test --"
    sintegra = generate_register_10( self.organization.cnpj, 
                          "444444444",
                          self.organization.name, 
                          "Salvador", 
                          "BA",
                          "33312299",
                          @initial_date,
                          @final_date, 
                          "1", 
                          "1",
                          '1')
    sintegra << generate_register_11( "Rua Caetano Moura",
                          "22",
                          "Ed. Norma Camozatto, Sala 301",
                          "Canela",
                          "40230200",
                          "Orivaldo Santana Jr",
                          "07133312299" )
    sintegra << generate_register_50( self.organization.cnpj,
                          "444444444",
                          "20070505", 
                          "BA",
                          "55",
                          "A",
                          "222222",
                          "1234",
                          "P",
                          "131313",
                          "13131313",
                          "131313",
                          "13131313",
                          "131313",
                          "444",
                          "N")
    sintegra << generate_register_54( self.organization.cnpj,
                          "55",
                          "A",
                          "222222",
                          "1234",
                          "111",
                          "22",
                          @product.id,
                          "1",
                          "2",
                          "4010",
                          "1220",
                          "5010",
                          "3010",
                          "222")
    sintegra << generate_register_60A("20070505", 
                          "222222",
                          "123",
                          "444")
    sintegra << generate_register_60M("20070505",
                          "12334567",
                          "123",
                          "55",
                          "1111",
                          "9999",
                          "33",
                          "444",
                          "444",
                          "4445")
    sintegra << generate_register_60R("20070505",
                          "123",
                          "5",
                          "6110",
                          "444",
                          "7445")
    sintegra << generate_register_75( @initial_date,
                          @final_date,
                          @product.id,
                          "Produto",
                          "Produto vendido pela organizacao",
                          "kg",
                          "1230",
                          "1230",
                          "4220",
                          "1231231")
    sintegra << generate_register_90( self.organization.cnpj,
                          "898989",
                          "50",
                          "12",
                          "1")
    f = File.new(@file_name,"w")
    f.write(sintegra)
    f.close 
    return true
  end

end



